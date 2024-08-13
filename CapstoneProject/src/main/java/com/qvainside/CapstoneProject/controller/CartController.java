package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.database.dao.OrderdetailDAO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class CartController {

    @Autowired
    private OrderdetailDAO orderdetailDAO;

    @GetMapping("/cart")
    public ModelAndView cartDetail(Integer orderId) {
        ModelAndView response = new ModelAndView("cartPage");

        List<Map<String,Object>> cartDetail = orderdetailDAO.cartDetail(orderId);
        response.addObject("cartDetail", cartDetail);

        return response;
    }
}
