package com.qvainside.CapstoneProject.controller;

import com.qvainside.CapstoneProject.database.dao.ProductDAO;
import com.qvainside.CapstoneProject.database.entity.Product;
import com.qvainside.CapstoneProject.form.CreateProductFormBean;
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

    @GetMapping("/product")
    public ModelAndView product(@RequestParam(required = false) String product) {
        ModelAndView response = new ModelAndView("homePage");

        List<Product> productsList = productDAO.findByProductNameOrTypeIgnoringCase(product);
        response.addObject("productsListToken", productsList);

        //only to preserve de input entered by user in the placeholder
        response.addObject("productInput", product);

        return response;
    }
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/create")// this method is to see the create page but also to edit the product
    public ModelAndView createProduct(@RequestParam(required = false) Integer id) {
        ModelAndView response = new ModelAndView("createProductPage");

        // if the id is not null then we are editing a product
        if ( id != null ) {
            // get the product from the database
            Product product = productDAO.findById(id);
            CreateProductFormBean form = new CreateProductFormBean();

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

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/createSubmit")
    public ModelAndView createSubmitProduct(@Valid CreateProductFormBean form, BindingResult bindingResult){
        ModelAndView response = new ModelAndView("createProductPage");
        response.addObject("form", form);

        if(bindingResult.hasErrors()){
            response.addObject("bindingResult", bindingResult);
            return response;
        }

        Product product = productDAO.findById(form.getId());
        if ( product == null ) {
            // it was not in the database
            product = new Product();
        }
        product.setProductName(form.getProductName());
        product.setProductType(form.getProductType());
        product.setLocation(form.getLocation());
        product.setCapacity(form.getCapacity());
        product.setColor(form.getColor());
        product.setAirConditioner(form.getAirConditioner());
        product.setDescription(form.getDescription());
        product.setDurationInHours(form.getDurationInHours());
        product.setDifficulty(form.getDifficulty());
        product.setPricePerPaxPerHour(form.getPricePerPaxPerHour());
        product.setImageUrl(form.getImageUrl());

        product = productDAO.save(product);

        log.info(form.toString());

        return response;
    }

}
