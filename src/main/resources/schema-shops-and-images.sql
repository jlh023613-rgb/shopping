-- ============================================================
-- 店铺表 + 商品多图表
-- 约定：static/image 下每个一级文件夹 = 一个店铺，二级文件夹 = 一个商品（型号），其内图片 = 该商品多张图
-- 示例：static/image/iphone/iphone15/1.jpg、2.jpg、3.jpg  → 店铺 iphone，商品 iphone15，3 张图
-- ============================================================

-- 1. 店铺表
CREATE TABLE IF NOT EXISTS shops (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '店铺主键',
    name VARCHAR(100) NOT NULL COMMENT '店铺名称（如 iPhone 官方）',
    folder VARCHAR(80) NOT NULL UNIQUE COMMENT '对应 static/image 下文件夹名，如 iphone',
    description VARCHAR(500) COMMENT '店铺简介',
    sort_order INT DEFAULT 0 COMMENT '排序',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='店铺表';

-- 2. 商品表已有 merchant_id，用来关联 shops.id（即 merchant_id = 店铺ID）
-- 无需改表，只需插入商品时 merchant_id 填 shops.id

-- 3. 商品多图表（每个商品 2～3 张图）
CREATE TABLE IF NOT EXISTS product_images (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT NOT NULL COMMENT '商品ID',
    image_url VARCHAR(512) NOT NULL COMMENT '图片路径，如 /image/iphone/iphone15/1.jpg',
    sort_order INT DEFAULT 0,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_product_id (product_id),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品多图';
