-- ============================================================
-- 完整初始化脚本：清空并重新导入商品数据
-- 图片路径：/image/phone/品牌/型号/ (按实际文件夹名称)
-- 执行此脚本前请确保已备份数据
-- ============================================================

-- 1. 清空现有数据
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE product_images;
TRUNCATE TABLE products;
TRUNCATE TABLE shops;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 2. 店铺数据
-- ============================================================
INSERT INTO shops (name, folder, description, sort_order) VALUES
('华为官方旗舰店', 'huawei', '华为官方授权店铺，正品保障', 1),
('Apple官方旗舰店', 'apple', 'Apple官方授权店铺，正品保障', 2),
('一加官方旗舰店', 'oneplus', '一加官方授权店铺，正品保障', 3),
('OPPO官方旗舰店', 'oppo', 'OPPO官方授权店铺，正品保障', 4),
('三星官方旗舰店', 'samsung', '三星官方授权店铺，正品保障', 5),
('vivo官方旗舰店', 'vivo', 'vivo官方授权店铺，正品保障', 6),
('小米官方旗舰店', 'xiaomi', '小米官方授权店铺，正品保障', 7),
('iQOO官方旗舰店', 'iqoo', 'iQOO官方授权店铺，正品保障', 8),
('realme官方旗舰店', 'realme', 'realme官方授权店铺，正品保障', 9);

-- ============================================================
-- 3. 商品数据 (merchant_id 对应 shops.id)
-- ============================================================

-- 华为商品 (shop_id = 1)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('华为 Mate 80', 'phone', 5999.00, 6499.00, 100, '/image/phone/huawei/Mate80/68692be190c474408.png_e1080.webp', '华为Mate 80，麒麟芯片，卫星通信', 1, 1),
('华为 Pura 80', 'phone', 6999.00, 7499.00, 80, '/image/phone/huawei/Pura80/67a46e928d1284071.jpg_e1080.webp', '华为Pura 80，影像旗舰，超感知影像系统', 1, 1);

-- iPhone商品 (shop_id = 2)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('iPhone 14', 'phone', 4999.00, 5999.00, 50, '/image/phone/iphone/iphone14/111850_iphone-14_1.png', 'iPhone 14，A15芯片，超视网膜显示屏', 1, 2),
('iPhone 14 Pro', 'phone', 6999.00, 7999.00, 30, '/image/phone/iphone/iphone14pro/111846_sp875-sp876-iphone14-pro-promax.png', 'iPhone 14 Pro，灵动岛，ProMotion显示屏', 1, 2),
('iPhone 15', 'phone', 5999.00, 6999.00, 100, '/image/phone/iphone/iphone15/iphone_15_hero.png', 'iPhone 15，A16芯片，USB-C接口', 1, 2),
('iPhone 15 Pro', 'phone', 7999.00, 8999.00, 60, '/image/phone/iphone/iphone15pro/iphone_15_pro.png', 'iPhone 15 Pro，钛金属设计，A17 Pro芯片', 1, 2),
('iPhone 16', 'phone', 6999.00, 7999.00, 120, '/image/phone/iphone/iphone16/iphone-16-model-unselect-gallery-1-202409.webp', 'iPhone 16，A18芯片，相机控制按钮', 1, 2),
('iPhone 16 Pro', 'phone', 8999.00, 9999.00, 80, '/image/phone/iphone/iphone16pro/iphone-16-pro-a.jpg', 'iPhone 16 Pro，A18 Pro芯片，4K 120fps视频', 1, 2),
('iPhone 17', 'phone', 7999.00, 8999.00, 150, '/image/phone/iphone/iphone17/iPhone_17_Lavender_Singapore.webp', 'iPhone 17，全新设计，A19芯片', 1, 2),
('iPhone 17 Pro', 'phone', 9999.00, 10999.00, 100, '/image/phone/iphone/iphone17pro/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange.webp', 'iPhone 17 Pro，A19 Pro芯片，专业影像系统', 1, 2);

-- 一加商品 (shop_id = 3) - 注意：文件夹名是 "Turobo 6" (有空格)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('一加 15', 'phone', 4299.00, 4599.00, 60, '/image/phone/oneplus/15/35733938.jpg', '一加15，骁龙旗舰，哈苏影像', 1, 3),
('一加 Ace Turbo 6', 'phone', 2999.00, 3299.00, 80, '/image/phone/oneplus/Turobo 6/44367411.jpg', '一加Ace Turbo 6，性能怪兽，超级快充', 1, 3);

-- OPPO商品 (shop_id = 4)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('OPPO A6c', 'phone', 1599.00, 1799.00, 200, '/image/phone/oppo/A6c/45032584_sn7.jpg', 'OPPO A6c，轻薄设计，超长续航', 1, 4),
('OPPO Find X9', 'phone', 5999.00, 6499.00, 50, '/image/phone/oppo/FindX9/68863d7607c3b3852.jpg_e1080.webp', 'OPPO Find X9，旗舰影像，哈苏联合调校', 1, 4);

