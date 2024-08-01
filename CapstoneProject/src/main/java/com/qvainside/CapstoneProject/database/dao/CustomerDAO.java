package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerDAO extends JpaRepository<Customer, Long> {
}