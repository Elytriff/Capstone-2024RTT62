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
@Table(name = "customer", schema = "qvainside_capstone")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "last_name", nullable = false, length = 100)
    private String lastName;

    @Column(name = "email", nullable = false, length = 45)
    private String email;


    @Column(name = "city", length = 45)
    private String city;

    @Column(name = "country", nullable = false, length = 45)
    private String country;


    @Column(name = "contact_number", length = 45)
    private String contactNumber;

    @Column(name = "password", nullable = false, length = 45)
    private String password;

    @ToString.Exclude
    @OneToMany(mappedBy = "customer")
    private List<Order> orders;

}