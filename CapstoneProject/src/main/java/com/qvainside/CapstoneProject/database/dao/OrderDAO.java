package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDAO extends JpaRepository<Order, Long> {
}