-- 三星商品 (shop_id = 5) - 注意：文件夹名是 "GalaryS26Ultra" (拼写)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('三星 Galaxy S26', 'phone', 5999.00, 6499.00, 70, '/image/phone/samsung/GalaxyS26/6906bcd9105b58800.jpg_e1080.webp', '三星Galaxy S26，AI手机，超清屏幕', 1, 5),
('三星 Galaxy S26 Ultra', 'phone', 8999.00, 9999.00, 40, '/image/phone/samsung/GalaryS26Ultra/68b19062ce4dd2355.jpg_e1080.webp', '三星Galaxy S26 Ultra，顶级旗舰，S Pen', 1, 5);

-- vivo商品 (shop_id = 6) - 注意：文件夹名是小写 "x200"
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('vivo S20', 'phone', 2699.00, 2999.00, 100, '/image/phone/vivo/S20/23763212.jpg', 'vivo S20，柔光自拍，轻薄设计', 1, 6),
('vivo Y500', 'phone', 1999.00, 2199.00, 150, '/image/phone/vivo/Y500/OIP-C.webp', 'vivo Y500，大电池，超长续航', 1, 6),
('vivo X200', 'phone', 4999.00, 5499.00, 60, '/image/phone/vivo/x200/670d2dd3700624602.png_e1080.webp', 'vivo X200，蔡司影像，旗舰体验', 1, 6);

-- 小米商品 (shop_id = 7) - 注意：文件夹名是 "REDMIturbo5"
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('小米 16', 'phone', 3999.00, 4299.00, 120, '/image/phone/xiaomi/16/v2-119259195df38fc720392bd8dd8dc725_1440w.jpg', '小米16，骁龙旗舰，徕卡影像', 1, 7),
('小米 17', 'phone', 4499.00, 4799.00, 100, '/image/phone/xiaomi/17/ceB9aUff1dxEE.jpg', '小米17，全新设计，澎湃OS', 1, 7),
('Redmi Turbo 5', 'phone', 1999.00, 2199.00, 200, '/image/phone/xiaomi/REDMIturbo5/1e30e924b899a9014c08e90b60cc1d7b02087bf45fce.webp', 'Redmi Turbo 5，性能小金刚，超值之选', 1, 7);

-- iQOO商品 (shop_id = 8) - 注意：文件夹名是大写 "IQOO"
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('iQOO 15', 'phone', 3999.00, 4299.00, 100, '/image/phone/IQOO/15/6928404611ec97447.png_e1080.webp', 'iQOO 15，电竞旗舰，超级性能', 1, 8);

-- realme商品 (shop_id = 9) - 注意：文件夹名带 "realme" 前缀
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('realme GT 8 Pro', 'phone', 3499.00, 3799.00, 80, '/image/phone/realme/realmeGT8pro/605c60a68c511.jpg', 'realme GT 8 Pro，性能旗舰，游戏利器', 1, 9),
('realme 16 Pro', 'phone', 2999.00, 3299.00, 100, '/image/phone/realme/realme16pro/b0ad1676be93efe8.png', 'realme 16 Pro，轻薄设计，强劲性能', 1, 9),
('realme Neo 8', 'phone', 2499.00, 2799.00, 120, '/image/phone/realme/realmeNeo8/605c60a68c511.jpg', 'realme Neo 8，性价比之王，潮流设计', 1, 9);

-- ============================================================
-- 4. 商品多图数据 (product_images)
-- ============================================================

-- 华为 Mate 80 (product_id = 1)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(1, '/image/phone/huawei/Mate80/68692be190c474408.png_e1080.webp', 1),
(1, '/image/phone/huawei/Mate80/68f6e37e11082615.jpg_e1080.webp', 2),
(1, '/image/phone/huawei/Mate80/691ad5da45aa35639.jpg_e1080.webp', 3);

-- 华为 Pura 80 (product_id = 2)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(2, '/image/phone/huawei/Pura80/67a46e928d1284071.jpg_e1080.webp', 1),
(2, '/image/phone/huawei/Pura80/6849030ee24f43776.jpg_e1080.webp', 2),
(2, '/image/phone/huawei/Pura80/684fc3b977595111.jpg_e1080.webp', 3);

-- iPhone 14 (product_id = 3)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(3, '/image/phone/iphone/iphone14/111850_iphone-14_1.png', 1),
(3, '/image/phone/iphone/iphone14/OIP-C.webp', 2),
(3, '/image/phone/iphone/iphone14/a6d2c64ce769b9c3.png', 3),
(3, '/image/phone/iphone/iphone14/v2-9a738879ffc039791465bbd87c2d5f21_720w.jpg', 4);

-- iPhone 14 Pro (product_id = 4)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(4, '/image/phone/iphone/iphone14pro/111846_sp875-sp876-iphone14-pro-promax.png', 1),
(4, '/image/phone/iphone/iphone14pro/648d7d7cef10c2834.jpg_e1080.webp', 2),
(4, '/image/phone/iphone/iphone14pro/OIP-C.webp', 3);

-- iPhone 15 (product_id = 5)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(5, '/image/phone/iphone/iphone15/OIP-C.webp', 1),
(5, '/image/phone/iphone/iphone15/iphone_15_hero.png', 2);

