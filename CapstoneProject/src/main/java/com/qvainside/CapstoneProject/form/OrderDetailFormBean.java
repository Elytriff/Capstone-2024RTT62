package com.qvainside.CapstoneProject.form;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class OrderDetailFormBean {

    private Date bookingDate;

    private Integer durationHours;

    private Integer numberOfPax;

    private Integer quantityOrdered;

    private Double totalPrice;

}
