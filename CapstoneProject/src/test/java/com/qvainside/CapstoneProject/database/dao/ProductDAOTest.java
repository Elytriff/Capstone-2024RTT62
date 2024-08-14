package com.qvainside.CapstoneProject.database.dao;

import com.qvainside.CapstoneProject.database.entity.Product;
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ProductDAOTest {

    @Autowired
    ProductDAO productDAO;

    @Order(1)
    @Test
    public void testCreateNewProduct() {

        Product product = new Product();
        product.setProductName("Test");
        product.setProductType("Test");
        product.setLocation("Test");
        product.setCapacity(1);
        product.setColor("ColorTest");
        product.setAirConditioner("Test");
        product.setPricePerPaxPerHour(1);
        product.setDescription("Test");
        product.setDurationInHours(1);
        product.setDifficulty("Test");

        productDAO.save(product);

        Assertions.assertNotNull(productDAO.findById(product.getId()));
        Assertions.assertEquals("Test", product.getProductName());
        Assertions.assertEquals("Test", product.getProductType());
        Assertions.assertEquals("Test", product.getLocation());
        Assertions.assertEquals(1, product.getCapacity());
        Assertions.assertEquals("ColorTest", product.getColor());
        Assertions.assertEquals("Test", product.getAirConditioner());
        Assertions.assertEquals(1, product.getPricePerPaxPerHour());
    }

    @Order(2)
    @ParameterizedTest
    @ValueSource(strings = {"test", "TEST", "loco test"})
    public void shouldFindByProductNameOrTypeIgnoringCase(String searchProduct){

        Assertions.assertNotNull(productDAO.findByProductNameOrTypeIgnoringCase(searchProduct));
    }

    @Order(4)
    @Test
    public void testDeleteProduct (){
        Product product = productDAO.findByProductNameOrTypeIgnoringCase("Test").getFirst();
        Assertions.assertNotNull(product);
        productDAO.delete(product);
        Assertions.assertNull(productDAO.findById(product.getId()));
    }

}
