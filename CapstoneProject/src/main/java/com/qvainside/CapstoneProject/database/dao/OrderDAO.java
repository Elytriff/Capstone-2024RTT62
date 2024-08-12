package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Customer;
import com.qvainside.CapstoneProject.database.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface OrderDAO extends JpaRepository<Order, Long> {

    @Query(value= """
            select\s
            od.quantity_ordered * od.duration_hours * od.number_of_pax * p.price_per_pax_per_hour as total_price,
            c.name, c.last_name,
            o.id as order_id, o.create_date, o.status,
            p.id as product_id,
            od.booking_date, od.duration_hours, od.number_of_pax, od.quantity_ordered
            from orderdetail od, product p, qvainside_capstone.order o, customer c
            where od.product_id = p.id\s
            and o.id = od.order_id
            and c.id = o.customer_id
            and c.id= :customerId
            order by order_id;""", nativeQuery = true)
    List<Map<String,Object>> getOrderDetails(Integer customerId);

    @Query(value = """
             SELECT *\s
            FROM qvainside_capstone.order
            WHERE customer_id = :customerId
            AND status = 'CART';""", nativeQuery = true)
    Order findOrderInCartStatus(Integer customerId);

    List<Order> findByCustomer(Customer customer);

    @Query(value = "select o.*\n" +
            "from qvainside_capstone.order o, orderdetail od\n" +
            "where o.id = od.order_id\n" +
            "and od.id =:orderDetailId;", nativeQuery = true)
    Order findOrderWithSpecificOrderDetailsId(Integer orderDetailId);
}

