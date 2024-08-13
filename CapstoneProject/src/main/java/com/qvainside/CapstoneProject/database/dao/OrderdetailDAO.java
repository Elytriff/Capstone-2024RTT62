package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.database.entity.Order;
import com.qvainside.CapstoneProject.database.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface OrderdetailDAO extends JpaRepository<OrderDetail, Long> {

    @Query(value = "select * from orderdetail where order_id = :orderId and product_id = :productId", nativeQuery = true)
    OrderDetail isProductInCart(Integer orderId, Integer productId);

    @Query(value = "select \n" +
        "c.name, c.last_name,\n" +
        "o.id as order_id, o.status,\n" +
        "p.product_name, p.location, p.description, p.image_url,\n" +
        "od.id as orderDetailId, od.booking_date, od.duration_hours, od.number_of_pax, od.total_price, od.quantity_ordered\n" +
        "from orderdetail od, product p, qvainside_capstone.order o, customer c\n" +
        "where od.product_id = p.id \n" +
        "and o.id = od.order_id\n" +
        "and c.id = o.customer_id\n" +
        "and o.id=:orderId;", nativeQuery = true)
    List<Map<String,Object>> cartDetail(Integer orderId);

    @Query(value = "select od.*\n" +
            "from orderdetail od, product p, qvainside_capstone.order o, customer c\n" +
            "where od.product_id = p.id \n" +
            "and o.id = od.order_id\n" +
            "and c.id = o.customer_id\n" +
            "and c.id =:customerId\n" +
            "and o.id =:orderId\n" +
            "order by order_id;", nativeQuery = true)
    OrderDetail editOrderAndDetails(Integer orderId, Integer customerId);


    OrderDetail findOrderDetailById(Integer orderDetailId);


}