package com.example.shopping.mapper;

import com.example.shopping.entity.ProductImage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductImageMapper {
    int insert(ProductImage image);
    List<ProductImage> findByProductId(Long productId);
}
