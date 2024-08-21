# Qvainside Tour Agency Webpage

This is a sample for a webpage that accept tours  requests and manage the users reservations. 

#### Technologies and progamming languages used

![JAVA](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)  ![Hibernate](https://img.shields.io/badge/Hibernate-59666C?style=for-the-badge&logo=Hibernate&logoColor=white "Hibernate") ![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) ![HTML](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) ![CSS](https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white "CSS") ![Javascript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black "Javascript") 

![MySql](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white "MySql") ![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white "Bootstrap") ![IntelijIdea](https://img.shields.io/badge/IntelliJ_IDEA-000000.svg?style=for-the-badge&logo=intellij-idea&logoColor=white "IntelijIdea") ![VisuialStudioCode](https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white "VisuialStudioCode")

<details>
  <summary><strong>Table of Content</strong></summary>
  
  - [Home Page](#home-page)
  - [Registration Page](#registration-page)
  - [Tour Page Sample](#tour-page-sample)
  - [Cart](#cart)
  - [Database ER Diagram](#database-er-diagram)
  - [Sample of Code (Customer Controller)](#sample-of-code-customer-controller)
  
</details>

## <a id="home-page"></a>Home Page
![Qvainside Home Page](https://github.com/Elytriff/Capstone-2024RTT62/blob/main/imagenes/Qvainside%20Home%20Page.png "Qvainside Home Page")

## Registration Page
![Qvainside Registration Page](https://github.com/Elytriff/Capstone-2024RTT62/blob/main/imagenes/Qvainside%20Registration%20Page.png "Qvainside Registration Page")

## Tour Page Sample
![Havana Tour Page](https://github.com/Elytriff/Capstone-2024RTT62/blob/main/imagenes/Havana%20Tour%20Booking%20Page.png "Havana Tour Page")
## Cart
![Cart](https://github.com/Elytriff/Capstone-2024RTT62/blob/main/imagenes/Qvainside%20Cart.png "Cart")

## Database ER Diagram
![ER Diagram](https://github.com/Elytriff/Capstone-2024RTT62/blob/main/imagenes/Qvainside%20Database.png "ER Diagram")

## Sample of Code (Customer Controller)
```java
package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.config.AuthenticatedUserUtilities;
import com.qvainside.CapstoneProject.database.dao.CustomerDAO;
import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.form.RegisterCustomerFormBean;
import com.qvainside.CapstoneProject.service.CustomerService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
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

    @Autowired
    AuthenticatedUserUtilities authenticatedUserUtilities;

    @PostMapping("/registerCustomer")
    public ModelAndView registerCustomer(@Valid RegisterCustomerFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView("registrationPage");

        if (form.getId() == null) {
            Customer c = customerDAO.findByEmailIgnoreCase(form.getEmail());
            if (c != null) {
                bindingResult.rejectValue("email", "email", "Email already exists");
            }
        }

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError) error).getField() + error.getDefaultMessage());
            }
            response.addObject("bindingResult", bindingResult);
            response.setViewName("registrationPage");

            response.addObject("form", form);
            return response;
        } else {
            Customer customer = customerService.createCustomer(form);
            response.setViewName("redirect:/customer/customerProfile");
            return response;
        }
    }

    @GetMapping("/customerProfile")
    public ModelAndView customerDetails() {
        ModelAndView response = new ModelAndView("customer/customerProfile");

        Customer currentCustomer = authenticatedUserUtilities.getCurrentUser();

        if (currentCustomer == null) {
            response.setViewName("redirect:/account/loginPage");
            return response;
        }
        response.addObject("customer", currentCustomer);

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
