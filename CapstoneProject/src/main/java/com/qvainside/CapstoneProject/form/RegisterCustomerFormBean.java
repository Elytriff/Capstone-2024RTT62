package com.qvainside.CapstoneProject.form;

import jakarta.validation.constraints.NotEmpty;
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

    @NotEmpty(message = "name is required.")
    private String name;

    @NotEmpty(message = "Lastname is required.")
    private String lastName;

    @NotEmpty(message = "email is required.")
    private String email;

    private String city;

    @NotEmpty(message = "Country is required.")
    private String country;

    private String contactNumber;

    @NotEmpty(message = "Password is required.")
    private String password;
}