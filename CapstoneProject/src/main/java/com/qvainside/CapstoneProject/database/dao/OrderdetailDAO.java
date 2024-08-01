package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Orderdetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderdetailDAO extends JpaRepository<Orderdetail, Long> {
}