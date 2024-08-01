package com.qvainside.CapstoneProject.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class indexController {

    @GetMapping("/")
    public ModelAndView index(){
        ModelAndView response = new ModelAndView("index");
        return response;
    }
    @GetMapping("/homePage")
    public ModelAndView homePage(){
        ModelAndView response = new ModelAndView("homePage");
        return response;
    }
}

