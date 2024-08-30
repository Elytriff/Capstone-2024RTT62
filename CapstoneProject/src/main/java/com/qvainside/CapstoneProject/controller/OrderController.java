package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.config.AuthenticatedUserUtilities;
import com.qvainside.CapstoneProject.database.dao.OrderDAO;
import com.qvainside.CapstoneProject.database.dao.OrderdetailDAO;
import com.qvainside.CapstoneProject.database.dao.ProductDAO;
import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.database.entity.Order;
import com.qvainside.CapstoneProject.database.entity.OrderDetail;
import com.qvainside.CapstoneProject.database.entity.Product;
import com.qvainside.CapstoneProject.form.OrderDetailFormBean;
import com.qvainside.CapstoneProject.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Slf4j
@Controller
public class OrderController {
    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private ProductDAO productDAO;

    @Autowired
    AuthenticatedUserUtilities authenticatedUserUtilities;

    @Autowired
    private OrderdetailDAO orderdetailDAO;
    @Autowired
    private OrderService orderService;

    @GetMapping("/order/orderDetail")
    public ModelAndView orderDetail() {
        ModelAndView response = new ModelAndView("order/orderDetail");

        Customer customer = authenticatedUserUtilities.getCurrentUser();

        List<Order> order = orderDAO.findByCustomer(customer);

        if (order != null) {

            List<Map<String,Object>> orderDetail = orderDAO.getOrderDetails(customer.getId());
            response.addObject("orderDetail", orderDetail);
        }

        return response;
    }

    @GetMapping("/order/addToCart")
    public ModelAndView addToCart(@RequestParam Integer productId, OrderDetailFormBean form) throws Exception {
        ModelAndView response = new ModelAndView("order/addToCart");

        response.addObject("form", form);
        response.addObject("productIdToken", productId);

        // first we can look up the product in the database given the incoming productId
        Product product = productDAO.findById(productId);

        Order order = orderService.newOrder();

        // check if the product is already in the cart
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);

        OrderDetail orderDetail = orderdetailDAO.isProductInCart(order.getId(), productId);
        if ( orderDetail == null ) {
            // this product is not part of this order so we can create a new orderdetails
            orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(product);// dropdown menu?
            orderDetail.setBookingDate(formatter.parse(form.getBookingDate()));
            orderDetail.setDurationHours(form.getDurationHours());
            orderDetail.setNumberOfPax(form.getNumberOfPax());
            orderDetail.setQuantityOrdered(form.getQuantityOrdered());
            orderDetail.setTotalPrice((double) (product.getPricePerPaxPerHour() * form.getDurationHours() * form.getNumberOfPax() * form.getQuantityOrdered()));
            // hacer un query
            orderdetailDAO.save(orderDetail);
        }else {
            // the product is already in the cart so we need to increment the quantity
            orderDetail.setQuantityOrdered(orderDetail.getQuantityOrdered() + 1);
            orderdetailDAO.save(orderDetail);
        }

        log.info("product id: " + product.getId());
        log.info("orderDetail: " + orderDetail.getId());
        response.setViewName("redirect:/cart?orderId=" + order.getId());
        return response;
    }

    @PostMapping("/order/addToCart/{productId}")
    public ModelAndView addToCartSubmit(@PathVariable Integer productId, OrderDetailFormBean form) throws Exception {
        ModelAndView response = new ModelAndView("order/addToCart");

        response.addObject("form", form);
        response.addObject("productIdToken", productId);

        // first we can look up the product in the database given the incoming productId
        Product product = productDAO.findById(productId);

        Order order = orderService.newOrder();

        // check if the product is already in the cart
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);

        OrderDetail orderDetail = orderdetailDAO.isProductInCart(order.getId(), productId);
        if ( orderDetail != null ) {
            orderDetail.setBookingDate(formatter.parse(form.getBookingDate()));
            orderDetail.setDurationHours(form.getDurationHours());
            orderDetail.setNumberOfPax(form.getNumberOfPax());
            orderDetail.setQuantityOrdered(form.getQuantityOrdered());
            orderDetail.setTotalPrice((double) (product.getPricePerPaxPerHour() * form.getDurationHours() * form.getNumberOfPax() * form.getQuantityOrdered()));

            orderdetailDAO.save(orderDetail);
        }else {
            // the product is already in the cart so we need to increment the quantity
            orderDetail.setQuantityOrdered(orderDetail.getQuantityOrdered() + 1);
            orderdetailDAO.save(orderDetail);
        }

        log.info("product id: " + product.getId());
        log.info("orderDetail: " + orderDetail.getId());
        response.setViewName("redirect:/cart?orderId=" + order.getId());
        return response;
    }




    @GetMapping("/order/checkout")
    public ModelAndView checkout() {
        ModelAndView response = new ModelAndView();

        // get the logged in user
        Customer customer = authenticatedUserUtilities.getCurrentUser();

        // now we need to get the order from the database where the status is 'CART'
        Order order = orderDAO.findOrderInCartStatus(customer.getId());// change this ot check out one detail
        if ( order == null ) {
            log.error("There is no order with items in the cart to checktout");
        } else {
            // there was an order with items in the cart so we change the status to COMPLETE
            order.setStatus("COMPLETE");
            orderDAO.save(order);
        }
        assert order != null;// esto lo puse yo
        response.setViewName("redirect:/order/orderDetail?customerId=" + customer.getId());
        return response;

        //pulling orderdetails associated with an order id
    }

    @GetMapping("/order/editOrderDetail/{orderDetailId}")
    public ModelAndView editOrderDetail(@PathVariable Integer orderDetailId) {
        ModelAndView response = new ModelAndView("order/editOrderDetails");
        OrderDetailFormBean form = new OrderDetailFormBean();

        Customer currentCustomer = authenticatedUserUtilities.getCurrentUser();
        OrderDetail orderDetail = orderdetailDAO.findOrderDetailById(orderDetailId);
        log.info("editingOrderDetail: " + orderDetail);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Product product = productDAO.findProductInOrderDetail(orderDetailId);

        if (orderDetailId != null) {

            Order order = orderDAO.findOrderWithSpecificOrderDetailsId(orderDetailId);
            if (order != null) {
                order.setStatus("CART");
                order.setCreateDate(new Date());
                orderDAO.save(order);
            }

            form.setBookingDate(sdf.format(orderDetail.getBookingDate()));
            form.setDurationHours(orderDetail.getDurationHours());
            form.setNumberOfPax(orderDetail.getNumberOfPax());
            form.setQuantityOrdered(orderDetail.getQuantityOrdered());
            form.setTotalPrice((double) (product.getPricePerPaxPerHour() * orderDetail.getDurationHours() * orderDetail.getNumberOfPax() * orderDetail.getQuantityOrdered()));

            orderdetailDAO.save(orderDetail);
            response.addObject("orderDetail", orderDetail);
            response.addObject("product", product);
            response.addObject("productId", product.getId());
            response.addObject("form", form);

        }
        return response;
    }

    @GetMapping ("/deleteOrderDetail/{orderDetailId}")
    public ModelAndView deleteOrderDetail(@PathVariable Integer orderDetailId) {
        ModelAndView response = new ModelAndView("order/orderDetail");

        Order order = orderDAO.findOrderWithSpecificOrderDetailsId(orderDetailId);
        if(orderDetailId != null) {
            OrderDetail orderDetail = orderdetailDAO.findOrderDetailById(orderDetailId);
            orderdetailDAO.delete(orderDetail);
        }

        response.setViewName("redirect:/order/orderDetail");
        return response;

    }
}


