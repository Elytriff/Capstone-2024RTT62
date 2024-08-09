package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.database.dao.ProductDAO;
import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.database.entity.Product;
import com.qvainside.CapstoneProject.form.CreateProductFormBean;
import com.qvainside.CapstoneProject.service.ProductService;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
public class ProductController {

    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private ProductService productService;

    //-----------------------------------------Search product -------------------------------------------
    @GetMapping("/product")
    public ModelAndView product(@RequestParam(required = false) String product) {
        ModelAndView response = new ModelAndView("homePage");

        List<Product> productsList = productDAO.findByProductNameOrTypeIgnoringCase(product);
        response.addObject("productsListToken", productsList);

        log.info(productsList.toString());

        //only to preserve de input entered by user in the placeholder
        response.addObject("productInput", product);

        return response;
    }


//----------------------------------------Create Product--------------------------------------------

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/createProduct")
    public ModelAndView createSubmitProduct(@Valid CreateProductFormBean form, BindingResult bindingResult){
        ModelAndView response = new ModelAndView("createProductPage");

        if(bindingResult.hasErrors()){
            response.addObject("bindingResult", bindingResult);
            response.setViewName("createProductPage");
            response.addObject("form", form);
            return response;
        }
        Product product = productService.createProduct(form);

        log.info(form.toString());
        // if you want to redirect to another page
        response.setViewName("redirect:/productProfile?id=" + product.getId());
        return response;
    }

    //----------------------------------------Edit Product--------------------------------------------

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/editProduct")// this method is to see the create page but also to edit the product
    public ModelAndView editProduct(@RequestParam(required = false) Integer id) {
        ModelAndView response = new ModelAndView("createProductPage");
        CreateProductFormBean form = new CreateProductFormBean();

        if ( id != null ) {
            // get the product from the database
            Product product = productDAO.findById(id);
            if(product != null) {
                form.setId(product.getId());
                form.setProductName(product.getProductName());
                form.setProductType(product.getProductType());
                form.setLocation(product.getLocation());
                form.setCapacity(product.getCapacity());
                form.setColor(product.getColor());
                form.setAirConditioner(product.getAirConditioner());
                form.setDescription(product.getDescription());
                form.setDurationInHours(product.getDurationInHours());
                form.setDifficulty(product.getDifficulty());
                form.setPricePerPaxPerHour(product.getPricePerPaxPerHour());
                form.setImageUrl(product.getImageUrl());

                response.addObject("form", form);
            }
        }

        return response;
    }

    //----------------------------------------Product Profile--------------------------------------------

    @GetMapping("/productProfile")
    public ModelAndView productDetails(@RequestParam(required = false) Integer id){
        ModelAndView response = new ModelAndView("product/productProfile");

        Product product = productDAO.findById(id);
        response.addObject("product", product);

        return response;
    }

}
