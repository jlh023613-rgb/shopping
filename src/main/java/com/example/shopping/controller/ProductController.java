package com.example.shopping.controller;

import com.example.shopping.entity.Product;
import com.example.shopping.entity.ProductImage;
import com.example.shopping.entity.Shop;
import com.example.shopping.mapper.ProductImageMapper;
import com.example.shopping.mapper.ProductMapper;
import com.example.shopping.mapper.ShopMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 商品详情：展示多图、介绍、价格，点击首页商品进入
 */
@Controller
public class ProductController {

    private final ProductMapper productMapper;
    private final ProductImageMapper productImageMapper;
    private final ShopMapper shopMapper;

    public ProductController(ProductMapper productMapper, ProductImageMapper productImageMapper, ShopMapper shopMapper) {
        this.productMapper = productMapper;
        this.productImageMapper = productImageMapper;
        this.shopMapper = shopMapper;
    }

    @GetMapping("/product/{id}")
    public String detail(@PathVariable Long id, Model model) {
        Product product = productMapper.findById(id);
        if (product == null) {
            model.addAttribute("product", null);
            return "product/detail";
        }
        List<ProductImage> images = productImageMapper.findByProductId(id);
        List<String> imageUrls = images.isEmpty()
                ? (product.getImageUrl() != null ? List.of(product.getImageUrl()) : new ArrayList<>())
                : images.stream().map(ProductImage::getImageUrl).collect(Collectors.toList());
        product.setImageUrl(product.getImageUrl() != null ? product.getImageUrl() : (imageUrls.isEmpty() ? null : imageUrls.get(0)));
        model.addAttribute("product", product);
        model.addAttribute("imageUrls", imageUrls);
        if (product.getMerchantId() != null) {
            Shop shop = shopMapper.findById(product.getMerchantId());
            model.addAttribute("shop", shop);
        } else {
            model.addAttribute("shop", null);
        }
        return "product/detail";
    }
}
