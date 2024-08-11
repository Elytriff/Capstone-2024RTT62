package com.qvainside.CapstoneProject.service;

import com.qvainside.CapstoneProject.config.AuthenticatedUserUtilities;
import com.qvainside.CapstoneProject.database.dao.OrderDAO;
import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.database.entity.Order;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component
public class OrderService {
    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    AuthenticatedUserUtilities authenticatedUserUtilities;


    public Order newOrder(){

        // seeing if customer is authenticated and catching the customer object
        Customer customer = authenticatedUserUtilities.getCurrentUser();

        Order order = orderDAO.findOrderInCartStatus(customer.getId());
        if ( order == null ) {
            // the user does not have an order in cart status so we need to create one
            order = new Order();
            order.setCustomer(customer);
            order.setStatus("CART");
            order.setCreateDate(new Date());
            orderDAO.save(order);

            log.info("order id: " + order.getId());
        }
        return order;
    }

}
