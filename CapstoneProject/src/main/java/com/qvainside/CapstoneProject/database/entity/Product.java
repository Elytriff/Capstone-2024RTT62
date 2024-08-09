package com.qvainside.CapstoneProject.database.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "product", schema = "qvainside_capstone")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;



    @Column(name = "product_name", nullable = false, length = 45)
    private String productName;


    @Column(name = "product_type", nullable = false, length = 45)
    private String productType;


    @Column(name = "location", nullable = false, length = 45)
    private String location;

    @Column(name = "capacity")
    private Integer capacity;


    @Column(name = "color", length = 45)
    private String color;


    @Column(name = "air_conditioner", length = 45)
    private String airConditioner;

    @Column(name = "price_per_pax_per_hour")
    private Integer pricePerPaxPerHour;

    @ToString.Exclude
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderDetail> orderdetailList;

    @Column(name = "description")
    private String description;

    @Column(name = "duration_in_hours")
    private Integer durationInHours;


    @Column(name = "difficulty", length = 45)
    private String difficulty;

    @Column(name = "image_url", length = 200)
    private String imageUrl;

}