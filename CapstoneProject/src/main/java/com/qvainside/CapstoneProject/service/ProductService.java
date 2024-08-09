package com.qvainside.CapstoneProject.service;

import com.qvainside.CapstoneProject.database.dao.ProductDAO;
import com.qvainside.CapstoneProject.database.entity.Product;
import com.qvainside.CapstoneProject.form.CreateProductFormBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class ProductService {

    @Autowired
    private ProductDAO productDAO;

    public Product createProduct(CreateProductFormBean form){

        Product product = productDAO.findById(form.getId());
        if (product == null) {
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
        form.setId(product.getId());
        return product;
    }
}