-- iPhone 15 Pro (product_id = 6)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(6, '/image/phone/iphone/iphone15pro/OIP-C.webp', 1),
(6, '/image/phone/iphone/iphone15pro/iphone_15_pro.png', 2);

-- iPhone 16 (product_id = 7)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(7, '/image/phone/iphone/iphone16/613Dze2vmCL._AC_SX679_.jpg', 1),
(7, '/image/phone/iphone/iphone16/iphone-16-model-unselect-gallery-1-202409.webp', 2);

-- iPhone 16 Pro (product_id = 8)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(8, '/image/phone/iphone/iphone16pro/iphone-16-pro-a.jpg', 1),
(8, '/image/phone/iphone/iphone16pro/iphone-16-Pro-b.jpg', 2),
(8, '/image/phone/iphone/iphone16pro/iphone-16-Pro-c.jpg', 3),
(8, '/image/phone/iphone/iphone16pro/iphone-16-Pro-d.jpg', 4);

-- iPhone 17 (product_id = 9)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(9, '/image/phone/iphone/iphone17/iPhone_17_Lavender_Singapore.webp', 1),
(9, '/image/phone/iphone/iphone17/iPhone_17_Mist_Blue_Singapore.webp', 2),
(9, '/image/phone/iphone/iphone17/iPhone_17_Sage_Singapore.webp', 3);

-- iPhone 17 Pro (product_id = 10)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(10, '/image/phone/iphone/iphone17pro/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange.webp', 1),
(10, '/image/phone/iphone/iphone17pro/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange_AV1.webp', 2),
(10, '/image/phone/iphone/iphone17pro/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange_AV3.webp', 3);

-- 一加 15 (product_id = 11)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(11, '/image/phone/oneplus/15/35733938.jpg', 1),
(11, '/image/phone/oneplus/15/6862c2f7295aa2510.jpg_e1080.webp', 2),
(11, '/image/phone/oneplus/15/68b796d5297023417.jpg_e1080.webp', 3);

-- 一加 Ace Turbo 6 (product_id = 12) - 注意：文件夹名是 "Turobo 6"
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(12, '/image/phone/oneplus/Turobo 6/44367411.jpg', 1),
(12, '/image/phone/oneplus/Turobo 6/OIP-C.webp', 2);

-- OPPO A6c (product_id = 13)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(13, '/image/phone/oppo/A6c/45032584_sn7.jpg', 1),
(13, '/image/phone/oppo/A6c/ceXsqIP7wXsA.jpg', 2),
(13, '/image/phone/oppo/A6c/f8abbcdae910f78ad330009c91eaeeb1-1803551226.jpg', 3);

-- OPPO Find X9 (product_id = 14)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(14, '/image/phone/oppo/FindX9/68863d7607c3b3852.jpg_e1080.webp', 1),
(14, '/image/phone/oppo/FindX9/68d279269a65b3881.jpg_e1080.webp', 2),
(14, '/image/phone/oppo/FindX9/68d2792836d676036.jpg_e1080.webp', 3),
(14, '/image/phone/oppo/FindX9/68e7864eb9d7b3430.jpg_e1080.webp', 4);

-- 三星 Galaxy S26 (product_id = 15)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(15, '/image/phone/samsung/GalaxyS26/6906bcd9105b58800.jpg_e1080.webp', 1),
(15, '/image/phone/samsung/GalaxyS26/R-C.jpg', 2);

-- 三星 Galaxy S26 Ultra (product_id = 16) - 注意：文件夹名是 "GalaryS26Ultra"
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(16, '/image/phone/samsung/GalaryS26Ultra/68b19062ce4dd2355.jpg_e1080.webp', 1),
(16, '/image/phone/samsung/GalaryS26Ultra/68cfd3e4ee0f92143.jpg_e1080.webp', 2);

-- vivo S20 (product_id = 17)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(17, '/image/phone/vivo/S20/23763212.jpg', 1),
(17, '/image/phone/vivo/S20/674ed0996ad473182.jpg_e1080.webp', 2),
(17, '/image/phone/vivo/S20/e0d6ca27037da05bdc18adc95d08e344.jpeg', 3);

-- vivo Y500 (product_id = 18)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(18, '/image/phone/vivo/Y500/OIP-C.webp', 1),
(18, '/image/phone/vivo/Y500/ceRgAeQ7f07ys.jpg', 2);

-- vivo X200 (product_id = 19) - 注意：文件夹名是小写 "x200"
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(19, '/image/phone/vivo/x200/670d2dd3700624602.png_e1080.webp', 1),
(19, '/image/phone/vivo/x200/ChMkK2cNLEKIP7xVAAGJUMh15HYAAkVtQIuubYAAYlo990.jpg', 2),
(19, '/image/phone/vivo/x200/f796f5ee887ebc390dba91e9644f4ae7.png!a', 3);

-- 小米 16 (product_id = 20)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(20, '/image/phone/xiaomi/16/v2-119259195df38fc720392bd8dd8dc725_1440w.jpg', 1),
(20, '/image/phone/xiaomi/16/v2-455e50d29d390edc99c1695eb5cd8edb_1440w.webp', 2);

