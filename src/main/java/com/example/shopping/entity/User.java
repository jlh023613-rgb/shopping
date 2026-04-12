package com.example.shopping.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class User {
    private Long id;
    private String username;
    private String phone;
    private String password;
    private String gender;
    private String role = "ROLE_USER";
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
