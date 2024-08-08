package com.qvainside.CapstoneProject.form;

import jakarta.persistence.Column;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CreateProductFormBean {

    private Integer id;

    @NotEmpty(message = "Product name is required")
    private String productName;

    @NotEmpty(message = "Product type is required")
    private String productType;

    @NotEmpty(message = "Location is required")
    private String location;

    private Integer capacity;

    private String color;

    private String airConditioner;

    private Integer pricePerPaxPerHour;

    private String description;

    private String difficulty;

    private Integer durationInHours;

    private String imageUrl;
}