-- 小米 17 (product_id = 21)
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(21, '/image/phone/xiaomi/17/ceB9aUff1dxEE.jpg', 1),
(21, '/image/phone/xiaomi/17/ceNaZ75WyDJc.jpg', 2),
(21, '/image/phone/xiaomi/17/cefbKkPnqtwT.jpg', 3);

-- Redmi Turbo 5 (product_id = 22) - 注意：文件夹名是 "REDMIturbo5"
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(22, '/image/phone/xiaomi/REDMIturbo5/1e30e924b899a9014c08e90b60cc1d7b02087bf45fce.webp', 1),
(22, '/image/phone/xiaomi/REDMIturbo5/c2fdfc039245d688d43fb04cda9b6a1ed21b0ff48e98.webp', 2);

-- iQOO 15 (product_id = 23) - 注意：文件夹名是大写 "IQOO"
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(23, '/image/phone/IQOO/15/6928404611ec97447.png_e1080.webp', 1),
(23, '/image/phone/IQOO/15/47c4fbd0ceb5859b0e1a23285027c105.jpeg', 2),
(23, '/image/phone/IQOO/15/68f9bd0262de97021.jpg_e1080.webp', 3);

-- realme GT 8 Pro (product_id = 24) - 注意：文件夹名是 "realmeGT8pro"
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(24, '/image/phone/realme/realmeGT8pro/605c60a68c511.jpg', 1),
(24, '/image/phone/realme/realmeGT8pro/OIP-C.webp', 2);

-- realme 16 Pro (product_id = 25) - 注意：文件夹名是 "realme16pro"
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(25, '/image/phone/realme/realme16pro/b0ad1676be93efe8.png', 1),
(25, '/image/phone/realme/realme16pro/4298abfd4f435c1f.png', 2),
(25, '/image/phone/realme/realme16pro/4eb5d7f2f64c4319.png', 3);

-- realme Neo 8 (product_id = 26) - 注意：文件夹名是 "realmeNeo8"
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
(26, '/image/phone/realme/realmeNeo8/605c60a68c511.jpg', 1),
(26, '/image/phone/realme/realmeNeo8/605c609ed476d.jpg', 2),
(26, '/image/phone/realme/realmeNeo8/OIP-C.webp', 3);

-- ============================================================
-- 5. 商品详情数据
-- ============================================================

-- 华为 Mate 80 (id=1)
UPDATE products SET 
    brand = '华为',
    model = 'Mate 80',
    color = '曜金黑/雪域白/青山黛',
    material = '昆仑玻璃，素皮后盖',
    specifications = '{"屏幕":"6.82英寸OLED曲面屏，1-120Hz LTPO","处理器":"麒麟9100","存储":"12GB+256GB/12GB+512GB","摄像头":"5000万像素超感知主摄+4800万超广角+6400万潜望长焦","电池":"5500mAh","快充":"100W有线+80W无线","系统":"HarmonyOS 5.0"}',
    features = '• 麒麟9100旗舰芯片，性能强劲\n• 卫星通信功能，无信号也能通话\n• 昆仑玻璃，抗摔能力提升10倍\n• XMAGE超感知影像系统\n• 鸿蒙5.0系统，智慧体验',
    packaging_list = '华为Mate 80 x1\n100W充电器 x1\nUSB-C数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1\n三包凭证 x1'
WHERE id = 1;

-- 华为 Pura 80 (id=2)
UPDATE products SET 
    brand = '华为',
    model = 'Pura 80',
    color = '羽砂紫/羽砂黑/冰霜银',
    material = '昆仑玻璃，玻璃后盖',
    specifications = '{"屏幕":"6.7英寸OLED直屏，1-120Hz","处理器":"麒麟9100","存储":"12GB+512GB","摄像头":"一英寸大底主摄5000万像素+4800万超广角+6400万长焦","电池":"5000mAh","快充":"100W有线+66W无线","系统":"HarmonyOS 5.0"}',
    features = '• 一英寸大底主摄，夜景更出色\n• XMAGE影像系统，专业级拍照\n• 麒麟9100芯片，旗舰性能\n• 鸿蒙5.0，智慧互联\n• 轻薄设计，手感舒适',
    packaging_list = '华为Pura 80 x1\n100W充电器 x1\nUSB-C数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1\n三包凭证 x1'
WHERE id = 2;

-- iPhone 14 (id=3)
UPDATE products SET 
    brand = 'Apple',
    model = 'iPhone 14',
    color = '午夜色/星光色/蓝色/紫色/红色',
    material = '铝金属边框，超瓷晶面板，玻璃后盖',
    specifications = '{"屏幕":"6.1英寸超视网膜XDR显示屏","处理器":"A15仿生芯片","存储":"128GB/256GB/512GB","摄像头":"1200万像素主摄+1200万超广角","电池":"3279mAh","系统":"iOS 17"}',
    features = '• A15仿生芯片，性能流畅\n• 超视网膜XDR显示屏\n• 车祸检测功能\n• 紧急SOS卫星通信\n• 灵动岛设计',
    packaging_list = 'iPhone 14 x1\nUSB-C转Lightning连接线 x1\n资料 x1'
