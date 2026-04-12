package com.example.shopping.entity;

import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class CartItem {
    private Long id;
    private Long userId;
    private Long productId;
    private Integer quantity;
    
    private String selectedColor;
    private String selectedStorage;
    private String insuranceType;
    private BigDecimal insurancePrice;
    private BigDecimal unitPrice;
    private LocalDateTime addedAt;
    
    private String productName;
    private BigDecimal price;
    private String imageUrl;
    private Integer stock;
    private String category;
}
