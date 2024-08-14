package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.database.dao.OrderDAO;
import com.qvainside.CapstoneProject.database.dao.OrderdetailDAO;
import com.qvainside.CapstoneProject.database.entity.Order;
import com.qvainside.CapstoneProject.database.entity.OrderDetail;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class CartController {

    @Autowired
    private OrderdetailDAO orderdetailDAO;

    @Autowired
    private OrderDAO orderDAO;

    @GetMapping("/cart")
    public ModelAndView cartDetail(Integer orderId) {
        ModelAndView response = new ModelAndView("cartPage");

        List<Map<String,Object>> cartDetail = orderdetailDAO.cartDetail(orderId);
        response.addObject("cartDetail", cartDetail);

        return response;
    }

    @GetMapping ("/deleteOrderDetail/{orderDetailId}")
    //by setting (required = false) we allow null to enter the controller so that spring dos not cause an error
    public ModelAndView deleteOrderDetail(@PathVariable Integer orderDetailId) {
        ModelAndView response = new ModelAndView("cartPage");

        if(orderDetailId != null) {
            OrderDetail orderDetail = orderdetailDAO.findOrderDetailById(orderDetailId);
            orderdetailDAO.delete(orderDetail);
        }
        Order order = orderDAO.findOrderWithSpecificOrderDetailsId(orderDetailId);
        response.setViewName("redirect:/cart?orderId="+ order.getId());
        return response;

    }
}