WHERE id = 3;

-- iPhone 14 Pro (id=4)
UPDATE products SET 
    brand = 'Apple',
    model = 'iPhone 14 Pro',
    color = '深空黑/银色/金色/暗紫色',
    material = '不锈钢边框，超瓷晶面板，玻璃后盖',
    specifications = '{"屏幕":"6.1英寸超视网膜XDR显示屏，ProMotion 120Hz","处理器":"A16仿生芯片","存储":"128GB/256GB/512GB/1TB","摄像头":"4800万像素主摄+1200万超广角+1200万长焦","电池":"3200mAh","系统":"iOS 17"}',
    features = '• 灵动岛交互设计\n• 4800万像素主摄，专业摄影\n• ProMotion自适应刷新率\n• A16仿生芯片，性能强劲\n• 全天候显示',
    packaging_list = 'iPhone 14 Pro x1\nUSB-C转Lightning连接线 x1\n资料 x1'
WHERE id = 4;

-- iPhone 15 (id=5)
UPDATE products SET 
    brand = 'Apple',
    model = 'iPhone 15',
    color = '粉色/黄色/绿色/蓝色/黑色',
    material = '铝金属边框，超瓷晶面板，玻璃后盖',
    specifications = '{"屏幕":"6.1英寸超视网膜XDR显示屏","处理器":"A16仿生芯片","存储":"128GB/256GB/512GB","摄像头":"4800万像素主摄+1200万超广角","电池":"3349mAh","接口":"USB-C","系统":"iOS 17"}',
    features = '• USB-C接口，充电更方便\n• 4800万像素主摄\n• 灵动岛设计\n• A16仿生芯片\n• 全新配色，时尚外观',
    packaging_list = 'iPhone 15 x1\nUSB-C充电线 x1\n资料 x1'
WHERE id = 5;

-- iPhone 15 Pro (id=6)
UPDATE products SET 
    brand = 'Apple',
    model = 'iPhone 15 Pro',
    color = '原色钛金属/蓝色钛金属/白色钛金属/黑色钛金属',
    material = '钛金属边框，超瓷晶面板，玻璃后盖',
    specifications = '{"屏幕":"6.1英寸超视网膜XDR显示屏，ProMotion 120Hz","处理器":"A17 Pro芯片","存储":"128GB/256GB/512GB/1TB","摄像头":"4800万像素主摄+1200万超广角+1200万长焦","电池":"3274mAh","接口":"USB-C","系统":"iOS 17"}',
    features = '• 钛金属设计，更轻更坚固\n• A17 Pro芯片，游戏性能翻倍\n• USB-C接口，传输更快\n• 4800万像素主摄\n• 动作按钮，快捷操作',
    packaging_list = 'iPhone 15 Pro x1\nUSB-C充电线 x1\n资料 x1'
WHERE id = 6;

-- iPhone 16 (id=7)
UPDATE products SET 
    brand = 'Apple',
    model = 'iPhone 16',
    color = '群青色/深青色/粉色/白色/黑色',
    material = '铝金属边框，超瓷晶面板，玻璃后盖',
    specifications = '{"屏幕":"6.1英寸超视网膜XDR显示屏","处理器":"A18芯片","存储":"128GB/256GB/512GB","摄像头":"4800万像素主摄+1200万超广角","电池":"3561mAh","接口":"USB-C","系统":"iOS 18"}',
    features = '• A18芯片，性能更强\n• 相机控制按钮，拍照更便捷\n• 4800万像素融合式主摄\n• 全新配色设计\n• 支持Apple Intelligence',
    packaging_list = 'iPhone 16 x1\nUSB-C充电线 x1\n资料 x1'
WHERE id = 7;

-- iPhone 16 Pro (id=8)
UPDATE products SET 
    brand = 'Apple',
    model = 'iPhone 16 Pro',
    color = '原色钛金属/沙漠钛金属/白色钛金属/黑色钛金属',
    material = '钛金属边框，超瓷晶面板，玻璃后盖',
    specifications = '{"屏幕":"6.3英寸超视网膜XDR显示屏，ProMotion 120Hz","处理器":"A18 Pro芯片","存储":"256GB/512GB/1TB","摄像头":"4800万像素主摄+4800万超广角+1200万长焦","电池":"3582mAh","接口":"USB-C","系统":"iOS 18"}',
    features = '• A18 Pro芯片，性能巅峰\n• 4K 120fps杜比视频拍摄\n• 相机控制按钮\n• 钛金属设计，更轻更坚固\n• 支持Apple Intelligence',
    packaging_list = 'iPhone 16 Pro x1\nUSB-C充电线 x1\n资料 x1'
WHERE id = 8;

