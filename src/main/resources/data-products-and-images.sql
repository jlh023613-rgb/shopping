-- ============================================================
-- 清空现有数据（避免重复键错误）
-- ============================================================
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE product_images;
TRUNCATE TABLE products;
TRUNCATE TABLE shops;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 店铺数据
-- ============================================================
INSERT INTO shops (name, folder, description, sort_order) VALUES
('华为官方旗舰店', 'huawei', '华为官方授权店铺，正品保障', 1),
('Apple官方旗舰店', 'iphone', 'Apple官方授权店铺，正品保障', 2),
('一加官方旗舰店', 'oneplus', '一加官方授权店铺，正品保障', 3),
('OPPO官方旗舰店', 'oppo', 'OPPO官方授权店铺，正品保障', 4),
('三星官方旗舰店', 'sanxing', '三星官方授权店铺，正品保障', 5),
('vivo官方旗舰店', 'vivo', 'vivo官方授权店铺，正品保障', 6),
('小米官方旗舰店', 'xiaomi', '小米官方授权店铺，正品保障', 7);

-- ============================================================
-- 商品数据 (merchant_id 对应 shops.id)
-- ============================================================
-- 华为商品 (shop_id = 1)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('华为 Mate 80', '手机', 5999.00, 6499.00, 100, '/image/huawei/Mate80/68692be190c474408.png_e1080.webp', '华为Mate 80，麒麟芯片，卫星通信', 1, 1),
('华为 Pura 80', '手机', 6999.00, 7499.00, 80, '/image/huawei/Pura80/67a46e928d1284071.jpg_e1080.webp', '华为Pura 80，影像旗舰，超感知影像系统', 1, 1);

-- iPhone商品 (shop_id = 2)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('iPhone 14', '手机', 4999.00, 5999.00, 50, '/image/iphone/iphone14/111850_iphone-14_1.png', 'iPhone 14，A15芯片，超视网膜显示屏', 1, 2),
('iPhone 14 Pro', '手机', 6999.00, 7999.00, 30, '/image/iphone/iphone14pro/111846_sp875-sp876-iphone14-pro-promax.png', 'iPhone 14 Pro，灵动岛，ProMotion显示屏', 1, 2),
('iPhone 15', '手机', 5999.00, 6999.00, 100, '/image/iphone/iphone15/iphone_15_hero.png', 'iPhone 15，A16芯片，USB-C接口', 1, 2),
('iPhone 15 Pro', '手机', 7999.00, 8999.00, 60, '/image/iphone/iphone15pro/iphone_15_pro.png', 'iPhone 15 Pro，钛金属设计，A17 Pro芯片', 1, 2),
('iPhone 16', '手机', 6999.00, 7999.00, 120, '/image/iphone/iphone16/iphone-16-model-unselect-gallery-1-202409.webp', 'iPhone 16，A18芯片，相机控制按钮', 1, 2),
('iPhone 16 Pro', '手机', 8999.00, 9999.00, 80, '/image/iphone/iphone16pro/iphone-16-pro-a.jpg', 'iPhone 16 Pro，A18 Pro芯片，4K 120fps视频', 1, 2),
('iPhone 17', '手机', 7999.00, 8999.00, 150, '/image/iphone/iphone17/iPhone_17_Lavender_Singapore.webp', 'iPhone 17，全新设计，A19芯片', 1, 2),
('iPhone 17 Pro', '手机', 9999.00, 10999.00, 100, '/image/iphone/iphone17pro/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange.webp', 'iPhone 17 Pro，A19 Pro芯片，专业影像系统', 1, 2);

-- 一加商品 (shop_id = 3)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('一加 15', '手机', 4299.00, 4599.00, 60, '/image/oneplus/15/35733938.jpg', '一加15，骁龙旗舰，哈苏影像', 1, 3),
('一加 Ace Turbo 6', '手机', 2999.00, 3299.00, 80, '/image/oneplus/Turobo 6/44367411.jpg', '一加Ace Turbo 6，性能怪兽，超级快充', 1, 3);

-- OPPO商品 (shop_id = 4)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('OPPO A6c', '手机', 1599.00, 1799.00, 200, '/image/oppo/A6c/45032584_sn7.jpg', 'OPPO A6c，轻薄设计，超长续航', 1, 4),
('OPPO Find X9', '手机', 5999.00, 6499.00, 50, '/image/oppo/FindX9/68863d7607c3b3852.jpg_e1080.webp', 'OPPO Find X9，旗舰影像，哈苏联合调校', 1, 4);

