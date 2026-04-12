package com.example.shopping.controller;

import com.example.shopping.entity.User;
import com.example.shopping.mapper.UserMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/debug")
public class DebugController {
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    
    public DebugController(UserMapper userMapper, PasswordEncoder passwordEncoder) {
        this.userMapper = userMapper;
        this.passwordEncoder = passwordEncoder;
    }
    
    @GetMapping("/user")
    public Map<String, Object> getUser(@RequestParam String phone) {
        Map<String, Object> result = new HashMap<>();
        User user = userMapper.findByPhone(phone);
        
        if (user == null) {
            result.put("found", false);
            result.put("message", "鐢ㄦ埛涓嶅瓨鍦�");
        } else {
            result.put("found", true);
            result.put("id", user.getId());
            result.put("username", user.getUsername());
            result.put("phone", user.getPhone());
            result.put("role", user.getRole());
            result.put("passwordHash", user.getPassword());
            result.put("passwordLength", user.getPassword() != null ? user.getPassword().length() : 0);
            result.put("isBcryptFormat", user.getPassword() != null && user.getPassword().startsWith("$2"));
        }
        
        return result;
    }
    
    @GetMapping("/encode")
    public Map<String, Object> encodePassword(@RequestParam String password) {
        Map<String, Object> result = new HashMap<>();
        result.put("original", password);
        result.put("encoded", passwordEncoder.encode(password));
        return result;
    }
    
    @GetMapping("/verify")
    public Map<String, Object> verifyPassword(@RequestParam String rawPassword, @RequestParam String encodedPassword) {
        Map<String, Object> result = new HashMap<>();
        result.put("rawPassword", rawPassword);
        result.put("encodedPassword", encodedPassword);
        result.put("matches", passwordEncoder.matches(rawPassword, encodedPassword));
        return result;
    }
}
