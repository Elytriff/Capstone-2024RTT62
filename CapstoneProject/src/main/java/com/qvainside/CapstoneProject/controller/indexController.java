package com.qvainside.CapstoneProject.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class indexController {

    @GetMapping("/")
    public ModelAndView homePage() {
        ModelAndView response = new ModelAndView("homePage");
        return response;
    }

    @GetMapping("/oldVintageCars")
    public ModelAndView oldVintageCarsPage() {
        ModelAndView response = new ModelAndView("oldVintageCars");
        return response;
    }

    @GetMapping("/vinalesTour")
    public ModelAndView vinalesPage() {
        ModelAndView response = new ModelAndView("vinalesTour");
        return response;
    }

    @GetMapping("/trinidadTour")
    public ModelAndView trinidadPage() {
        ModelAndView response = new ModelAndView("trinidadTour");
        return response;
    }

    @GetMapping("/havanaTour")
    public ModelAndView havanaPage() {
        ModelAndView response = new ModelAndView("havanaTour");
        return response;
    }
    @GetMapping("/registrationPage")
    public ModelAndView registrationPage() {
        ModelAndView response = new ModelAndView("registrationPage");
        return response;
    }

    @GetMapping("/customerProfile")
    public ModelAndView customerProfilePage() {
        ModelAndView response = new ModelAndView("customer/customerProfile");
        return response;
    }
}



