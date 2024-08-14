package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Customer;
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CustomerDAOTest {
    @Autowired
    CustomerDAO customerDAO;

    @Order(1)
    @Test
    public void testCreateNewCustomer() {

        Customer customer = new Customer();
        customer.setName("Test");
        customer.setLastName("Doe");
        customer.setEmail("test@gmail.com");
        customer.setCity("Havana");
        customer.setCountry("Cuba");
        customer.setContactNumber("1234567890");
        customer.setPassword("password");

        customerDAO.save(customer);

        Customer customerFromDB = customerDAO.findByEmailIgnoreCase("test@gmail.com");

        Assertions.assertNotNull(customerFromDB);
        Assertions.assertEquals("Test", customerFromDB.getName());
        Assertions.assertEquals("Doe", customerFromDB.getLastName());
        Assertions.assertEquals("Havana", customerFromDB.getCity());
        Assertions.assertEquals("Cuba", customerFromDB.getCountry());
        Assertions.assertEquals("1234567890", customerFromDB.getContactNumber());
        Assertions.assertEquals("password", customerFromDB.getPassword());

    }

    @Order(2)
    @ParameterizedTest
    @ValueSource(strings = {"test@gmail.com", "TEST@GMAIL.COM", "tesT@Gmail.coM"})
    public void shouldFindEmail(String email){
        Assertions.assertNotNull(customerDAO.findByEmailIgnoreCase(email));

    }

    @Order(3)
    @Test
    public void testEditCustomer (){
        Customer customer = customerDAO.findByEmailIgnoreCase("test@gmail.com");
            Assertions.assertNotNull(customer);
            Assertions.assertEquals("Test", customer.getName());
            customer.setName("Test2");// maybe test all the fields
            customerDAO.save(customer);

            Customer customerFromDB = customerDAO.findByEmailIgnoreCase("test@gmail.com");
            Assertions.assertNotNull(customerFromDB);
            Assertions.assertEquals("Test2", customerFromDB.getName());
            Assertions.assertEquals("Doe", customerFromDB.getLastName());
            Assertions.assertEquals("Havana", customerFromDB.getCity());
            Assertions.assertEquals("Cuba", customerFromDB.getCountry());
            Assertions.assertEquals("1234567890", customerFromDB.getContactNumber());
            Assertions.assertEquals("password", customerFromDB.getPassword());

    }

    @Order(4)
    @Test
    public void testDeleteCustomer (){
        Customer customer = customerDAO.findByEmailIgnoreCase("test@gmail.com");
        Assertions.assertNotNull(customer);
        customerDAO.delete(customer);
        Customer customerFromDB = customerDAO.findByEmailIgnoreCase("test@gmail.com");
        Assertions.assertNull(customerFromDB);
    }

}
