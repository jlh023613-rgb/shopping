package com.example.shopping.controller;

import com.example.shopping.entity.CartItem;
import com.example.shopping.entity.Product;
import com.example.shopping.entity.User;
import com.example.shopping.mapper.CartMapper;
import com.example.shopping.mapper.ProductMapper;
import com.example.shopping.mapper.UserMapper;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final CartMapper cartMapper;
    private final UserMapper userMapper;
    private final ProductMapper productMapper;

    public CartController(CartMapper cartMapper, UserMapper userMapper, ProductMapper productMapper) {
        this.cartMapper = cartMapper;
        this.userMapper = userMapper;
        this.productMapper = productMapper;
    }

    @GetMapping
    public String cart(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        String phone = userDetails.getUsername();
        User user = userMapper.findByPhone(phone);
        List<CartItem> cartItems = cartMapper.findByUserId(user.getId());
        
        BigDecimal total = cartItems.stream()
            .map(item -> {
                BigDecimal itemPrice = item.getUnitPrice() != null ? item.getUnitPrice() : item.getPrice();
                BigDecimal insurancePrice = item.getInsurancePrice() != null ? item.getInsurancePrice() : BigDecimal.ZERO;
                return itemPrice.multiply(new BigDecimal(item.getQuantity())).add(insurancePrice);
            })
            .reduce(BigDecimal.ZERO, BigDecimal::add);
        
        int cartCount = cartMapper.countByUserId(user.getId());
        
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("total", total);
        model.addAttribute("cartCount", cartCount);
        return "cart/list";
    }
    
    @GetMapping("/count")
    @ResponseBody
    public Map<String, Object> getCartCount(@AuthenticationPrincipal UserDetails userDetails) {
        Map<String, Object> result = new HashMap<>();
        try {
            String phone = userDetails.getUsername();
            User user = userMapper.findByPhone(phone);
            int count = cartMapper.countByUserId(user.getId());
            result.put("count", count);
        } catch (Exception e) {
            result.put("count", 0);
        }
        return result;
    }

    @PostMapping("/add/{productId}")
    @ResponseBody
    public Map<String, Object> addToCart(@PathVariable Long productId,
                           @RequestParam(defaultValue = "1") Integer quantity,
                           @RequestParam(required = false) String selectedColor,
                           @RequestParam(required = false) String selectedStorage,
                           @RequestParam(defaultValue = "none") String insuranceType,
                           @AuthenticationPrincipal UserDetails userDetails) {
        Map<String, Object> result = new HashMap<>();
        try {
            String phone = userDetails.getUsername();
            User user = userMapper.findByPhone(phone);
            
            Product product = productMapper.findById(productId);
            if (product == null) {
                result.put("success", false);
                result.put("message", "商品不存在");
                return result;
            }
            
            if (selectedColor == null || selectedColor.isEmpty()) {
                selectedColor = product.getColor() != null ? product.getColor().split("/")[0] : "默认";
            }
            if (selectedStorage == null || selectedStorage.isEmpty()) {
                selectedStorage = "标准版";
            }
            
            BigDecimal insurancePrice = calculateInsurancePrice(insuranceType, product.getPrice());
            BigDecimal unitPrice = product.getPrice();
            
            CartItem existing = cartMapper.findByUserAndProductWithOptions(
                user.getId(), productId, selectedColor, selectedStorage, insuranceType);
            
            if (existing != null) {
                cartMapper.updateQuantityWithOptions(existing.getId(), quantity);
            } else {
                CartItem cartItem = new CartItem();
                cartItem.setUserId(user.getId());
                cartItem.setProductId(productId);
                cartItem.setQuantity(quantity);
                cartItem.setSelectedColor(selectedColor);
                cartItem.setSelectedStorage(selectedStorage);
                cartItem.setInsuranceType(insuranceType);
                cartItem.setInsurancePrice(insurancePrice);
                cartItem.setUnitPrice(unitPrice);
                cartMapper.insert(cartItem);
            }
            
            int cartCount = cartMapper.countByUserId(user.getId());
            result.put("success", true);
            result.put("message", "已加入购物车");
            result.put("cartCount", cartCount);
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "加入购物车失败: " + e.getMessage());
        }
        return result;
    }

    @PostMapping("/update/{id}")
    public String updateQuantity(@PathVariable Long id,
                                @RequestParam Integer quantity,
                                @AuthenticationPrincipal UserDetails userDetails) {
        String phone = userDetails.getUsername();
        User user = userMapper.findByPhone(phone);
        
        if (quantity <= 0) {
            cartMapper.delete(id, user.getId());
        } else {
            cartMapper.updateQuantity(id, quantity);
        }
        
        return "redirect:/cart";
    }

    @PostMapping("/delete/{id}")
    public String deleteItem(@PathVariable Long id, @AuthenticationPrincipal UserDetails userDetails) {
        String phone = userDetails.getUsername();
        User user = userMapper.findByPhone(phone);
        cartMapper.delete(id, user.getId());
        return "redirect:/cart";
    }
    
    @PostMapping("/delete-selected")
    @ResponseBody
    public Map<String, Object> deleteSelected(@RequestParam String ids, @AuthenticationPrincipal UserDetails userDetails) {
        Map<String, Object> result = new HashMap<>();
        try {
            String phone = userDetails.getUsername();
            User user = userMapper.findByPhone(phone);
            
            String[] idArray = ids.split(",");
            for (String idStr : idArray) {
                Long id = Long.parseLong(idStr.trim());
                cartMapper.delete(id, user.getId());
            }
            
            result.put("success", true);
            result.put("message", "删除成功");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "删除失败: " + e.getMessage());
        }
        return result;
    }
    
    private BigDecimal calculateInsurancePrice(String insuranceType, BigDecimal productPrice) {
        if (insuranceType == null || "none".equals(insuranceType)) {
            return BigDecimal.ZERO;
        }
        if ("basic".equals(insuranceType)) {
            return productPrice.multiply(new BigDecimal("0.05"));
        }
        if ("premium".equals(insuranceType)) {
            return productPrice.multiply(new BigDecimal("0.10"));
        }
        return BigDecimal.ZERO;
    }
}
