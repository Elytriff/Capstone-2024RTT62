package com.qvainside.CapstoneProject.service;

import com.qvainside.CapstoneProject.database.dao.CustomerDAO;
import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.form.RegisterCustomerFormBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class CustomerService {

    @Autowired
    private CustomerDAO customerDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Customer createCustomer(RegisterCustomerFormBean form){

        Customer customer = customerDAO.findById(form.getId());
        if (customer == null) {
            customer = new Customer();
        }

        customer.setName(form.getName());
        customer.setLastName(form.getLastName());
        customer.setCountry(form.getCountry());
        customer.setCity(form.getCity());
        customer.setEmail(form.getEmail());
        customer.setContactNumber(form.getContactNumber());

        String encodedPassword = passwordEncoder.encode(form.getPassword());
        customer.setPassword(encodedPassword);

        customer = customerDAO.save(customer);
        return customer;
    }

}
