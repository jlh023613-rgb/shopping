package com.example.shopping.entity;

import lombok.Data;

/**
 * 店铺（对应 static/image 下的一个一级文件夹）
 */
@Data
public class Shop {
    private Long id;
    private String name;
    private String folder;
    private String description;
    private Integer sortOrder;
}