-- 三星商品 (shop_id = 5)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('三星 Galaxy S26', '手机', 5999.00, 6499.00, 70, '/image/sanxing/GalaxyS26/6906bcd9105b58800.jpg_e1080.webp', '三星Galaxy S26，AI手机，超清屏幕', 1, 5),
('三星 Galaxy S26 Ultra', '手机', 8999.00, 9999.00, 40, '/image/sanxing/GalaryS26Ultra/68b19062ce4dd2355.jpg_e1080.webp', '三星Galaxy S26 Ultra，顶级旗舰，S Pen', 1, 5);

-- vivo商品 (shop_id = 6)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('vivo S20', '手机', 2699.00, 2999.00, 100, '/image/vivo/S20/23763212.jpg', 'vivo S20，柔光自拍，轻薄设计', 1, 6),
('vivo Y500', '手机', 1999.00, 2199.00, 150, '/image/vivo/Y500/OIP-C.webp', 'vivo Y500，大电池，超长续航', 1, 6),
('vivo X200', '手机', 4999.00, 5499.00, 60, '/image/vivo/x200/670d2dd3700624602.png_e1080.webp', 'vivo X200，蔡司影像，旗舰体验', 1, 6);

-- 小米商品 (shop_id = 7)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('小米 16', '手机', 3999.00, 4299.00, 120, '/image/xiaomi/16/v2-119259195df38fc720392bd8dd8dc725_1440w.jpg', '小米16，骁龙旗舰，徕卡影像', 1, 7),
('小米 17', '手机', 4499.00, 4799.00, 100, '/image/xiaomi/17/ceB9aUff1dxEE.jpg', '小米17，全新设计，澎湃OS', 1, 7),
('Redmi Turbo 5', '手机', 1999.00, 2199.00, 200, '/image/xiaomi/REDMIturbo5/1e30e924b899a9014c08e90b60cc1d7b02087bf45fce.webp', 'Redmi Turbo 5，性能小金刚，超值之选', 1, 7);

-- ============================================================
-- 商品多图数据 (product_images)
-- ============================================================
-- 华为 Mate 80 (product_id = 1)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(1, '/image/huawei/Mate80/68692be190c474408.png_e1080.webp', 1),
(1, '/image/huawei/Mate80/68f6e37e11082615.jpg_e1080.webp', 2),
(1, '/image/huawei/Mate80/691ad5da45aa35639.jpg_e1080.webp', 3);

-- 华为 Pura 80 (product_id = 2)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(2, '/image/huawei/Pura80/67a46e928d1284071.jpg_e1080.webp', 1),
(2, '/image/huawei/Pura80/6849030ee24f43776.jpg_e1080.webp', 2),
(2, '/image/huawei/Pura80/684fc3b977595111.jpg_e1080.webp', 3);

-- iPhone 14 (product_id = 3)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(3, '/image/iphone/iphone14/111850_iphone-14_1.png', 1),
(3, '/image/iphone/iphone14/OIP-C.webp', 2),
(3, '/image/iphone/iphone14/a6d2c64ce769b9c3.png', 3),
(3, '/image/iphone/iphone14/v2-9a738879ffc039791465bbd87c2d5f21_720w.jpg', 4);

-- iPhone 14 Pro (product_id = 4)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(4, '/image/iphone/iphone14pro/111846_sp875-sp876-iphone14-pro-promax.png', 1),
(4, '/image/iphone/iphone14pro/648d7d7cef10c2834.jpg_e1080.webp', 2),
(4, '/image/iphone/iphone14pro/OIP-C.webp', 3);

-- iPhone 15 (product_id = 5)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(5, '/image/iphone/iphone15/OIP-C.webp', 1),
(5, '/image/iphone/iphone15/iphone_15_hero.png', 2);

-- iPhone 15 Pro (product_id = 6)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(6, '/image/iphone/iphone15pro/OIP-C.webp', 1),
(6, '/image/iphone/iphone15pro/iphone_15_pro.png', 2);

-- iPhone 16 (product_id = 7)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(7, '/image/iphone/iphone16/613Dze2vmCL._AC_SX679_.jpg', 1),
(7, '/image/iphone/iphone16/iphone-16-model-unselect-gallery-1-202409.webp', 2);

-- iPhone 16 Pro (product_id = 8)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(8, '/image/iphone/iphone16pro/iphone-16-pro-a.jpg', 1),
(8, '/image/iphone/iphone16pro/iphone-16-Pro-b.jpg', 2),
(8, '/image/iphone/iphone16pro/iphone-16-Pro-c.jpg', 3),
(8, '/image/iphone/iphone16pro/iphone-16-Pro-d.jpg', 4);

