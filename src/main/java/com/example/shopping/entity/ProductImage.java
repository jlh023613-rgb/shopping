package com.example.shopping.entity;

import lombok.Data;

/**
 * 商品多图（一个商品 2～3 张）
 */
@Data
public class ProductImage {
    private Long id;
    private Long productId;
    private String imageUrl;
    private Integer sortOrder;
}
