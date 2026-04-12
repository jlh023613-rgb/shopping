package com.example.shopping.mapper;

import com.example.shopping.entity.Shop;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ShopMapper {
    int insert(Shop shop);
    Shop findById(Long id);
    Shop findByFolder(String folder);
    List<Shop> findAll();
}