-- iPhone 17 (product_id = 9)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(9, '/image/iphone/iphone17/iPhone_17_Lavender_Singapore.webp', 1),
(9, '/image/iphone/iphone17/iPhone_17_Mist_Blue_Singapore.webp', 2),
(9, '/image/iphone/iphone17/iPhone_17_Sage_Singapore.webp', 3);

-- iPhone 17 Pro (product_id = 10)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(10, '/image/iphone/iphone17pro/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange.webp', 1),
(10, '/image/iphone/iphone17pro/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange_AV1.webp', 2),
(10, '/image/iphone/iphone17pro/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange_AV3.webp', 3);

-- 一加 15 (product_id = 11)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(11, '/image/oneplus/15/35733938.jpg', 1),
(11, '/image/oneplus/15/6862c2f7295aa2510.jpg_e1080.webp', 2),
(11, '/image/oneplus/15/68b796d5297023417.jpg_e1080.webp', 3);

-- 一加 Ace Turbo 6 (product_id = 12)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(12, '/image/oneplus/Turobo 6/44367411.jpg', 1),
(12, '/image/oneplus/Turobo 6/OIP-C.webp', 2);

-- OPPO A6c (product_id = 13)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(13, '/image/oppo/A6c/45032584_sn7.jpg', 1),
(13, '/image/oppo/A6c/ceXsqIP7wXsA.jpg', 2),
(13, '/image/oppo/A6c/f8abbcdae910f78ad330009c91eaeeb1-1803551226.jpg', 3);

-- OPPO Find X9 (product_id = 14)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(14, '/image/oppo/FindX9/68863d7607c3b3852.jpg_e1080.webp', 1),
(14, '/image/oppo/FindX9/68d279269a65b3881.jpg_e1080.webp', 2),
(14, '/image/oppo/FindX9/68d2792836d676036.jpg_e1080.webp', 3),
(14, '/image/oppo/FindX9/68e7864eb9d7b3430.jpg_e1080.webp', 4);

-- 三星 Galaxy S26 (product_id = 15)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(15, '/image/sanxing/GalaxyS26/6906bcd9105b58800.jpg_e1080.webp', 1),
(15, '/image/sanxing/GalaxyS26/R-C.jpg', 2);

-- 三星 Galaxy S26 Ultra (product_id = 16)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(16, '/image/sanxing/GalaryS26Ultra/68b19062ce4dd2355.jpg_e1080.webp', 1),
(16, '/image/sanxing/GalaryS26Ultra/68cfd3e4ee0f92143.jpg_e1080.webp', 2);

-- vivo S20 (product_id = 17)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(17, '/image/vivo/S20/23763212.jpg', 1),
(17, '/image/vivo/S20/674ed0996ad473182.jpg_e1080.webp', 2),
(17, '/image/vivo/S20/e0d6ca27037da05bdc18adc95d08e344.jpeg', 3);

-- vivo Y500 (product_id = 18)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(18, '/image/vivo/Y500/OIP-C.webp', 1),
(18, '/image/vivo/Y500/ceRgAeQ7f07ys.jpg', 2);

-- vivo X200 (product_id = 19)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(19, '/image/vivo/x200/670d2dd3700624602.png_e1080.webp', 1),
(19, '/image/vivo/x200/ChMkK2cNLEKIP7xVAAGJUMh15HYAAkVtQIuubYAAYlo990.jpg', 2),
(19, '/image/vivo/x200/f796f5ee887ebc390dba91e9644f4ae7.png!a', 3);

-- 小米 16 (product_id = 20)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(20, '/image/xiaomi/16/v2-119259195df38fc720392bd8dd8dc725_1440w.jpg', 1),
(20, '/image/xiaomi/16/v2-455e50d29d390edc99c1695eb5cd8edb_1440w.webp', 2);

-- 小米 17 (product_id = 21)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(21, '/image/xiaomi/17/ceB9aUff1dxEE.jpg', 1),
(21, '/image/xiaomi/17/ceNaZ75WyDJc.jpg', 2),
(21, '/image/xiaomi/17/cefbKkPnqtwT.jpg', 3);

-- Redmi Turbo 5 (product_id = 22)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(22, '/image/xiaomi/REDMIturbo5/1e30e924b899a9014c08e90b60cc1d7b02087bf45fce.webp', 1),
(22, '/image/xiaomi/REDMIturbo5/c2fdfc039245d688d43fb04cda9b6a1ed21b0ff48e98.webp', 2);