-- iPhone 17 (id=9)
UPDATE products SET 
    brand = 'Apple',
    model = 'iPhone 17',
    color = '薰衣草紫/薄雾蓝/鼠尾草绿/星光色/午夜色',
    material = '铝金属边框，超瓷晶面板，玻璃后盖',
    specifications = '{"屏幕":"6.3英寸超视网膜XDR显示屏","处理器":"A19芯片","存储":"128GB/256GB/512GB","摄像头":"4800万像素主摄+2400万超广角","电池":"3800mAh","接口":"USB-C","系统":"iOS 19"}',
    features = '• A19芯片，性能飞跃\n• 全新设计语言\n• 4800万像素主摄\n• Apple Intelligence深度集成\n• 超长续航',
    packaging_list = 'iPhone 17 x1\nUSB-C充电线 x1\n资料 x1'
WHERE id = 9;

-- iPhone 17 Pro (id=10)
UPDATE products SET 
    brand = 'Apple',
    model = 'iPhone 17 Pro',
    color = '宇宙橙/钛原色/钛银色/钛黑色',
    material = '钛金属边框，超瓷晶面板，玻璃后盖',
    specifications = '{"屏幕":"6.3英寸超视网膜XDR显示屏，ProMotion 120Hz","处理器":"A19 Pro芯片","存储":"256GB/512GB/1TB/2TB","摄像头":"4800万像素主摄+4800万超广角+1200万潜望长焦","电池":"4000mAh","接口":"USB-C","系统":"iOS 19"}',
    features = '• A19 Pro芯片，极致性能\n• 潜望式长焦镜头，5倍光学变焦\n• 专业级影像系统\n• Apple Intelligence全面支持\n• 钛金属设计',
    packaging_list = 'iPhone 17 Pro x1\nUSB-C充电线 x1\n资料 x1'
WHERE id = 10;

-- 一加 15 (id=11)
UPDATE products SET 
    brand = '一加',
    model = 'OnePlus 15',
    color = '黑洞/极光绿/冰川白',
    material = 'AG玻璃后盖，金属中框',
    specifications = '{"屏幕":"6.82英寸2K LTPO AMOLED，1-120Hz","处理器":"骁龙8 Gen 4","存储":"16GB+256GB/16GB+512GB","摄像头":"5000万像素主摄(哈苏)+5000万超广角+6400万长焦","电池":"5500mAh","快充":"100W有线+50W无线","系统":"OxygenOS 15"}',
    features = '• 骁龙8 Gen 4旗舰芯片\n• 哈苏专业影像系统\n• 2K LTPO屏幕，省电流畅\n• 100W超级闪充\n• 金属中框，质感升级',
    packaging_list = '一加15 x1\n100W充电器 x1\n数据线 x1\n保护壳 x1\n贴膜 x1\n快速指南 x1'
WHERE id = 11;

-- 一加 Ace Turbo 6 (id=12)
UPDATE products SET 
    brand = '一加',
    model = '一加 Ace Turbo 6',
    color = '钛空灰/星际蓝',
    material = '塑料后盖，塑料中框',
    specifications = '{"屏幕":"6.78英寸1.5K AMOLED，120Hz","处理器":"骁龙8s Gen 3","存储":"12GB+256GB/16GB+512GB","摄像头":"5000万像素主摄+800万超广角","电池":"6000mAh","快充":"120W超级闪充","系统":"ColorOS 14"}',
    features = '• 骁龙8s Gen 3，性能强劲\n• 6000mAh超大电池\n• 120W超级闪充，19分钟充满\n• 天工散热系统\n• 性价比之选',
    packaging_list = '一加Ace Turbo 6 x1\n120W充电器 x1\n数据线 x1\n保护壳 x1\n快速指南 x1'
WHERE id = 12;

-- OPPO A6c (id=13)
UPDATE products SET 
    brand = 'OPPO',
    model = 'OPPO A6c',
    color = '星空黑/珍珠白/薄荷绿',
    material = '塑料机身',
    specifications = '{"屏幕":"6.56英寸LCD水滴屏，90Hz","处理器":"天玑6300","存储":"8GB+128GB/8GB+256GB","摄像头":"5000万像素主摄+200万景深","电池":"5500mAh","快充":"33W快充","系统":"ColorOS 14"}',
    features = '• 轻薄设计，手感舒适\n• 5500mAh大电池，超长续航\n• 5000万像素主摄\n• 90Hz高刷屏\n• 入门首选',
    packaging_list = 'OPPO A6c x1\n33W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 13;

-- OPPO Find X9 (id=14)
UPDATE products SET 
    brand = 'OPPO',
    model = 'OPPO Find X9',
    color = '大漠银月/星河黑/云端紫',
    material = '素皮后盖，金属中框',
    specifications = '{"屏幕":"6.82英寸2K LTPO AMOLED，1-120Hz","处理器":"骁龙8 Gen 4","存储":"16GB+256GB/16GB+512GB","摄像头":"一英寸主摄5000万像素(哈苏)+5000万超广角+6400万潜望长焦","电池":"5500mAh","快充":"100W有线+50W无线","系统":"ColorOS 15"}',
    features = '• 一英寸大底主摄，夜景之王\n• 哈苏专业影像调校\n• 骁龙8 Gen 4旗舰芯片\n• 2K LTPO屏幕\n• 100W超级闪充',
    packaging_list = 'OPPO Find X9 x1\n100W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 14;

