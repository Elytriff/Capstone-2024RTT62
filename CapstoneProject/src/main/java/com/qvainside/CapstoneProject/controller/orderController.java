package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.config.AuthenticatedUserUtilities;
import com.qvainside.CapstoneProject.database.dao.OrderDAO;
import com.qvainside.CapstoneProject.database.dao.OrderdetailDAO;
import com.qvainside.CapstoneProject.database.dao.ProductDAO;
import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.database.entity.Order;
import com.qvainside.CapstoneProject.database.entity.OrderDetail;
import com.qvainside.CapstoneProject.database.entity.Product;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class orderController {
    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    AuthenticatedUserUtilities authenticatedUserUtilities;

    @Autowired
    private OrderdetailDAO orderdetailDAO;
    @Autowired
    private com.qvainside.CapstoneProject.service.orderService orderService;

    @GetMapping("/order/orderdetail")
    public ModelAndView orderDetail(@RequestParam Integer orderId) {
        ModelAndView response = new ModelAndView("order/orderdetail");

        List<Map<String,Object>> orderDetails = orderDAO.getOrderDetails(orderId);
        response.addObject("orderDetails", orderDetails);
        return response;
    }

    @GetMapping("/order/addToCart")
    public ModelAndView addToCart(@RequestParam Integer productId) {
        ModelAndView response = new ModelAndView("order/addToCart");

        // first we can look up the product in the database given the incoming productId
        Product product = productDAO.findById(productId);

        Order order = orderService.newOrder();

//        // check if the product is already in the cart
//        OrderDetail orderDetail = orderdetailDAO.isProductInCart(order.getId(), productId);
//        if ( orderDetail == null ) {
//            // this product is not part of this order so we can create a new orderdetails
//            orderDetail = new OrderDetail();
//            orderDetail.setOrder(order);
//            orderDetail.setProduct(product);// dropdown menu?
//            orderDetail.setBookingDate(new Date());// cambiar esto tomarlo del form
//            orderDetail.setDurationHours(1.0);// arreglar esto. pasarlo a INTeger y tomarlo del form
//            orderDetail.setNumberOfPax(1);// cambiar esto tomarlo del form
//            orderDetail.setQuantityOrdered(1);// cambiar esto tomarlo del form
//            // hacer un query
//            orderdetailDAO.save(orderDetail);
//        }else {
//            // the product is already in the cart so we need to increment the quantity
//            orderDetail.setQuantityOrdered(orderDetail.getQuantityOrdered() + 1);
//            orderdetailDAO.save(orderDetail);
//        }

        log.info("product id: " + product.getId());
        return response;
    }



    @GetMapping("/order/checkout")
    public ModelAndView checkout() {
        ModelAndView response = new ModelAndView();

        // get the logged in user
        Customer customer = authenticatedUserUtilities.getCurrentUser();

        // now we need to get the order from the database where the status is 'CART'
        Order order = orderDAO.findOrderInCartStatus(customer.getId());
        if ( order == null ) {
            log.error("There is no order with items in the cart to checktout");
        } else {
            // there was an order with items in the cart so we change the status to COMPLETE
            order.setStatus("COMPLETE");
            orderDAO.save(order);
        }

        response.setViewName("redirect:/order/orderdetail");
        return response;
    }
}


