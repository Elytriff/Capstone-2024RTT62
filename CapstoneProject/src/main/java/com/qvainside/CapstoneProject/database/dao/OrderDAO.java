package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface OrderDAO extends JpaRepository<Order, Long> {

    @Query(value="select o.id as order_id, o.create_date, od.quantity_ordered, p.product_name, p.id as product_id, " +
            "p.price " +
            "from orderdetails od, products p, orders o " +
            "where od.product_id = p.id and o.id = od.order_id and o.id = :orderId " +
            "order by order_id;", nativeQuery = true)
    List<Map<String,Object>> getOrderDetails(Integer orderId);

    @Query(value = """
             SELECT *\s
            FROM qvainside_capstone.order
            WHERE customer_id = 1
            AND status = 'CART';""", nativeQuery = true)
    Order findOrderInCartStatus(Integer customerId);
}