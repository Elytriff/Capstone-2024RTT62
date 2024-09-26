package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.config.AuthenticatedUserUtilities;
import com.qvainside.CapstoneProject.database.dao.CustomerDAO;
import com.qvainside.CapstoneProject.database.dao.UserRoleDAO;
import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.database.entity.Order;
import com.qvainside.CapstoneProject.form.RegisterCustomerFormBean;
import com.qvainside.CapstoneProject.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@RequestMapping("/customer")
@Controller
public class CustomerController {
    @Autowired
    private CustomerDAO customerDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private CustomerService customerService;

    @Autowired
    AuthenticatedUserUtilities authenticatedUserUtilities;

    @Autowired
    private UserRoleDAO userRoleDAO;

    //-----------------------------------------Register Customer -------------------------------------------

    @PostMapping("/registerCustomer")
    public ModelAndView registerCustomer(@Valid RegisterCustomerFormBean form, BindingResult bindingResult, HttpSession session) {
        ModelAndView response = new ModelAndView("registrationPage");

        try {
            if (form.getId() == null) {
                Customer c = customerDAO.findByEmailIgnoreCase(form.getEmail());
                if (c != null) {
                    bindingResult.rejectValue("email", "email", "Email already exists");
                }
            }
            // Verify that the password and repeat password match
            if (!form.getPassword().equals(form.getRepeatPassword())) {
                bindingResult.rejectValue("repeatPassword", "repeatPassword", "Passwords do not match");
            }

            if (bindingResult.hasErrors()) {
                for (ObjectError error : bindingResult.getAllErrors()) {
                    //This iterates over all the errors and log them
                    log.debug("Validation error : " + ((FieldError) error).getField() + error.getDefaultMessage());
                }
                response.addObject("bindingResult", bindingResult);
                response.setViewName("registrationPage");
                response.addObject("form", form);
                return response;
            }
            Customer customer = customerService.createCustomer(form);
            // this manual authentication will automatically log in the user after registration
            authenticatedUserUtilities.manualAuthentication(session, form.getEmail(), form.getPassword());
            response.setViewName("redirect:/customer/customerProfile");
            return response;

        } catch (DataAccessException e) {
            log.error("Database error while registering customer", e);
            response.addObject("message", "An error occurred while processing your request. Please try again later.");
            return response;
        } catch (AuthenticationException e) {
            log.error("Authentication error while registering customer", e);
            response.addObject("message", "Authentication failed. Please try again.");
            return response;
        }
    }
    //-----------------------------------------Customer Profile -------------------------------------------

    @GetMapping("/customerProfile")
    public ModelAndView customerDetails() {
        ModelAndView response = new ModelAndView("customer/customerProfile");

        try {
            Customer currentCustomer = authenticatedUserUtilities.getCurrentUser();

            if (currentCustomer == null) {
                response.setViewName("redirect:/account/loginPage");
                return response;
            }
            response.addObject("customer", currentCustomer);
            return response;
        } catch (DataAccessException e) {
            log.error("Database error while fetching customer profile", e);
            response.addObject("message", "An error occurred while loading your profile. Please try again later.");
            return response;
        }
    }

    //-----------------------------------------Edit Customer -------------------------------------------

    @GetMapping("/edit")
    public ModelAndView editCustomer(@RequestParam(required = false) Integer id) {
        ModelAndView response = new ModelAndView("registrationPage");

        RegisterCustomerFormBean form = new RegisterCustomerFormBean();

        if (id != null) {
            Customer customer = customerDAO.findById(id);
            if (customer != null) {
                form.setId(customer.getId());
                form.setName(customer.getName());
                form.setLastName(customer.getLastName());
                form.setCountry(customer.getCountry());
                form.setCity(customer.getCity());
                form.setEmail(customer.getEmail());
                form.setContactNumber(customer.getContactNumber());

                String encodedPassword = passwordEncoder.encode(customer.getPassword());
                form.setPassword(encodedPassword);

                response.addObject("form", form);
            }
        }

        return response;
    }

    //-----------------------------------------Delete Customer -------------------------------------------

    @GetMapping("/delete")
    public ModelAndView deleteCustomer(@RequestParam(required = false) Integer customerId) {
        ModelAndView response = new ModelAndView("customer/customerProfile");

        if (customerId != null) {
            Customer customer = customerDAO.findById(customerId);

            //if customer is not admin, delete customer and set orders as canceled
            Boolean isCustomerAdmin = userRoleDAO.existsByCustomerIdAndRoleName(customerId, "ADMIN");
            if (!isCustomerAdmin) {
                List<Order> orders = customer.getOrders();
                if (!orders.isEmpty()) {
                    for (Order order : orders) {
                        order.setStatus("CANCELED");
                    }
                }
                customerDAO.delete(customer);
                response.setViewName("redirect:/account/loginPage");

            } else { //if customer is admin, return error message
                response.setViewName("redirect:/customer/customerProfile");
                response.addObject("message", " You have and Admin role, you cannot be deleted");
            }

        }

        return response;
    }
}