-- 三星 Galaxy S26 (id=15)
UPDATE products SET 
    brand = '三星',
    model = 'Galaxy S26',
    color = '墨黑/云白/紫罗兰/薄荷绿',
    material = '康宁大猩猩玻璃Victus 3，装甲铝边框',
    specifications = '{"屏幕":"6.2英寸Dynamic AMOLED 2X，120Hz","处理器":"骁龙8 Gen 4/Exynos 2500","存储":"12GB+256GB/12GB+512GB","摄像头":"5000万像素主摄+1200万超广角+1000万长焦","电池":"4500mAh","快充":"45W有线+15W无线","系统":"One UI 7"}',
    features = '• Galaxy AI智能体验\n• 骁龙8 Gen 4旗舰芯片\n• 5000万像素主摄\n• 防尘防水IP68\n• One UI 7智慧系统',
    packaging_list = 'Galaxy S26 x1\n45W充电器 x1\n数据线 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 15;

-- 三星 Galaxy S26 Ultra (id=16)
UPDATE products SET 
    brand = '三星',
    model = 'Galaxy S26 Ultra',
    color = '钛黑/钛白/钛蓝/钛灰',
    material = '康宁大猩猩玻璃Victus 3，钛金属边框',
    specifications = '{"屏幕":"6.9英寸Dynamic AMOLED 2X，120Hz","处理器":"骁龙8 Gen 4","存储":"12GB+256GB/12GB+512GB/16GB+1TB","摄像头":"2亿像素主摄+5000万超广角+1000万长焦+1200万潜望长焦","电池":"5500mAh","快充":"65W有线+45W无线","系统":"One UI 7"}',
    features = '• 2亿像素主摄，细节惊人\n• S Pen手写笔，办公利器\n• 钛金属边框，轻巧坚固\n• Galaxy AI深度集成\n• 顶级旗舰配置',
    packaging_list = 'Galaxy S26 Ultra x1\nS Pen x1\n65W充电器 x1\n数据线 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 16;

-- vivo S20 (id=17)
UPDATE products SET 
    brand = 'vivo',
    model = 'vivo S20',
    color = '花似锦/玉露白/烟雨青',
    material = '玻璃后盖，塑料中框',
    specifications = '{"屏幕":"6.67英寸AMOLED直屏，120Hz","处理器":"骁龙7 Gen 3","存储":"12GB+256GB/16GB+256GB","摄像头":"5000万像素主摄+800万超广角+5000万柔光自拍","电池":"5000mAh","快充":"80W闪充","系统":"OriginOS 4"}',
    features = '• 5000万柔光自拍，人像专家\n• 轻薄设计，颜值担当\n• 80W闪充，快速回血\n• 骁龙7 Gen 3，流畅体验\n• OriginOS 4智慧系统',
    packaging_list = 'vivo S20 x1\n80W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 17;

-- vivo Y500 (id=18)
UPDATE products SET 
    brand = 'vivo',
    model = 'vivo Y500',
    color = '星夜黑/冰川蓝',
    material = '塑料机身',
    specifications = '{"屏幕":"6.72英寸LCD直屏，90Hz","处理器":"天玑6100+","存储":"8GB+128GB/8GB+256GB","摄像头":"5000万像素主摄+200万景深","电池":"6000mAh","快充":"44W闪充","系统":"OriginOS 4"}',
    features = '• 6000mAh超大电池，续航无忧\n• 5000万像素主摄\n• 44W闪充\n• 90Hz高刷屏\n• 千元性价比之选',
    packaging_list = 'vivo Y500 x1\n44W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 18;

-- vivo X200 (id=19)
UPDATE products SET 
    brand = 'vivo',
    model = 'vivo X200',
    color = '华夏红/白月光/钛灰',
    material = '玻璃后盖，金属中框',
    specifications = '{"屏幕":"6.78英寸1.5K AMOLED曲面屏，120Hz","处理器":"天玑9400","存储":"12GB+256GB/16GB+512GB","摄像头":"5000万像素主摄(蔡司)+5000万超广角+5000万长焦","电池":"5500mAh","快充":"90W有线+50W无线","系统":"OriginOS 5"}',
    features = '• 天玑9400旗舰芯片\n• 蔡司专业影像系统\n• 5500mAh大电池\n• 90W闪充+50W无线充\n• OriginOS 5智慧系统',
    packaging_list = 'vivo X200 x1\n90W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 19;

-- 小米 16 (id=20)
UPDATE products SET 
    brand = '小米',
    model = '小米16',
    color = '黑色/白色/绿色/粉色',
    material = '玻璃后盖，金属中框',
    specifications = '{"屏幕":"6.36英寸1.5K LTPO AMOLED直屏，1-120Hz","处理器":"骁龙8 Gen 4","存储":"12GB+256GB/16GB+512GB","摄像头":"5000万像素主摄(徕卡)+5000万超广角+5000万长焦","电池":"5000mAh","快充":"90W有线+50W无线","系统":"澎湃OS 2"}',
    features = '• 骁龙8 Gen 4旗舰芯片\n• 徕卡专业影像系统\n• 澎湃OS 2智慧系统\n• 小尺寸旗舰，手感绝佳\n• 90W快充',
    packaging_list = '小米16 x1\n90W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 20;

