package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductDAO extends JpaRepository<Product, Long> {

    Product findById(Integer id);

    @Query("SELECT p FROM Product p WHERE LOWER(CONCAT(p.productName, ' ', p.productType)) LIKE LOWER(CONCAT('%', :searchProduct, '%'))")
    List<Product> findByProductNameOrTypeIgnoringCase(@Param("searchProduct") String searchProduct);

    @Query(value = "Select p.*\n" +
            "from product p, orderdetail od\n" +
            "where p.id = od.product_id\n" +
            "and od.id =:orderDetailId;", nativeQuery = true)
    Product findProductInOrderDetail(Integer orderDetailId);

}