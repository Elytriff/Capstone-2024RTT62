package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.database.dao.CustomerDAO;
import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.form.RegisterCustomerFormBean;
import com.qvainside.CapstoneProject.service.CustomerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value = "/registerCustomer", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView registerCustomer(RegisterCustomerFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView("/registrationPage");

        if(form.getId() == null) {
            Customer c = customerDAO.findByEmailContainingIgnoreCase(form.getEmail());
            if (c != null) {
                bindingResult.rejectValue("email", "email","Email already exists");
            }
        }

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError)error).getField() + error.getDefaultMessage());
            }
            response.addObject("bindingResult", bindingResult);
            response.setViewName("/registrationPage");

            response.addObject("form", form);
            return response;
        }else {
            Customer customer = customerService.createCustomer(form);
            response.setViewName("redirect:/customer/profile?id=" + customer.getId());
            return response;
        }
    }

    @GetMapping("/profile")
    public ModelAndView customerDetails(@RequestParam(required = false) Integer id){
        ModelAndView response = new ModelAndView("customer/customerProfile");

        Customer customer = customerDAO.findById(id);
        response.addObject("customer", customer);

        return response;
    }

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
}
