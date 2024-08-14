package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Customer;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;

@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class OrderDAOTest {

//    @Autowired
//    OrderDAO orderDAO;
//
//    @Order(1)
//    @Test
//    public void testCreateNewOrder() {
//        Order order = new Order();
//        order.setCreateDate("new Date().toInstant()");
//        order.setStatus("CART");
//        order.setCustomer(new Customer());
//        order.setOrderdetailList(new ArrayList<>());
//
//        orderDAO.save(order);
//
//        Assertions.assertNotNull(orderDAO.findById(order.getId));
//    }
}