-- 小米 17 (id=21)
UPDATE products SET 
    brand = '小米',
    model = '小米17',
    color = '远峰蓝/霞光紫/雪域白/曜石黑',
    material = '素皮后盖，金属中框',
    specifications = '{"屏幕":"6.78英寸2K LTPO AMOLED曲面屏，1-120Hz","处理器":"骁龙8 Gen 4","存储":"16GB+256GB/16GB+512GB/16GB+1TB","摄像头":"5000万像素主摄(徕卡)+5000万超广角+5000万潜望长焦","电池":"5500mAh","快充":"120W有线+80W无线","系统":"澎湃OS 2"}',
    features = '• 徕卡专业影像，潜望长焦\n• 骁龙8 Gen 4旗舰芯片\n• 120W超级快充\n• 全新设计语言\n• 澎湃OS 2智慧系统',
    packaging_list = '小米17 x1\n120W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 21;

-- Redmi Turbo 5 (id=22)
UPDATE products SET 
    brand = 'Redmi',
    model = 'Redmi Turbo 5',
    color = '冰晶银/暗夜黑/晴雪白',
    material = '玻璃后盖，塑料中框',
    specifications = '{"屏幕":"6.74英寸1.5K AMOLED直屏，144Hz","处理器":"骁龙8s Gen 3","存储":"12GB+256GB/16GB+512GB","摄像头":"5000万像素主摄+800万超广角","电池":"6000mAh","快充":"120W超级快充","系统":"澎湃OS 2"}',
    features = '• 骁龙8s Gen 3，性能小金刚\n• 6000mAh超大电池\n• 120W超级快充\n• 144Hz高刷屏\n• 性价比之王',
    packaging_list = 'Redmi Turbo 5 x1\n120W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 22;

-- iQOO 15 (id=23)
UPDATE products SET 
    brand = 'iQOO',
    model = 'iQOO 15',
    color = '传奇黑/赛道白/燃动红',
    material = 'AG玻璃后盖，金属中框',
    specifications = '{"屏幕":"6.82英寸2K LTPO AMOLED，1-144Hz","处理器":"骁龙8 Gen 4","存储":"16GB+256GB/16GB+512GB","摄像头":"5000万像素主摄+5000万超广角+6400万长焦","电池":"6000mAh","快充":"120W有线+50W无线","系统":"OriginOS 5"}',
    features = '• 骁龙8 Gen 4旗舰芯片\n• 电竞级144Hz高刷屏\n• 6000mAh超大电池\n• 120W超级闪充\n• 独立显示芯片Pro',
    packaging_list = 'iQOO 15 x1\n120W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 23;

-- realme GT 8 Pro (id=24)
UPDATE products SET 
    brand = 'realme',
    model = 'realme GT 8 Pro',
    color = '曙光白/暗夜黑/极速橙',
    material = 'AG玻璃后盖，塑料中框',
    specifications = '{"屏幕":"6.78英寸1.5K AMOLED，144Hz","处理器":"骁龙8 Gen 4","存储":"12GB+256GB/16GB+512GB","摄像头":"5000万像素主摄+800万超广角+200万微距","电池":"5500mAh","快充":"100W超级闪充","系统":"realme UI 6"}',
    features = '• 骁龙8 Gen 4旗舰芯片\n• 144Hz电竞屏\n• 100W超级闪充\n• GT模式5.0\n• 性能怪兽',
    packaging_list = 'realme GT 8 Pro x1\n100W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 24;

-- realme 16 Pro (id=25)
UPDATE products SET 
    brand = 'realme',
    model = 'realme 16 Pro',
    color = '星空蓝/月光白/薄荷绿',
    material = '玻璃后盖，塑料中框',
    specifications = '{"屏幕":"6.7英寸AMOLED，120Hz","处理器":"骁龙7 Gen 3","存储":"12GB+256GB/16GB+256GB","摄像头":"5000万像素主摄+800万超广角","电池":"5000mAh","快充":"80W闪充","系统":"realme UI 6"}',
    features = '• 骁龙7 Gen 3，性能强劲\n• 轻薄设计，手感舒适\n• 80W闪充，快速回血\n• 5000万像素主摄\n• 时尚外观',
    packaging_list = 'realme 16 Pro x1\n80W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 25;

-- realme Neo 8 (id=26)
UPDATE products SET 
    brand = 'realme',
    model = 'realme Neo 8',
    color = '极光紫/星际黑/晨曦金',
    material = '塑料机身',
    specifications = '{"屏幕":"6.67英寸AMOLED，120Hz","处理器":"天玑8300","存储":"8GB+128GB/12GB+256GB","摄像头":"5000万像素主摄+200万景深","电池":"5000mAh","快充":"67W闪充","系统":"realme UI 6"}',
    features = '• 天玑8300，性能均衡\n• 120Hz高刷屏\n• 67W闪充\n• 潮流设计\n• 性价比之选',
    packaging_list = 'realme Neo 8 x1\n67W充电器 x1\n数据线 x1\n保护壳 x1\n取卡针 x1\n快速指南 x1'
WHERE id = 26;
