-- ============================================================
-- 计算机商品初始化脚本（可多次执行）
-- 图片路径：/image/computer/品牌/型号/
-- ============================================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- ============================================================
-- 1. 清空计算机相关数据（不影响手机等其他分类）
-- ============================================================
DELETE FROM product_images WHERE product_id IN (SELECT id FROM products WHERE category = 'computer');
DELETE FROM products WHERE category = 'computer';
DELETE FROM shops WHERE folder IN ('asus', 'acer', 'dell', 'hp', 'lenovo', 'microsoft');

-- ============================================================
-- 2. 添加计算机相关店铺
-- 使用 INSERT IGNORE 避免重复插入已存在的店铺
-- ============================================================
INSERT IGNORE INTO shops (name, folder, description, sort_order) VALUES
('华为官方旗舰店', 'huawei', '华为官方授权店铺，正品保障', 1),
('Apple官方旗舰店', 'apple', 'Apple官方授权店铺，正品保障', 2),
('ASUS官方旗舰店', 'asus', '华硕官方授权店铺，正品保障', 10),
('Acer官方旗舰店', 'acer', '宏碁官方授权店铺，正品保障', 11),
('Dell官方旗舰店', 'dell', '戴尔官方授权店铺，正品保障', 12),
('HP官方旗舰店', 'hp', '惠普官方授权店铺，正品保障', 13),
('Lenovo官方旗舰店', 'lenovo', '联想官方授权店铺，正品保障', 14),
('Microsoft官方旗舰店', 'microsoft', '微软官方授权店铺，正品保障', 15);

-- ============================================================
-- 3. 计算机商品数据 (category = 'computer')
-- ============================================================

-- Apple电脑 (复用Apple店铺)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('MacBook Air 13', 'computer', 8999.00, 9999.00, 100, '/image/computer/Apple/MacBook Air 13/MacBook_Air_13_in_M3_Midnight_PDP_Image_Position_1__GBEN_e200e9d6-f6bf-4856-9cec-a60e76860ec7_500x.webp', 'MacBook Air 13，M3芯片，轻薄便携', 1, (SELECT id FROM shops WHERE folder = 'apple' LIMIT 1)),
('MacBook Air 15', 'computer', 12999.00, 13999.00, 80, '/image/computer/Apple/MacBook Air 15/Apple-WWDC23-MacBook-Air-15-in-hero-230605_big.jpg.large.jpg', 'MacBook Air 15，M3芯片，大屏体验', 1, (SELECT id FROM shops WHERE folder = 'apple' LIMIT 1)),
('MacBook Pro 14', 'computer', 16999.00, 18999.00, 60, '/image/computer/Apple/MacBook Pro 14/hero_endframe__e4ls9pihykya_xlarge.jpg', 'MacBook Pro 14，M3 Pro芯片，专业性能', 1, (SELECT id FROM shops WHERE folder = 'apple' LIMIT 1)),
('MacBook Pro 16', 'computer', 24999.00, 26999.00, 40, '/image/computer/Apple/MacBook Pro 16/apple-macbook-pro-16-inch-2023-m3-max_cah1.jpg', 'MacBook Pro 16，M3 Max芯片，极致性能', 1, (SELECT id FROM shops WHERE folder = 'apple' LIMIT 1)),
('Mac mini', 'computer', 4499.00, 4999.00, 120, '/image/computer/Apple/Mac mini/mac-mini__dvce2jrm11w2_og.jpg', 'Mac mini，M2芯片，小巧强劲', 1, (SELECT id FROM shops WHERE folder = 'apple' LIMIT 1)),
('iPad Air', 'computer', 4799.00, 5299.00, 150, '/image/computer/Apple/iPad Air/iPadAirFront.webp', 'iPad Air，M2芯片，轻薄平板', 1, (SELECT id FROM shops WHERE folder = 'apple' LIMIT 1)),
('iPad Pro', 'computer', 8999.00, 9999.00, 80, '/image/computer/Apple/iPad Pro/ipad-pro-finish-unselect-gallery-2-202405_FMT_WHH.jpg', 'iPad Pro，M4芯片，专业平板', 1, (SELECT id FROM shops WHERE folder = 'apple' LIMIT 1)),
('iPad mini', 'computer', 3999.00, 4499.00, 100, '/image/computer/Apple/iPad mini/ipad_mini_starlight_pdp_image_position_1_wifi__sg-en.jpg', 'iPad mini，A17 Pro芯片，小巧便携', 1, (SELECT id FROM shops WHERE folder = 'apple' LIMIT 1));

-- ASUS电脑
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('ProArt Studiobook', 'computer', 15999.00, 17999.00, 30, '/image/computer/ASUS/ProArt Studiobook/71qwuhKUGUL._AC_UF894,1000_QL80_.jpg', '华硕ProArt Studiobook，创作者专业笔记本', 1, (SELECT id FROM shops WHERE folder = 'asus' LIMIT 1));

-- Acer电脑
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('Predator Helios 16', 'computer', 12999.00, 14999.00, 40, '/image/computer/Acer/Predator/71sS7G5ZpQL.jpg', '宏碁Predator Helios 16，电竞游戏本', 1, (SELECT id FROM shops WHERE folder = 'acer' LIMIT 1));

