package com.qvainside.CapstoneProject.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * DTO for {@link com.qvainside.CapstoneProject.database.entity.Customer}
 */
@Setter
@Getter
@ToString
public class RegisterCustomerFormBean {

    private Integer id;


    private String name;


    private String lastName;


    private String email;

    private String city;

    private String country;

    private String contactNumber;

    private String password;
}