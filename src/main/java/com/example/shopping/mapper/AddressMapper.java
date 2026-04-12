package com.example.shopping.mapper;

import com.example.shopping.entity.Address;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AddressMapper {
    List<Address> findByUserId(Long userId);
    Address findById(Long id);
    void insert(Address address);
    void update(Address address);
    void delete(Long id);
    void deleteByUserId(Long userId);
    void clearDefault(Long userId);
    void setDefault(@Param("id") Long id, @Param("userId") Long userId);
}
