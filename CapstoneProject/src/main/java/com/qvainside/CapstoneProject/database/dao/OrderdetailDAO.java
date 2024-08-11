package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderdetailDAO extends JpaRepository<OrderDetail, Long> {

    @Query(value = "select * from orderdetail where order_id = :orderId and product_id = :productId", nativeQuery = true)
    OrderDetail isProductInCart(Integer orderId, Integer productId);
}