-- Dell电脑
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('Alienware m16', 'computer', 18999.00, 20999.00, 30, '/image/computer/Dell/Alienware m16/laptop-alienware-m16-intel-pdp-hero.avif', '戴尔Alienware m16，旗舰游戏本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1)),
('Alienware x14', 'computer', 13999.00, 15999.00, 40, '/image/computer/Dell/Alienware x14/01_main_entry_img.jpg', '戴尔Alienware x14，轻薄游戏本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1)),
('Dell G15', 'computer', 7999.00, 8999.00, 80, '/image/computer/Dell/Dell G15/laptop-g-15-5530-pdp-hero-sl.avif', '戴尔G15，性价比游戏本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1)),
('Inspiron 16 Plus', 'computer', 6999.00, 7999.00, 100, '/image/computer/Dell/Inspiron 16 Plus/laptop-inspiron-16-7630-plus-intel-pdp-hero.jpg', '戴尔Inspiron 16 Plus，大屏办公本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1)),
('Latitude 5440', 'computer', 5999.00, 6999.00, 120, '/image/computer/Dell/Latitude 5440/ccw-thinos-latitude-5440-pdp-module-06a.webp', '戴尔Latitude 5440，商务办公本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1)),
('Latitude 7440', 'computer', 8999.00, 9999.00, 60, '/image/computer/Dell/Latitude 7440/notebook-latitude-14-7440-t-gray-gallery-1.avif', '戴尔Latitude 7440，高端商务本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1)),
('XPS 13', 'computer', 9999.00, 11999.00, 50, '/image/computer/Dell/XPS 13/Dell-XPS-13-9340-laptop.jpg', '戴尔XPS 13，超轻薄旗舰本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1)),
('XPS 14', 'computer', 12999.00, 14999.00, 40, '/image/computer/Dell/XPS 14/laptop-da14260t-gray-copilot-gallery-1.avif', '戴尔XPS 14，大屏轻薄本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1)),
('XPS 16', 'computer', 16999.00, 18999.00, 30, '/image/computer/Dell/XPS 16/laptop-dell-da16250t-gy-gallery-2.avif', '戴尔XPS 16，旗舰创作本', 1, (SELECT id FROM shops WHERE folder = 'dell' LIMIT 1));

-- HP电脑
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('EliteBook 1040', 'computer', 11999.00, 13999.00, 50, '/image/computer/HP/EliteBook 1040/hp-inc-elitebook-x360-1040-g11-u7-155h32gb1tb-ssd-a77nzpt-626301_2048x.webp', '惠普EliteBook 1040，高端商务本', 1, (SELECT id FROM shops WHERE folder = 'hp' LIMIT 1)),
('EliteBook 840', 'computer', 7999.00, 8999.00, 80, '/image/computer/HP/EliteBook 840/71rV0dQlcML.jpg', '惠普EliteBook 840，商务办公本', 1, (SELECT id FROM shops WHERE folder = 'hp' LIMIT 1)),
('Omen 16', 'computer', 8999.00, 9999.00, 60, '/image/computer/HP/Omen/01_1e9616e3-6b35-439e-abed-c9ff1b7522e8.webp', '惠普Omen 16，电竞游戏本', 1, (SELECT id FROM shops WHERE folder = 'hp' LIMIT 1)),
('Pavilion', 'computer', 5499.00, 6499.00, 100, '/image/computer/HP/Pavilion/HP Pavilion Aero 13 Laptop PC hero image of all four colors.avif', '惠普Pavilion，家用娱乐本', 1, (SELECT id FROM shops WHERE folder = 'hp' LIMIT 1)),
('Spectre', 'computer', 10999.00, 12999.00, 40, '/image/computer/HP/Spectre/2_82a9c4da-1691-4ee2-b25d-3bd01849423f.webp', '惠普Spectre，高端轻薄本', 1, (SELECT id FROM shops WHERE folder = 'hp' LIMIT 1));

-- 华为电脑 (复用华为店铺)
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('MateBook 14s', 'computer', 6999.00, 7999.00, 80, '/image/computer/HuaWei/MateBook 14s/1080-x-1080.jpg', '华为MateBook 14s，轻薄商务本', 1, (SELECT id FROM shops WHERE folder = 'huawei' LIMIT 1)),
('MateBook D14', 'computer', 4999.00, 5499.00, 120, '/image/computer/HuaWei/MateBook D14/huawei-matebook-d-14-2023-key-vision.jpg', '华为MateBook D14，性价比办公本', 1, (SELECT id FROM shops WHERE folder = 'huawei' LIMIT 1)),
('MateBook GT 14', 'computer', 7999.00, 8999.00, 60, '/image/computer/HuaWei/MateBook GT 14/huawei-matebook-gt-14-kv-01.png', '华为MateBook GT 14，性能轻薄本', 1, (SELECT id FROM shops WHERE folder = 'huawei' LIMIT 1)),
('MateBook X Pro', 'computer', 11999.00, 13999.00, 40, '/image/computer/HuaWei/MateBook X Pro/huawei-matebook-x-pro-2021-kv02.png', '华为MateBook X Pro，旗舰轻薄本', 1, (SELECT id FROM shops WHERE folder = 'huawei' LIMIT 1)),
('MateStation S', 'computer', 3999.00, 4499.00, 100, '/image/computer/HuaWei/MateStation S/huawei-matestation-s-my-02.webp', '华为MateStation S，迷你主机', 1, (SELECT id FROM shops WHERE folder = 'huawei' LIMIT 1));

-- Lenovo电脑
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('Legion R9000P', 'computer', 9999.00, 11999.00, 50, '/image/computer/Lenovo/R9000P/2024-Lenovo-Legion-R9000P.jpg', '联想拯救者R9000P，电竞游戏本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1)),
('ThinkBook 14', 'computer', 5499.00, 6499.00, 100, '/image/computer/Lenovo/ThinkBook 14/tnvBvImFaCAXm2uXbKSGJgjHo-7273.jpg', '联想ThinkBook 14，商务办公本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1)),
('Legion Y7000P', 'computer', 8499.00, 9499.00, 60, '/image/computer/Lenovo/Y7000P/Vj9LVCUDwo49jK8zRrGmBTVOx-9113.jpg', '联想拯救者Y7000P，主流游戏本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1)),
('Legion Y9000K', 'computer', 15999.00, 17999.00, 30, '/image/computer/Lenovo/Y9000K/mlFKsT7YFkS6NbttZydlbwGYO-2775.jpg', '联想拯救者Y9000K，旗舰游戏本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1)),
('Legion Y9000P', 'computer', 11999.00, 13999.00, 40, '/image/computer/Lenovo/Y9000P/KhHpj8GmPGG0gaITrUIgBQ0V0-9756.jpg', '联想拯救者Y9000P，高端游戏本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1)),
('Yoga Book 9i', 'computer', 13999.00, 15999.00, 30, '/image/computer/Lenovo/Yoga Book 9i/AEUBjKmgsbdWEdrEuw7MPAGkn-0287.jpg', '联想Yoga Book 9i，双屏创意本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1)),
('小新 16', 'computer', 4999.00, 5499.00, 120, '/image/computer/Lenovo/xiaoxin 16/7dMQ0ggdDI38BOloe5AwPkLbP-5415.jpg', '联想小新16，大屏轻薄本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1)),
('小新 Air14', 'computer', 4499.00, 4999.00, 150, '/image/computer/Lenovo/xiaoxin Air14/FgsrmD823OV9g9P9sp7KD8YzP-8162.jpg', '联想小新Air14，轻薄便携本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1)),
('小新 Pro14', 'computer', 5999.00, 6499.00, 100, '/image/computer/Lenovo/xiaoxin Pro14/657ibacNaDGDHwxmQVP1qJ3Al-9880.jpg', '联想小新Pro14，高性能轻薄本', 1, (SELECT id FROM shops WHERE folder = 'lenovo' LIMIT 1));

-- Microsoft电脑
INSERT INTO products (name, category, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('Surface Go 3', 'computer', 3999.00, 4499.00, 80, '/image/computer/Microsoft/Surface Go 3/Highlight-Surface-Go-3-Laptop-Touch-3000x1682.avif', '微软Surface Go 3，便携二合一', 1, (SELECT id FROM shops WHERE folder = 'microsoft' LIMIT 1)),
('Surface Laptop 5/6', 'computer', 8999.00, 9999.00, 50, '/image/computer/Microsoft/Surface Laptop 56/SPZ1B-Platinum-13-BB-00.avif', '微软Surface Laptop，轻薄笔记本', 1, (SELECT id FROM shops WHERE folder = 'microsoft' LIMIT 1)),
('Surface Laptop SE', 'computer', 2999.00, 3499.00, 100, '/image/computer/Microsoft/Surface Laptop SE/microsoft-surface-laptop-se.webp', '微软Surface Laptop SE，教育笔记本', 1, (SELECT id FROM shops WHERE folder = 'microsoft' LIMIT 1)),
('Surface Pro 9/10', 'computer', 7999.00, 8999.00, 60, '/image/computer/Microsoft/Surface Pro 910/SPZ2B-Platinum-BB-00.avif', '微软Surface Pro，专业二合一', 1, (SELECT id FROM shops WHERE folder = 'microsoft' LIMIT 1));

-- ============================================================
-- 4. 计算机商品多图数据
-- ============================================================

-- MacBook Air 13
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MacBook Air 13' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Air 13/MacBook_Air_13_in_M3_Midnight_PDP_Image_Position_1__GBEN_e200e9d6-f6bf-4856-9cec-a60e76860ec7_500x.webp', 1),
((SELECT id FROM products WHERE name = 'MacBook Air 13' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Air 13/air13teaser.jpg', 2),
((SELECT id FROM products WHERE name = 'MacBook Air 13' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Air 13/Apple_apple_macbook_air_13_2020_1027085827432_360x270.jpg', 3),
((SELECT id FROM products WHERE name = 'MacBook Air 13' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Air 13/mp00658677-1-apple-1741251969713.webp', 4);

-- MacBook Air 15
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MacBook Air 15' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Air 15/Apple-WWDC23-MacBook-Air-15-in-hero-230605_big.jpg.large.jpg', 1),
((SELECT id FROM products WHERE name = 'MacBook Air 15' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Air 15/04b12dd0784101cad209af0e1ea866ec.jpg', 2),
((SELECT id FROM products WHERE name = 'MacBook Air 15' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Air 15/images.jpg', 3);

-- MacBook Pro 14
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MacBook Pro 14' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Pro 14/hero_endframe__e4ls9pihykya_xlarge.jpg', 1),
((SELECT id FROM products WHERE name = 'MacBook Pro 14' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Pro 14/111902_mbp14-silver2.png', 2),
((SELECT id FROM products WHERE name = 'MacBook Pro 14' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Pro 14/csm_IMG_7743_defa0cb064.jpg', 3),
((SELECT id FROM products WHERE name = 'MacBook Pro 14' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Pro 14/images.jpg', 4);

-- MacBook Pro 16
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MacBook Pro 16' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Pro 16/apple-macbook-pro-16-inch-2023-m3-max_cah1.jpg', 1),
((SELECT id FROM products WHERE name = 'MacBook Pro 16' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Pro 16/IMG-15367296_4ab18919-b3df-4939-aa5c-7e13e6500cba.webp', 2),
((SELECT id FROM products WHERE name = 'MacBook Pro 16' AND category = 'computer' LIMIT 1), '/image/computer/Apple/MacBook Pro 16/images.jpg', 3);

-- Mac mini
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Mac mini' AND category = 'computer' LIMIT 1), '/image/computer/Apple/Mac mini/mac-mini__dvce2jrm11w2_og.jpg', 1),
((SELECT id FROM products WHERE name = 'Mac mini' AND category = 'computer' LIMIT 1), '/image/computer/Apple/Mac mini/apple-mac-mini-6.jpg', 2),
((SELECT id FROM products WHERE name = 'Mac mini' AND category = 'computer' LIMIT 1), '/image/computer/Apple/Mac mini/images (1).jpg', 3),
((SELECT id FROM products WHERE name = 'Mac mini' AND category = 'computer' LIMIT 1), '/image/computer/Apple/Mac mini/images.jpg', 4);

-- iPad Air
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'iPad Air' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Air/iPadAirFront.webp', 1),
((SELECT id FROM products WHERE name = 'iPad Air' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Air/548fd670-a47e-11ec-b9ef-ef1d74d381f2.jpg', 2),
((SELECT id FROM products WHERE name = 'iPad Air' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Air/images.jpg', 3),
((SELECT id FROM products WHERE name = 'iPad Air' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Air/s-l1200.png', 4);

-- iPad Pro
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'iPad Pro' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Pro/ipad-pro-finish-unselect-gallery-2-202405_FMT_WHH.jpg', 1),
((SELECT id FROM products WHERE name = 'iPad Pro' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Pro/images (1).jpg', 2),
((SELECT id FROM products WHERE name = 'iPad Pro' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Pro/images (2).jpg', 3),
((SELECT id FROM products WHERE name = 'iPad Pro' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Pro/images (3).jpg', 4),
((SELECT id FROM products WHERE name = 'iPad Pro' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Pro/images.jpg', 5),
((SELECT id FROM products WHERE name = 'iPad Pro' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad Pro/refurb-ipad-pro-11-wifi-silver-2019_AV1.jpg', 6);

-- iPad mini
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'iPad mini' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad mini/ipad_mini_starlight_pdp_image_position_1_wifi__sg-en.jpg', 1),
((SELECT id FROM products WHERE name = 'iPad mini' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad mini/Apple-iPad-mini-Procreate_quick-read-16x9.jpg.large.jpg', 2),
((SELECT id FROM products WHERE name = 'iPad mini' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad mini/images (1).jpg', 3),
((SELECT id FROM products WHERE name = 'iPad mini' AND category = 'computer' LIMIT 1), '/image/computer/Apple/iPad mini/ipad-mini-finish-select-gallery-202410-blue-wificell_AV1_FMT_WHH.jpg', 4);

-- ProArt Studiobook
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'ProArt Studiobook' AND category = 'computer' LIMIT 1), '/image/computer/ASUS/ProArt Studiobook/71qwuhKUGUL._AC_UF894,1000_QL80_.jpg', 1),
((SELECT id FROM products WHERE name = 'ProArt Studiobook' AND category = 'computer' LIMIT 1), '/image/computer/ASUS/ProArt Studiobook/819ayJuSDxL._AC_UF894,1000_QL80_.jpg', 2),
((SELECT id FROM products WHERE name = 'ProArt Studiobook' AND category = 'computer' LIMIT 1), '/image/computer/ASUS/ProArt Studiobook/csm_AKA7978_79668c31a9.jpg', 3),
((SELECT id FROM products WHERE name = 'ProArt Studiobook' AND category = 'computer' LIMIT 1), '/image/computer/ASUS/ProArt Studiobook/images.jpg', 4);

-- Predator Helios 16
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Predator Helios 16' AND category = 'computer' LIMIT 1), '/image/computer/Acer/Predator/71sS7G5ZpQL.jpg', 1),
((SELECT id FROM products WHERE name = 'Predator Helios 16' AND category = 'computer' LIMIT 1), '/image/computer/Acer/Predator/PREDATOR-HELIOS-16-AI_PH16-73-03.jpg', 2),
((SELECT id FROM products WHERE name = 'Predator Helios 16' AND category = 'computer' LIMIT 1), '/image/computer/Acer/Predator/Predator-Helios-700_PH717-17_01.png', 3);

-- Alienware m16
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Alienware m16' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Alienware m16/laptop-alienware-m16-intel-pdp-hero.avif', 1),
((SELECT id FROM products WHERE name = 'Alienware m16' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Alienware m16/ALIENWAREm16R25_103490.png', 2),
((SELECT id FROM products WHERE name = 'Alienware m16' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Alienware m16/laptop-alienware-aa16250nt-gallery-2.avif', 3),
((SELECT id FROM products WHERE name = 'Alienware m16' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Alienware m16/laptop-alienware-m16-amd-bk-usb-gallery-2.avif', 4);

-- Alienware x14
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Alienware x14' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Alienware x14/01_main_entry_img.jpg', 1),
((SELECT id FROM products WHERE name = 'Alienware x14' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Alienware x14/71ZOtcuTxbL._AC_UF894,1000_QL80_.jpg', 2),
((SELECT id FROM products WHERE name = 'Alienware x14' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Alienware x14/images.jpg', 3);

-- Dell G15
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Dell G15' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Dell G15/laptop-g-15-5530-pdp-hero-sl.avif', 1);

-- Inspiron 16 Plus
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Inspiron 16 Plus' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Inspiron 16 Plus/laptop-inspiron-16-7630-plus-intel-pdp-hero.jpg', 1);

-- Latitude 5440
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Latitude 5440' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Latitude 5440/ccw-thinos-latitude-5440-pdp-module-06a.webp', 1);

-- Latitude 7440
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Latitude 7440' AND category = 'computer' LIMIT 1), '/image/computer/Dell/Latitude 7440/notebook-latitude-14-7440-t-gray-gallery-1.avif', 1);

-- XPS 13
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'XPS 13' AND category = 'computer' LIMIT 1), '/image/computer/Dell/XPS 13/Dell-XPS-13-9340-laptop.jpg', 1);

-- XPS 14
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'XPS 14' AND category = 'computer' LIMIT 1), '/image/computer/Dell/XPS 14/laptop-da14260t-gray-copilot-gallery-1.avif', 1);

-- XPS 16
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'XPS 16' AND category = 'computer' LIMIT 1), '/image/computer/Dell/XPS 16/laptop-dell-da16250t-gy-gallery-2.avif', 1);

-- EliteBook 1040
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'EliteBook 1040' AND category = 'computer' LIMIT 1), '/image/computer/HP/EliteBook 1040/hp-inc-elitebook-x360-1040-g11-u7-155h32gb1tb-ssd-a77nzpt-626301_2048x.webp', 1);

-- EliteBook 840
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'EliteBook 840' AND category = 'computer' LIMIT 1), '/image/computer/HP/EliteBook 840/71rV0dQlcML.jpg', 1);

-- Omen 16
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Omen 16' AND category = 'computer' LIMIT 1), '/image/computer/HP/Omen/01_1e9616e3-6b35-439e-abed-c9ff1b7522e8.webp', 1);

-- Pavilion
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Pavilion' AND category = 'computer' LIMIT 1), '/image/computer/HP/Pavilion/HP Pavilion Aero 13 Laptop PC hero image of all four colors.avif', 1);

-- Spectre
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Spectre' AND category = 'computer' LIMIT 1), '/image/computer/HP/Spectre/2_82a9c4da-1691-4ee2-b25d-3bd01849423f.webp', 1);

-- MateBook 14s
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MateBook 14s' AND category = 'computer' LIMIT 1), '/image/computer/HuaWei/MateBook 14s/1080-x-1080.jpg', 1);

-- MateBook D14
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MateBook D14' AND category = 'computer' LIMIT 1), '/image/computer/HuaWei/MateBook D14/huawei-matebook-d-14-2023-key-vision.jpg', 1);

-- MateBook GT 14
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MateBook GT 14' AND category = 'computer' LIMIT 1), '/image/computer/HuaWei/MateBook GT 14/huawei-matebook-gt-14-kv-01.png', 1);

-- MateBook X Pro
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MateBook X Pro' AND category = 'computer' LIMIT 1), '/image/computer/HuaWei/MateBook X Pro/huawei-matebook-x-pro-2021-kv02.png', 1);

-- MateStation S
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'MateStation S' AND category = 'computer' LIMIT 1), '/image/computer/HuaWei/MateStation S/huawei-matestation-s-my-02.webp', 1);

-- Legion R9000P
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Legion R9000P' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/R9000P/2024-Lenovo-Legion-R9000P.jpg', 1);

-- ThinkBook 14
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'ThinkBook 14' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/ThinkBook 14/tnvBvImFaCAXm2uXbKSGJgjHo-7273.jpg', 1);

-- Legion Y7000P
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Legion Y7000P' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/Y7000P/Vj9LVCUDwo49jK8zRrGmBTVOx-9113.jpg', 1);

-- Legion Y9000K
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Legion Y9000K' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/Y9000K/mlFKsT7YFkS6NbttZydlbwGYO-2775.jpg', 1);

-- Legion Y9000P
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Legion Y9000P' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/Y9000P/KhHpj8GmPGG0gaITrUIgBQ0V0-9756.jpg', 1);

-- Yoga Book 9i
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Yoga Book 9i' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/Yoga Book 9i/AEUBjKmgsbdWEdrEuw7MPAGkn-0287.jpg', 1);

-- 小新 16
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小新 16' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/xiaoxin 16/7dMQ0ggdDI38BOloe5AwPkLbP-5415.jpg', 1);

-- 小新 Air14
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小新 Air14' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/xiaoxin Air14/FgsrmD823OV9g9P9sp7KD8YzP-8162.jpg', 1);

-- 小新 Pro14
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小新 Pro14' AND category = 'computer' LIMIT 1), '/image/computer/Lenovo/xiaoxin Pro14/657ibacNaDGDHwxmQVP1qJ3Al-9880.jpg', 1);

-- Surface Go 3
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Surface Go 3' AND category = 'computer' LIMIT 1), '/image/computer/Microsoft/Surface Go 3/Highlight-Surface-Go-3-Laptop-Touch-3000x1682.avif', 1);

-- Surface Laptop 5/6
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Surface Laptop 5/6' AND category = 'computer' LIMIT 1), '/image/computer/Microsoft/Surface Laptop 56/SPZ1B-Platinum-13-BB-00.avif', 1);

-- Surface Laptop SE
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Surface Laptop SE' AND category = 'computer' LIMIT 1), '/image/computer/Microsoft/Surface Laptop SE/microsoft-surface-laptop-se.webp', 1);

-- Surface Pro 9/10
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'Surface Pro 9/10' AND category = 'computer' LIMIT 1), '/image/computer/Microsoft/Surface Pro 910/SPZ2B-Platinum-BB-00.avif', 1);

-- ============================================================
-- 5. 商品详情数据
-- ============================================================

-- MacBook Air 13
UPDATE products SET 
    brand = 'Apple',
    model = 'MacBook Air 13',
    color = '午夜色/星光色/深空灰/银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"13.6英寸Liquid视网膜显示屏","处理器":"Apple M3芯片","存储":"8GB+256GB/8GB+512GB","显卡":"8核GPU","电池":"52.6Wh，最长18小时续航","接口":"MagSafe 3充电口，2个雷雳4接口","系统":"macOS Sonoma"}',
    features = '• M3芯片，性能强劲\n• 轻薄设计，仅1.24kg\n• 最长18小时续航\n• Liquid视网膜显示屏\n• 静音无风扇设计',
    packaging_list = 'MacBook Air x1\n30W USB-C电源适配器 x1\nUSB-C转MagSafe 3连接线 x1\n资料 x1'
WHERE name = 'MacBook Air 13' AND category = 'computer';

-- MacBook Air 15
UPDATE products SET 
    brand = 'Apple',
    model = 'MacBook Air 15',
    color = '午夜色/星光色/深空灰/银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"15.3英寸Liquid视网膜显示屏","处理器":"Apple M3芯片","存储":"8GB+256GB/8GB+512GB","显卡":"10核GPU","电池":"66.5Wh，最长18小时续航","接口":"MagSafe 3充电口，2个雷雳4接口","系统":"macOS Sonoma"}',
    features = '• M3芯片，性能强劲\n• 15.3英寸大屏\n• 轻薄设计，仅1.51kg\n• 最长18小时续航\n• 六扬声器系统',
    packaging_list = 'MacBook Air x1\n35W双USB-C端口电源适配器 x1\nUSB-C转MagSafe 3连接线 x1\n资料 x1'
WHERE name = 'MacBook Air 15' AND category = 'computer';

-- MacBook Pro 14
UPDATE products SET 
    brand = 'Apple',
    model = 'MacBook Pro 14',
    color = '深空黑/银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"14.2英寸Liquid视网膜XDR显示屏","处理器":"Apple M3 Pro芯片","存储":"18GB+512GB/18GB+1TB","显卡":"14核GPU","电池":"70Wh，最长17小时续航","接口":"MagSafe 3充电口，3个雷雳4接口，HDMI，SD卡槽","系统":"macOS Sonoma"}',
    features = '• M3 Pro芯片，专业性能\n• Liquid视网膜XDR显示屏\n• 最长17小时续航\n• 专业接口齐全\n• 主动散热设计',
    packaging_list = 'MacBook Pro x1\n70W USB-C电源适配器 x1\nUSB-C转MagSafe 3连接线 x1\n资料 x1'
WHERE name = 'MacBook Pro 14' AND category = 'computer';

-- MacBook Pro 16
UPDATE products SET 
    brand = 'Apple',
    model = 'MacBook Pro 16',
    color = '深空黑/银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"16.2英寸Liquid视网膜XDR显示屏","处理器":"Apple M3 Max芯片","存储":"36GB+1TB/48GB+1TB","显卡":"30核GPU","电池":"100Wh，最长22小时续航","接口":"MagSafe 3充电口，3个雷雳4接口，HDMI，SD卡槽","系统":"macOS Sonoma"}',
    features = '• M3 Max芯片，极致性能\n• 16.2英寸XDR显示屏\n• 最长22小时续航\n• 专业级性能\n• 主动散热设计',
    packaging_list = 'MacBook Pro x1\n100W USB-C电源适配器 x1\nUSB-C转MagSafe 3连接线 x1\n资料 x1'
WHERE name = 'MacBook Pro 16' AND category = 'computer';

-- Mac mini
UPDATE products SET 
    brand = 'Apple',
    model = 'Mac mini',
    color = '银色',
    material = '铝金属机身',
    specifications = '{"处理器":"Apple M2芯片","存储":"8GB+256GB/8GB+512GB","显卡":"10核GPU","接口":"2个雷雳4接口，HDMI，USB-A，以太网口","系统":"macOS Sonoma"}',
    features = '• M2芯片，性能强劲\n• 小巧设计，仅1.28kg\n• 丰富接口\n• 静音无风扇设计\n• 可连接多台显示器',
    packaging_list = 'Mac mini x1\n电源线 x1\n资料 x1'
WHERE name = 'Mac mini' AND category = 'computer';

-- iPad Air
UPDATE products SET 
    brand = 'Apple',
    model = 'iPad Air',
    color = '深空灰/星光色/粉色/紫色',
    material = '铝金属机身',
    specifications = '{"屏幕":"11英寸Liquid视网膜显示屏","处理器":"Apple M2芯片","存储":"128GB/256GB/512GB","摄像头":"1200万像素广角摄像头","接口":"USB-C","系统":"iPadOS 17"}',
    features = '• M2芯片，性能强劲\n• 轻薄设计，仅461g\n• 支持Apple Pencil Pro\n• 支持妙控键盘\n• 全天候电池续航',
    packaging_list = 'iPad Air x1\nUSB-C充电线 x1\n20W USB-C电源适配器 x1\n资料 x1'
WHERE name = 'iPad Air' AND category = 'computer';

-- iPad Pro
UPDATE products SET 
    brand = 'Apple',
    model = 'iPad Pro',
    color = '深空黑/银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"11英寸/13英寸Ultra视网膜XDR显示屏","处理器":"Apple M4芯片","存储":"256GB/512GB/1TB/2TB","摄像头":"1200万像素广角+超广角","接口":"USB-C/雷雳4","系统":"iPadOS 17"}',
    features = '• M4芯片，极致性能\n• Ultra视网膜XDR显示屏\n• 支持Apple Pencil Pro\n• 支持妙控键盘\n• 专业级创作工具',
    packaging_list = 'iPad Pro x1\nUSB-C充电线 x1\n资料 x1'
WHERE name = 'iPad Pro' AND category = 'computer';

-- iPad mini
UPDATE products SET 
    brand = 'Apple',
    model = 'iPad mini',
    color = '深空灰/星光色/粉色/紫色/蓝色',
    material = '铝金属机身',
    specifications = '{"屏幕":"8.3英寸Liquid视网膜显示屏","处理器":"A17 Pro芯片","存储":"128GB/256GB/512GB","摄像头":"1200万像素广角摄像头","接口":"USB-C","系统":"iPadOS 17"}',
    features = '• A17 Pro芯片，性能强劲\n• 小巧便携，仅293g\n• 支持Apple Pencil Pro\n• 全天候电池续航\n• 5G网络支持',
    packaging_list = 'iPad mini x1\nUSB-C充电线 x1\n20W USB-C电源适配器 x1\n资料 x1'
WHERE name = 'iPad mini' AND category = 'computer';

-- ProArt Studiobook
UPDATE products SET 
    brand = 'ASUS',
    model = 'ProArt Studiobook',
    color = '黑色',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸4K OLED显示屏","处理器":"Intel Core i9-13980HX","存储":"32GB+1TB","显卡":"NVIDIA RTX 4070","电池":"90Wh","系统":"Windows 11 Pro"}',
    features = '• 专业创作者笔记本\n• 4K OLED显示屏\n• 旋钮控制器\n• 专业色彩校准\n• 高性能配置',
    packaging_list = 'ProArt Studiobook x1\n电源适配器 x1\n资料 x1'
WHERE name = 'ProArt Studiobook' AND category = 'computer';

-- Predator Helios 16
UPDATE products SET 
    brand = 'Acer',
    model = 'Predator Helios 16',
    color = '黑色',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸2.5K 240Hz显示屏","处理器":"Intel Core i9-14900HX","存储":"32GB+1TB","显卡":"NVIDIA RTX 4080","电池":"90Wh","系统":"Windows 11 Home"}',
    features = '• 电竞游戏本\n• 240Hz高刷新率\n• 第5代AeroBlade风扇\n• RGB背光键盘\n• 高性能配置',
    packaging_list = 'Predator Helios 16 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Predator Helios 16' AND category = 'computer';

-- Alienware m16
UPDATE products SET 
    brand = 'Dell',
    model = 'Alienware m16',
    color = '月球暗面/星际银',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸2.5K 240Hz显示屏","处理器":"Intel Core i9-14900HX","存储":"32GB+2TB","显卡":"NVIDIA RTX 4090","电池":"97Wh","系统":"Windows 11 Home"}',
    features = '• 旗舰游戏本\n• 240Hz高刷新率\n• Cryo-Tech散热技术\n• Cherry机械键盘\n• AlienFX灯效',
    packaging_list = 'Alienware m16 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Alienware m16' AND category = 'computer';

-- Alienware x14
UPDATE products SET 
    brand = 'Dell',
    model = 'Alienware x14',
    color = '月球暗面',
    material = '金属机身',
    specifications = '{"屏幕":"14英寸2.5K 165Hz显示屏","处理器":"Intel Core i7-13620H","存储":"16GB+512GB","显卡":"NVIDIA RTX 4060","电池":"80Wh","系统":"Windows 11 Home"}',
    features = '• 轻薄游戏本\n• 165Hz高刷新率\n• 轻薄设计\n• AlienFX灯效\n• 高性能配置',
    packaging_list = 'Alienware x14 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Alienware x14' AND category = 'computer';

-- Dell G15
UPDATE products SET 
    brand = 'Dell',
    model = 'Dell G15',
    color = '暗月黑/量子蓝',
    material = '塑料机身',
    specifications = '{"屏幕":"15.6英寸FHD 165Hz显示屏","处理器":"Intel Core i7-13650HX","存储":"16GB+512GB","显卡":"NVIDIA RTX 4060","电池":"86Wh","系统":"Windows 11 Home"}',
    features = '• 性价比游戏本\n• 165Hz高刷新率\n• 散热性能优秀\n• 游戏性能强劲\n• 价格实惠',
    packaging_list = 'Dell G15 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Dell G15' AND category = 'computer';

-- Inspiron 16 Plus
UPDATE products SET 
    brand = 'Dell',
    model = 'Inspiron 16 Plus',
    color = '铂金银',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸3K 120Hz显示屏","处理器":"Intel Core i7-13700H","存储":"16GB+512GB","显卡":"NVIDIA RTX 4050","电池":"86Wh","系统":"Windows 11 Home"}',
    features = '• 大屏办公本\n• 3K分辨率\n• 性能均衡\n• 适合办公创作\n• 性价比高',
    packaging_list = 'Inspiron 16 Plus x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Inspiron 16 Plus' AND category = 'computer';

-- Latitude 5440
UPDATE products SET 
    brand = 'Dell',
    model = 'Latitude 5440',
    color = '钛灰',
    material = '金属机身',
    specifications = '{"屏幕":"14英寸FHD显示屏","处理器":"Intel Core i5-1345U","存储":"8GB+256GB","显卡":"Intel Iris Xe","电池":"58Wh","系统":"Windows 11 Pro"}',
    features = '• 商务办公本\n• 轻薄便携\n• 安全功能齐全\n• 续航持久\n• 企业级支持',
    packaging_list = 'Latitude 5440 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Latitude 5440' AND category = 'computer';

-- Latitude 7440
UPDATE products SET 
    brand = 'Dell',
    model = 'Latitude 7440',
    color = '钛灰',
    material = '金属机身',
    specifications = '{"屏幕":"14英寸2.5K显示屏","处理器":"Intel Core i7-1365U","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"58Wh","系统":"Windows 11 Pro"}',
    features = '• 高端商务本\n• 2.5K分辨率\n• 轻薄设计\n• 安全功能齐全\n• 企业级支持',
    packaging_list = 'Latitude 7440 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Latitude 7440' AND category = 'computer';

-- XPS 13
UPDATE products SET 
    brand = 'Dell',
    model = 'XPS 13',
    color = '铂金银/石墨灰',
    material = '铝金属机身',
    specifications = '{"屏幕":"13.4英寸3.5K OLED显示屏","处理器":"Intel Core i7-1360P","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"51Wh","系统":"Windows 11 Home"}',
    features = '• 超轻薄旗舰本\n• 3.5K OLED显示屏\n• 极窄边框设计\n• 仅1.19kg\n• 高端做工',
    packaging_list = 'XPS 13 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'XPS 13' AND category = 'computer';

-- XPS 14
UPDATE products SET 
    brand = 'Dell',
    model = 'XPS 14',
    color = '铂金银/石墨灰',
    material = '铝金属机身',
    specifications = '{"屏幕":"14.5英寸3.2K OLED显示屏","处理器":"Intel Core Ultra 7 155H","存储":"16GB+512GB","显卡":"Intel Arc","电池":"69.5Wh","系统":"Windows 11 Home"}',
    features = '• 大屏轻薄本\n• 3.2K OLED显示屏\n• Intel Core Ultra处理器\n• 仅1.68kg\n• 高端做工',
    packaging_list = 'XPS 14 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'XPS 14' AND category = 'computer';

-- XPS 16
UPDATE products SET 
    brand = 'Dell',
    model = 'XPS 16',
    color = '铂金银/石墨灰',
    material = '铝金属机身',
    specifications = '{"屏幕":"16英寸4K OLED显示屏","处理器":"Intel Core Ultra 9 185H","存储":"32GB+1TB","显卡":"NVIDIA RTX 4070","电池":"99.5Wh","系统":"Windows 11 Home"}',
    features = '• 旗舰创作本\n• 4K OLED显示屏\n• Intel Core Ultra处理器\n• 专业创作性能\n• 高端做工',
    packaging_list = 'XPS 16 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'XPS 16' AND category = 'computer';

-- EliteBook 1040
UPDATE products SET 
    brand = 'HP',
    model = 'EliteBook 1040',
    color = '银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"14英寸2.8K OLED显示屏","处理器":"Intel Core i7-1365U","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"51Wh","系统":"Windows 11 Pro"}',
    features = '• 高端商务本\n• 2.8K OLED显示屏\n• 轻薄设计\n• 安全功能齐全\n• 企业级支持',
    packaging_list = 'EliteBook 1040 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'EliteBook 1040' AND category = 'computer';

-- EliteBook 840
UPDATE products SET 
    brand = 'HP',
    model = 'EliteBook 840',
    color = '银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"14英寸FHD显示屏","处理器":"Intel Core i5-1335U","存储":"8GB+256GB","显卡":"Intel Iris Xe","电池":"51Wh","系统":"Windows 11 Pro"}',
    features = '• 商务办公本\n• 轻薄便携\n• 安全功能齐全\n• 续航持久\n• 企业级支持',
    packaging_list = 'EliteBook 840 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'EliteBook 840' AND category = 'computer';

-- Omen 16
UPDATE products SET 
    brand = 'HP',
    model = 'Omen 16',
    color = '陶瓷白/暗影黑',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸2.5K 165Hz显示屏","处理器":"Intel Core i7-13700HX","存储":"16GB+512GB","显卡":"NVIDIA RTX 4070","电池":"83Wh","系统":"Windows 11 Home"}',
    features = '• 电竞游戏本\n• 165Hz高刷新率\n• OMEN散热技术\n• RGB背光键盘\n• 高性能配置',
    packaging_list = 'Omen 16 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Omen 16' AND category = 'computer';

-- Pavilion
UPDATE products SET 
    brand = 'HP',
    model = 'Pavilion Aero 13',
    color = '陶瓷白/银色/玫瑰金',
    material = '铝金属机身',
    specifications = '{"屏幕":"13.3英寸2.5K显示屏","处理器":"AMD Ryzen 7 8840U","存储":"16GB+512GB","显卡":"AMD Radeon 780M","电池":"43Wh","系统":"Windows 11 Home"}',
    features = '• 家用娱乐本\n• 轻薄设计，仅960g\n• 2.5K分辨率\n• 续航持久\n• 性价比高',
    packaging_list = 'Pavilion Aero 13 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Pavilion' AND category = 'computer';

-- Spectre
UPDATE products SET 
    brand = 'HP',
    model = 'Spectre x360',
    color = '夜空黑/银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"14英寸2.8K OLED触摸屏","处理器":"Intel Core i7-1360P","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"66Wh","系统":"Windows 11 Home"}',
    features = '• 高端轻薄本\n• 360度翻转设计\n• 2.8K OLED触摸屏\n• 精致做工\n• 高端配置',
    packaging_list = 'Spectre x360 x1\n电源适配器 x1\n触控笔 x1\n资料 x1'
WHERE name = 'Spectre' AND category = 'computer';

-- MateBook 14s
UPDATE products SET 
    brand = '华为',
    model = 'MateBook 14s',
    color = '深空灰/银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"14.2英寸2.5K触摸屏","处理器":"Intel Core i7-13700H","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"60Wh","系统":"Windows 11 Home"}',
    features = '• 轻薄商务本\n• 2.5K触摸屏\n• 华为生态互联\n• 超级终端\n• 多屏协同',
    packaging_list = 'MateBook 14s x1\n电源适配器 x1\nUSB-C数据线 x1\n资料 x1'
WHERE name = 'MateBook 14s' AND category = 'computer';

-- MateBook D14
UPDATE products SET 
    brand = '华为',
    model = 'MateBook D14',
    color = '深空灰/银色',
    material = '铝金属机身',
    specifications = '{"屏幕":"14英寸FHD显示屏","处理器":"Intel Core i5-1340P","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"56Wh","系统":"Windows 11 Home"}',
    features = '• 性价比办公本\n• 轻薄便携\n• 华为生态互联\n• 多屏协同\n• 隐藏式摄像头',
    packaging_list = 'MateBook D14 x1\n电源适配器 x1\nUSB-C数据线 x1\n资料 x1'
WHERE name = 'MateBook D14' AND category = 'computer';

-- MateBook GT 14
UPDATE products SET 
    brand = '华为',
    model = 'MateBook GT 14',
    color = '深空灰',
    material = '铝金属机身',
    specifications = '{"屏幕":"14.2英寸2.8K OLED显示屏","处理器":"Intel Core Ultra 7 155H","存储":"32GB+1TB","显卡":"Intel Arc","电池":"70Wh","系统":"Windows 11 Home"}',
    features = '• 性能轻薄本\n• 2.8K OLED显示屏\n• Intel Core Ultra处理器\n• 华为生态互联\n• 高性能配置',
    packaging_list = 'MateBook GT 14 x1\n电源适配器 x1\nUSB-C数据线 x1\n资料 x1'
WHERE name = 'MateBook GT 14' AND category = 'computer';

-- MateBook X Pro
UPDATE products SET 
    brand = '华为',
    model = 'MateBook X Pro',
    color = '深空灰/银色',
    material = '镁合金机身',
    specifications = '{"屏幕":"14.2英寸3.1K OLED显示屏","处理器":"Intel Core i7-1360P","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"60Wh","系统":"Windows 11 Home"}',
    features = '• 旗舰轻薄本\n• 3.1K OLED显示屏\n• 仅980g超轻设计\n• 华为生态互联\n• 精致做工',
    packaging_list = 'MateBook X Pro x1\n电源适配器 x1\nUSB-C数据线 x1\n资料 x1'
WHERE name = 'MateBook X Pro' AND category = 'computer';

-- MateStation S
UPDATE products SET 
    brand = '华为',
    model = 'MateStation S',
    color = '深空灰',
    material = '金属机身',
    specifications = '{"处理器":"AMD Ryzen 7 5700G","存储":"16GB+512GB","显卡":"AMD Radeon Vega 8","接口":"USB-C，USB-A，HDMI，以太网","系统":"Windows 11 Home"}',
    features = '• 迷你主机\n• 小巧设计\n• 华为生态互联\n• 丰富接口\n• 性价比高',
    packaging_list = 'MateStation S x1\n电源适配器 x1\n键盘 x1\n鼠标 x1\n资料 x1'
WHERE name = 'MateStation S' AND category = 'computer';

-- Legion R9000P
UPDATE products SET 
    brand = 'Lenovo',
    model = 'Legion R9000P',
    color = '碳晶灰',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸2.5K 240Hz显示屏","处理器":"AMD Ryzen 9 7945HX","存储":"32GB+1TB","显卡":"NVIDIA RTX 4070","电池":"80Wh","系统":"Windows 11 Home"}',
    features = '• 电竞游戏本\n• 240Hz高刷新率\n• Legion散热系统\n• RGB背光键盘\n• 高性能配置',
    packaging_list = 'Legion R9000P x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Legion R9000P' AND category = 'computer';

-- ThinkBook 14
UPDATE products SET 
    brand = 'Lenovo',
    model = 'ThinkBook 14',
    color = '银灰色',
    material = '金属机身',
    specifications = '{"屏幕":"14英寸2.2K显示屏","处理器":"Intel Core i5-1340P","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"60Wh","系统":"Windows 11 Home"}',
    features = '• 商务办公本\n• 2.2K分辨率\n• 轻薄便携\n• 接口丰富\n• 性价比高',
    packaging_list = 'ThinkBook 14 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'ThinkBook 14' AND category = 'computer';

-- Legion Y7000P
UPDATE products SET 
    brand = 'Lenovo',
    model = 'Legion Y7000P',
    color = '碳晶灰',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸2.5K 165Hz显示屏","处理器":"Intel Core i7-13700HX","存储":"16GB+1TB","显卡":"NVIDIA RTX 4060","电池":"80Wh","系统":"Windows 11 Home"}',
    features = '• 主流游戏本\n• 165Hz高刷新率\n• Legion散热系统\n• RGB背光键盘\n• 性价比高',
    packaging_list = 'Legion Y7000P x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Legion Y7000P' AND category = 'computer';

-- Legion Y9000K
UPDATE products SET 
    brand = 'Lenovo',
    model = 'Legion Y9000K',
    color = '碳晶灰',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸2.5K 240Hz Mini-LED显示屏","处理器":"Intel Core i9-14900HX","存储":"32GB+2TB","显卡":"NVIDIA RTX 4090","电池":"99.9Wh","系统":"Windows 11 Home"}',
    features = '• 旗舰游戏本\n• Mini-LED显示屏\n• 240Hz高刷新率\n• Legion散热系统\n• 顶级配置',
    packaging_list = 'Legion Y9000K x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Legion Y9000K' AND category = 'computer';

-- Legion Y9000P
UPDATE products SET 
    brand = 'Lenovo',
    model = 'Legion Y9000P',
    color = '碳晶灰',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸2.5K 240Hz显示屏","处理器":"Intel Core i9-14900HX","存储":"32GB+1TB","显卡":"NVIDIA RTX 4080","电池":"80Wh","系统":"Windows 11 Home"}',
    features = '• 高端游戏本\n• 240Hz高刷新率\n• Legion散热系统\n• RGB背光键盘\n• 高性能配置',
    packaging_list = 'Legion Y9000P x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Legion Y9000P' AND category = 'computer';

-- Yoga Book 9i
UPDATE products SET 
    brand = 'Lenovo',
    model = 'Yoga Book 9i',
    color = '深空灰',
    material = '金属机身',
    specifications = '{"屏幕":"双13.3英寸2.8K OLED显示屏","处理器":"Intel Core i7-1355U","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"80Wh","系统":"Windows 11 Home"}',
    features = '• 双屏创意本\n• 双OLED显示屏\n• 创意生产力工具\n• 轻薄设计\n• 触控笔支持',
    packaging_list = 'Yoga Book 9i x1\n电源适配器 x1\n触控笔 x1\n蓝牙键盘 x1\n资料 x1'
WHERE name = 'Yoga Book 9i' AND category = 'computer';

-- 小新 16
UPDATE products SET 
    brand = 'Lenovo',
    model = '小新 16',
    color = '银色',
    material = '金属机身',
    specifications = '{"屏幕":"16英寸2.5K 120Hz显示屏","处理器":"AMD Ryzen 7 8845H","存储":"16GB+512GB","显卡":"AMD Radeon 780M","电池":"75Wh","系统":"Windows 11 Home"}',
    features = '• 大屏轻薄本\n• 2.5K分辨率\n• 120Hz高刷新率\n• 性价比高\n• 适合办公娱乐',
    packaging_list = '小新 16 x1\n电源适配器 x1\n资料 x1'
WHERE name = '小新 16' AND category = 'computer';

-- 小新 Air14
UPDATE products SET 
    brand = 'Lenovo',
    model = '小新 Air14',
    color = '银色',
    material = '金属机身',
    specifications = '{"屏幕":"14英寸2.8K OLED显示屏","处理器":"Intel Core i5-1340P","存储":"16GB+512GB","显卡":"Intel Iris Xe","电池":"57Wh","系统":"Windows 11 Home"}',
    features = '• 轻薄便携本\n• 2.8K OLED显示屏\n• 仅1.34kg\n• 续航持久\n• 性价比高',
    packaging_list = '小新 Air14 x1\n电源适配器 x1\n资料 x1'
WHERE name = '小新 Air14' AND category = 'computer';

-- 小新 Pro14
UPDATE products SET 
    brand = 'Lenovo',
    model = '小新 Pro14',
    color = '银色',
    material = '金属机身',
    specifications = '{"屏幕":"14英寸2.8K OLED 120Hz显示屏","处理器":"AMD Ryzen 7 8845H","存储":"32GB+1TB","显卡":"AMD Radeon 780M","电池":"84Wh","系统":"Windows 11 Home"}',
    features = '• 高性能轻薄本\n• 2.8K OLED 120Hz\n• 高性能处理器\n• 大容量存储\n• 性价比高',
    packaging_list = '小新 Pro14 x1\n电源适配器 x1\n资料 x1'
WHERE name = '小新 Pro14' AND category = 'computer';

-- Surface Go 3
UPDATE products SET 
    brand = 'Microsoft',
    model = 'Surface Go 3',
    color = '铂金银',
    material = '镁合金机身',
    specifications = '{"屏幕":"10.5英寸触控屏","处理器":"Intel Core i3-10100Y","存储":"8GB+128GB","显卡":"Intel UHD","电池":"24Wh","系统":"Windows 11 Home"}',
    features = '• 便携二合一\n• 仅544g\n• 触控屏\n• 支持Surface Pen\n• 适合移动办公',
    packaging_list = 'Surface Go 3 x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Surface Go 3' AND category = 'computer';

-- Surface Laptop 5/6
UPDATE products SET 
    brand = 'Microsoft',
    model = 'Surface Laptop 5/6',
    color = '铂金银/砂岩金',
    material = '铝金属机身',
    specifications = '{"屏幕":"13.5英寸触控屏","处理器":"Intel Core i7-1255U","存储":"16GB+256GB","显卡":"Intel Iris Xe","电池":"47Wh","系统":"Windows 11 Home"}',
    features = '• 轻薄笔记本\n• 触控屏\n• 精致做工\n• 续航持久\n• 微软生态',
    packaging_list = 'Surface Laptop x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Surface Laptop 5/6' AND category = 'computer';

-- Surface Laptop SE
UPDATE products SET 
    brand = 'Microsoft',
    model = 'Surface Laptop SE',
    color = '冰川白',
    material = '塑料机身',
    specifications = '{"屏幕":"11.6英寸显示屏","处理器":"Intel Celeron N4020","存储":"4GB+64GB","显卡":"Intel UHD","电池":"35Wh","系统":"Windows 11 SE"}',
    features = '• 教育笔记本\n• 经济实惠\n• 适合学生\n• 轻便易携\n• Windows 11 SE系统',
    packaging_list = 'Surface Laptop SE x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Surface Laptop SE' AND category = 'computer';

-- Surface Pro 9/10
UPDATE products SET 
    brand = 'Microsoft',
    model = 'Surface Pro 9/10',
    color = '铂金银/石墨黑/森林绿/宝石蓝',
    material = '镁合金机身',
    specifications = '{"屏幕":"13英寸触控屏","处理器":"Intel Core i7-1255U","存储":"16GB+256GB","显卡":"Intel Iris Xe","电池":"47Wh","系统":"Windows 11 Pro"}',
    features = '• 专业二合一\n• 高性能配置\n• 支持Surface Pen\n• 可拆卸键盘\n• 专业办公',
    packaging_list = 'Surface Pro x1\n电源适配器 x1\n资料 x1'
WHERE name = 'Surface Pro 9/10' AND category = 'computer';

-- ============================================================
-- 完成
-- ============================================================