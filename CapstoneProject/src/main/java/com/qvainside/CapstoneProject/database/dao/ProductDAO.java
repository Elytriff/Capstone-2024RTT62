package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ProductDAO extends JpaRepository<Product, Long> {

}