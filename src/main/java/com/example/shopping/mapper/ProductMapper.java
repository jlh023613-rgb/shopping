package com.example.shopping.mapper;

import com.example.shopping.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProductMapper {
    List<Product> findAll();
    
    List<Product> findRandom(int limit);
    
    List<Product> findByNameContainingIgnoreCase(String keyword);
    
    List<Product> findByCategory(String category);
    
    Product findById(Long id);
    
    @Select("SELECT * FROM products WHERE merchant_id = #{merchantId}")
    List<Product> findByMerchantId(Long merchantId);
    
    void insert(Product product);
    
    void update(Product product);
    
    void delete(Long id);
}
