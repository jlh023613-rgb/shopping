package com.example.shopping.mapper;

import com.example.shopping.entity.CartItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartMapper {
    List<CartItem> findByUserId(Long userId);
    CartItem findByUserAndProduct(@Param("userId") Long userId, @Param("productId") Long productId);
    CartItem findByUserAndProductWithOptions(@Param("userId") Long userId, @Param("productId") Long productId,
                                              @Param("selectedColor") String selectedColor,
                                              @Param("selectedStorage") String selectedStorage,
                                              @Param("insuranceType") String insuranceType);
    void insert(CartItem cartItem);
    void updateQuantity(@Param("id") Long id, @Param("quantity") Integer quantity);
    void updateQuantityWithOptions(@Param("id") Long id, @Param("quantity") Integer quantity);
    void delete(@Param("id") Long id, @Param("userId") Long userId);
    void deleteByUserId(Long userId);
    int countByUserId(Long userId);
}
