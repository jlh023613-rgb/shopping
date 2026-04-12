-- ============================================================
-- 家用电器商品初始化脚本
-- 图片路径：/image/appliances/类型/
-- ============================================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- ============================================================
-- 1. 清空家用电器相关数据
-- ============================================================
DELETE FROM product_images WHERE product_id IN (SELECT id FROM products WHERE category = 'appliance');
DELETE FROM products WHERE category = 'appliance';

-- ============================================================
-- 2. 添加家用电器相关店铺
-- ============================================================
INSERT IGNORE INTO shops (name, folder, description, sort_order) VALUES
('美的官方旗舰店', 'midea', '美的官方授权店铺，正品保障', 20),
('海尔官方旗舰店', 'haier', '海尔官方授权店铺，正品保障', 21),
('格力官方旗舰店', 'gree', '格力官方授权店铺，正品保障', 22),
('小米家电旗舰店', 'xiaomi', '小米家电官方授权店铺，正品保障', 23),
('海信官方旗舰店', 'hisense', '海信官方授权店铺，正品保障', 24),
('TCL官方旗舰店', 'tcl', 'TCL官方授权店铺，正品保障', 25);

-- ============================================================
-- 3. 家用电器商品数据 (category = 'appliance')
-- ============================================================

-- 空调商品
INSERT INTO products (name, category, brand, model, color, specifications, features, packaging_list, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('格力 云锦Ⅱ 1.5匹变频空调', 'appliance', '格力', 'KFR-35GW/NhAd1BAj', '白色', '{"制冷量":"3500W","制热量":"4600W","能效等级":"一级能效","噪音":"18-41dB","适用面积":"15-23㎡","电源":"220V/50Hz"}', '["新一级能效，省电节能","56℃净菌自洁，健康出风","7档风速，舒适随心","WiFi智能控制，远程操控","独立除湿，干爽舒适"]', '["空调主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","安装配件 x1套"]', 3299.00, 3699.00, 150, '/image/appliances/aircondition/10001.webp', '格力云锦Ⅱ系列，新一级能效变频空调，56℃净菌自洁，WiFi智能控制', 1, (SELECT id FROM shops WHERE folder = 'gree' LIMIT 1)),
('美的 风酷 1.5匹变频空调', 'appliance', '美的', 'KFR-35GW/N8XHC1', '白色', '{"制冷量":"3500W","制热量":"5000W","能效等级":"一级能效","噪音":"18-40dB","适用面积":"15-23㎡","电源":"220V/50Hz"}', '["新一级能效，节能省电","第四代自清洁，健康呼吸","一键防直吹，呵护家人","智能控温，舒适恒温","高频速冷热，快速舒适"]', '["空调主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","安装配件 x1套"]', 2999.00, 3399.00, 200, '/image/appliances/aircondition/10002.webp', '美的风酷系列，新一级能效，第四代自清洁，一键防直吹', 1, (SELECT id FROM shops WHERE folder = 'midea' LIMIT 1)),
('海尔 静悦 1.5匹变频空调', 'appliance', '海尔', 'KFR-35GW/81@U1-Hc', '白色', '{"制冷量":"3500W","制热量":"4600W","能效等级":"一级能效","噪音":"17-41dB","适用面积":"16-24㎡","电源":"220V/50Hz"}', '["新一级能效，节能环保","自清洁技术，空气更清新","智慧互联，远程操控","静音设计，安享睡眠","快速制冷热，舒适即达"]', '["空调主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","安装配件 x1套"]', 3199.00, 3599.00, 180, '/image/appliances/aircondition/10003.webp', '海尔静悦系列，新一级能效，自清洁技术，智慧互联', 1, (SELECT id FROM shops WHERE folder = 'haier' LIMIT 1)),
('小米 巨省电 1.5匹变频空调', 'appliance', '小米', 'KFR-35GW/N1A1', '白色', '{"制冷量":"3500W","制热量":"4600W","能效等级":"一级能效","噪音":"18-41dB","适用面积":"15-22㎡","电源":"220V/50Hz"}', '["新一级能效，巨省电","米家智能互联，语音控制","温湿双控，舒适体验","自清洁功能，健康出风","快速冷暖，舒适即享"]', '["空调主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","安装配件 x1套"]', 2499.00, 2799.00, 250, '/image/appliances/aircondition/10004.webp', '小米巨省电系列，新一级能效，米家智能互联，温湿双控', 1, (SELECT id FROM shops WHERE folder = 'xiaomi' LIMIT 1)),
('格力 云佳 2匹变频空调', 'appliance', '格力', 'KFR-50GW/NhIa3BAj', '白色', '{"制冷量":"5000W","制热量":"6800W","能效等级":"三级能效","噪音":"22-45dB","适用面积":"20-30㎡","电源":"220V/50Hz"}', '["变频节能，稳定运行","自清洁技术，健康出风","7档风速，舒适调节","独立除湿，干爽舒适","智能控温，恒温舒适"]', '["空调主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","安装配件 x1套"]', 4299.00, 4699.00, 100, '/image/appliances/aircondition/10005.webp', '格力云佳系列，2匹变频空调，自清洁技术，独立除湿', 1, (SELECT id FROM shops WHERE folder = 'gree' LIMIT 1));

-- 冰箱商品
INSERT INTO products (name, category, brand, model, color, specifications, features, packaging_list, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('海尔 470升变频对开门冰箱', 'appliance', '海尔', 'BCD-470WDPG', '星辉银', '{"总容积":"470L","冷藏室":"310L","冷冻室":"160L","能效等级":"一级能效","噪音":"36dB","尺寸":"833×655×1775mm"}', '["一级能效，节能省电","风冷无霜，免去除霜烦恼","智能变频，精准控温","干湿分储，食材保鲜","DEO净味，清新无异味"]', '["冰箱主机 x1","说明书 x1","保修卡 x1","搁架 x6","果菜盒 x2","蛋架 x1"]', 3599.00, 3999.00, 120, '/image/appliances/fridge/10001.webp', '海尔470升对开门冰箱，一级能效，风冷无霜，干湿分储', 1, (SELECT id FROM shops WHERE folder = 'haier' LIMIT 1)),
('美的 520升变频对开门冰箱', 'appliance', '美的', 'BCD-520WKM', '莫兰迪灰', '{"总容积":"520L","冷藏室":"340L","冷冻室":"180L","能效等级":"一级能效","噪音":"36dB","尺寸":"908×680×1775mm"}', '["一级能效，节能环保","风冷无霜，保鲜更持久","智能变频，精准控温","铂金净味，清新健康","大容量设计，满足全家需求"]', '["冰箱主机 x1","说明书 x1","保修卡 x1","搁架 x8","果菜盒 x2","蛋架 x2"]', 3999.00, 4499.00, 100, '/image/appliances/fridge/10002.webp', '美的520升对开门冰箱，一级能效，铂金净味，大容量设计', 1, (SELECT id FROM shops WHERE folder = 'midea' LIMIT 1)),
('小米 486升变频对开门冰箱', 'appliance', '小米', 'BCD-486WMBI', '银色', '{"总容积":"486L","冷藏室":"316L","冷冻室":"170L","能效等级":"一级能效","噪音":"36dB","尺寸":"833×660×1780mm"}', '["一级能效，节能省电","风冷无霜，免去除霜","米家智能互联，远程操控","银离子抑菌，健康保鲜","多温区设计，分类存储"]', '["冰箱主机 x1","说明书 x1","保修卡 x1","搁架 x6","果菜盒 x2","蛋架 x1"]', 2999.00, 3399.00, 150, '/image/appliances/fridge/10003.webp', '小米486升对开门冰箱，一级能效，米家智能互联，银离子抑菌', 1, (SELECT id FROM shops WHERE folder = 'xiaomi' LIMIT 1)),
('海尔 328升变频多门冰箱', 'appliance', '海尔', 'BCD-328WDPM', '流沙金', '{"总容积":"328L","冷藏室":"181L","冷冻室":"119L","变温室":"28L","能效等级":"一级能效","噪音":"35dB","尺寸":"682×640×1804mm"}', '["一级能效，节能环保","风冷无霜，免去除霜","三温区设计，灵活存储","智能变频，精准控温","DEO净味，清新无异味"]', '["冰箱主机 x1","说明书 x1","保修卡 x1","搁架 x4","果菜盒 x1","蛋架 x1"]', 2999.00, 3299.00, 130, '/image/appliances/fridge/10004.webp', '海尔328升多门冰箱，一级能效，三温区设计，智能变频', 1, (SELECT id FROM shops WHERE folder = 'haier' LIMIT 1));

-- 洗衣机商品
INSERT INTO products (name, category, brand, model, color, specifications, features, packaging_list, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('海尔 10公斤滚筒洗衣机', 'appliance', '海尔', 'EG100MATE28S', '钛灰银', '{"洗涤容量":"10kg","脱水容量":"10kg","能效等级":"一级能效","电机类型":"直驱变频电机","尺寸":"595×530×850mm"}', '["直驱变频电机，静音平稳","一级能效，节能省电","智能投放，精准用量","蒸汽除菌，健康洗护","16种洗涤程序，满足多样需求"]', '["洗衣机主机 x1","说明书 x1","保修卡 x1","进水管 x1","排水管 x1","运输螺栓 x4"]', 2499.00, 2799.00, 200, '/image/appliances/washingMachine/10001.webp', '海尔10公斤滚筒洗衣机，直驱变频电机，蒸汽除菌，智能投放', 1, (SELECT id FROM shops WHERE folder = 'haier' LIMIT 1)),
('美的 10公斤滚筒洗衣机', 'appliance', '美的', 'MG100V33DS5', '深空灰', '{"洗涤容量":"10kg","脱水容量":"10kg","能效等级":"一级能效","电机类型":"DD直驱电机","尺寸":"595×530×850mm"}', '["DD直驱电机，安静耐用","一级能效，节能环保","巴氏除菌，健康洗护","智能投放，省心省力","多种洗涤程序，专业洗护"]', '["洗衣机主机 x1","说明书 x1","保修卡 x1","进水管 x1","排水管 x1","运输螺栓 x4"]', 2299.00, 2599.00, 180, '/image/appliances/washingMachine/10002.webp', '美的10公斤滚筒洗衣机，DD直驱电机，巴氏除菌，智能投放', 1, (SELECT id FROM shops WHERE folder = 'midea' LIMIT 1)),
('小米 10公斤滚筒洗衣机', 'appliance', '小米', 'XQG100MJ202', '白色', '{"洗涤容量":"10kg","脱水容量":"10kg","能效等级":"一级能效","电机类型":"直驱变频电机","尺寸":"595×530×850mm"}', '["直驱变频电机，静音平稳","一级能效，节能省电","米家智能互联，远程操控","高温除菌，健康洗护","多种洗涤模式，满足需求"]', '["洗衣机主机 x1","说明书 x1","保修卡 x1","进水管 x1","排水管 x1","运输螺栓 x4"]', 1999.00, 2299.00, 250, '/image/appliances/washingMachine/10003.webp', '小米10公斤滚筒洗衣机，直驱变频电机，米家智能互联，高温除菌', 1, (SELECT id FROM shops WHERE folder = 'xiaomi' LIMIT 1)),
('海尔 10公斤洗烘一体机', 'appliance', '海尔', 'EG100HPRO6S', '极光紫', '{"洗涤容量":"10kg","烘干容量":"7kg","能效等级":"一级能效","电机类型":"直驱变频电机","尺寸":"595×530×850mm"}', '["洗烘一体，一机两用","直驱变频电机，静音平稳","微蒸汽空气洗，护理衣物","智能投放，精准用量","一级能效，节能省电"]', '["洗衣机主机 x1","说明书 x1","保修卡 x1","进水管 x1","排水管 x1","运输螺栓 x4"]', 3499.00, 3999.00, 150, '/image/appliances/washingMachine/10004.webp', '海尔10公斤洗烘一体机，微蒸汽空气洗，智能投放，一级能效', 1, (SELECT id FROM shops WHERE folder = 'haier' LIMIT 1));

-- 电视商品
INSERT INTO products (name, category, brand, model, color, specifications, features, packaging_list, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('小米 75英寸4K智能电视', 'appliance', '小米', 'L75MA-AC', '黑色', '{"屏幕尺寸":"75英寸","分辨率":"4K(3840×2160)","刷新率":"60Hz","HDR":"支持HDR10","系统":"MIUI TV","尺寸":"1673×966×86mm"}', '["75英寸巨幕，沉浸体验","4K超高清，画质细腻","远场语音，智能操控","金属机身，品质设计","PatchWall系统，内容丰富"]', '["电视主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","底座 x2"]', 3999.00, 4499.00, 100, '/image/appliances/tv/10001.webp', '小米75英寸4K智能电视，远场语音，金属机身，PatchWall系统', 1, (SELECT id FROM shops WHERE folder = 'xiaomi' LIMIT 1)),
('海信 65英寸4K智能电视', 'appliance', '海信', '65E3H', '黑色', '{"屏幕尺寸":"65英寸","分辨率":"4K(3840×2160)","刷新率":"60Hz","HDR":"支持HDR","系统":"VIDAA","尺寸":"1450×838×80mm"}', '["65英寸大屏，震撼视觉","4K超高清，画质出色","AI声控，智能便捷","MEMC运动补偿，流畅画面","杜比解码，沉浸音效"]', '["电视主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","底座 x2"]', 2999.00, 3299.00, 150, '/image/appliances/tv/10002.webp', '海信65英寸4K智能电视，AI声控，MEMC运动补偿，杜比解码', 1, (SELECT id FROM shops WHERE folder = 'hisense' LIMIT 1)),
('TCL 75英寸4K智能电视', 'appliance', 'TCL', '75V8G', '黑色', '{"屏幕尺寸":"75英寸","分辨率":"4K(3840×2160)","刷新率":"120Hz","HDR":"支持HDR10+","系统":"Android","尺寸":"1672×963×82mm"}', '["75英寸巨幕，影院体验","120Hz高刷，流畅画面","Q画质引擎，色彩出众","杜比全景声，沉浸音效","远场语音，智能操控"]', '["电视主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","底座 x2"]', 4499.00, 4999.00, 80, '/image/appliances/tv/10003.webp', 'TCL 75英寸4K智能电视，120Hz高刷，Q画质引擎，杜比全景声', 1, (SELECT id FROM shops WHERE folder = 'tcl' LIMIT 1)),
('小米 55英寸4K智能电视', 'appliance', '小米', 'L55MA-AC', '黑色', '{"屏幕尺寸":"55英寸","分辨率":"4K(3840×2160)","刷新率":"60Hz","HDR":"支持HDR10","系统":"MIUI TV","尺寸":"1230×718×78mm"}', '["55英寸大屏，客厅首选","4K超高清，画质细腻","远场语音，智能操控","金属机身，品质设计","PatchWall系统，内容丰富"]', '["电视主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","底座 x2"]', 2299.00, 2599.00, 200, '/image/appliances/tv/10004.webp', '小米55英寸4K智能电视，远场语音，金属机身，PatchWall系统', 1, (SELECT id FROM shops WHERE folder = 'xiaomi' LIMIT 1)),
('海信 75英寸4K智能电视', 'appliance', '海信', '75E3H', '黑色', '{"屏幕尺寸":"75英寸","分辨率":"4K(3840×2160)","刷新率":"120Hz","HDR":"支持HDR","系统":"VIDAA","尺寸":"1675×964×82mm"}', '["75英寸巨幕，震撼视觉","120Hz高刷，流畅画面","AI声控，智能便捷","U+超画质引擎，色彩出众","杜比解码，沉浸音效"]', '["电视主机 x1","遥控器 x1","电池 x2","说明书 x1","保修卡 x1","底座 x2"]', 4299.00, 4799.00, 100, '/image/appliances/tv/10005.webp', '海信75英寸4K智能电视，120Hz高刷，AI声控，U+超画质引擎', 1, (SELECT id FROM shops WHERE folder = 'hisense' LIMIT 1));

-- 洗地机商品
INSERT INTO products (name, category, brand, model, color, specifications, features, packaging_list, price, original_price, stock, image_url, description, status, merchant_id) VALUES
('美的 智能洗地机', 'appliance', '美的', 'GX5Pro', '白色', '{"电池容量":"4000mAh","续航时间":"35分钟","清水箱容量":"700ml","污水箱容量":"600ml","噪音":"78dB"}', '["智能感应，自动调节","活水清洁，干净卫生","热风烘干，防止异味","一键自清洁，解放双手","LED显示屏，状态可视"]', '["洗地机主机 x1","充电底座 x1","清洁刷 x1","说明书 x1","保修卡 x1","清洁液 x1"]', 2499.00, 2799.00, 150, '/image/appliances/floorWasher/10001.png', '美的智能洗地机，活水清洁，热风烘干，一键自清洁', 1, (SELECT id FROM shops WHERE folder = 'midea' LIMIT 1)),
('海尔 智能洗地机', 'appliance', '海尔', 'ZQ10', '灰色', '{"电池容量":"4000mAh","续航时间":"40分钟","清水箱容量":"750ml","污水箱容量":"650ml","噪音":"76dB"}', '["智能感应，自动调节","双滚刷设计，清洁高效","热风烘干，防止异味","一键自清洁，解放双手","语音提示，操作便捷"]', '["洗地机主机 x1","充电底座 x1","清洁刷 x2","说明书 x1","保修卡 x1","清洁液 x1"]', 2699.00, 2999.00, 120, '/image/appliances/floorWasher/10002.png', '海尔智能洗地机，双滚刷设计，热风烘干，语音提示', 1, (SELECT id FROM shops WHERE folder = 'haier' LIMIT 1)),
('小米 无线洗地机', 'appliance', '小米', 'MJWXCQJ01DY', '白色', '{"电池容量":"4000mAh","续航时间":"35分钟","清水箱容量":"700ml","污水箱容量":"600ml","噪音":"78dB"}', '["米家智能互联，远程操控","活水清洁，干净卫生","热风烘干，防止异味","一键自清洁，解放双手","LED显示屏，状态可视"]', '["洗地机主机 x1","充电底座 x1","清洁刷 x1","说明书 x1","保修卡 x1","清洁液 x1"]', 2299.00, 2599.00, 180, '/image/appliances/floorWasher/10003.png', '小米无线洗地机，米家智能互联，活水清洁，热风烘干', 1, (SELECT id FROM shops WHERE folder = 'xiaomi' LIMIT 1));

-- ============================================================
-- 4. 家用电器商品多图数据
-- ============================================================

-- 格力 云锦Ⅱ 空调
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '格力 云锦Ⅱ 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10001.webp', 1),
((SELECT id FROM products WHERE name = '格力 云锦Ⅱ 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10006.webp', 2),
((SELECT id FROM products WHERE name = '格力 云锦Ⅱ 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10007.webp', 3);

-- 美的 风酷 空调
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '美的 风酷 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10002.webp', 1),
((SELECT id FROM products WHERE name = '美的 风酷 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10008.webp', 2),
((SELECT id FROM products WHERE name = '美的 风酷 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10009.webp', 3);

-- 海尔 静悦 空调
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '海尔 静悦 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10003.webp', 1),
((SELECT id FROM products WHERE name = '海尔 静悦 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10010.webp', 2),
((SELECT id FROM products WHERE name = '海尔 静悦 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10011.webp', 3);

-- 小米 巨省电 空调
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小米 巨省电 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10004.webp', 1),
((SELECT id FROM products WHERE name = '小米 巨省电 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10012.png', 2),
((SELECT id FROM products WHERE name = '小米 巨省电 1.5匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10013.png', 3);

-- 格力 云佳 空调
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '格力 云佳 2匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10005.webp', 1),
((SELECT id FROM products WHERE name = '格力 云佳 2匹变频空调' AND category = 'appliance' LIMIT 1), '/image/appliances/aircondition/10014.png', 2);

-- 海尔 470升冰箱
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '海尔 470升变频对开门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10001.webp', 1),
((SELECT id FROM products WHERE name = '海尔 470升变频对开门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10005.webp', 2),
((SELECT id FROM products WHERE name = '海尔 470升变频对开门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10006.webp', 3);

-- 美的 520升冰箱
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '美的 520升变频对开门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10002.webp', 1),
((SELECT id FROM products WHERE name = '美的 520升变频对开门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10007.png', 2),
((SELECT id FROM products WHERE name = '美的 520升变频对开门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10008.png', 3);

-- 小米 486升冰箱
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小米 486升变频对开门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10003.webp', 1),
((SELECT id FROM products WHERE name = '小米 486升变频对开门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10009.webp', 2);

-- 海尔 328升冰箱
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '海尔 328升变频多门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10004.webp', 1),
((SELECT id FROM products WHERE name = '海尔 328升变频多门冰箱' AND category = 'appliance' LIMIT 1), '/image/appliances/fridge/10005.webp', 2);

-- 海尔 10公斤洗衣机
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '海尔 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10001.webp', 1),
((SELECT id FROM products WHERE name = '海尔 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10005.webp', 2),
((SELECT id FROM products WHERE name = '海尔 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10006.webp', 3);

-- 美的 10公斤洗衣机
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '美的 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10002.webp', 1),
((SELECT id FROM products WHERE name = '美的 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10007.png', 2),
((SELECT id FROM products WHERE name = '美的 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10008.png', 3);

-- 小米 10公斤洗衣机
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小米 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10003.webp', 1),
((SELECT id FROM products WHERE name = '小米 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10009.png', 2),
((SELECT id FROM products WHERE name = '小米 10公斤滚筒洗衣机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10010.png', 3);

-- 海尔 10公斤洗烘一体机
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '海尔 10公斤洗烘一体机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10004.webp', 1),
((SELECT id FROM products WHERE name = '海尔 10公斤洗烘一体机' AND category = 'appliance' LIMIT 1), '/image/appliances/washingMachine/10005.webp', 2);

-- 小米 75英寸电视
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小米 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10001.webp', 1),
((SELECT id FROM products WHERE name = '小米 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10006.webp', 2),
((SELECT id FROM products WHERE name = '小米 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10007.webp', 3);

-- 海信 65英寸电视
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '海信 65英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10002.webp', 1),
((SELECT id FROM products WHERE name = '海信 65英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10008.webp', 2),
((SELECT id FROM products WHERE name = '海信 65英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10009.webp', 3);

-- TCL 75英寸电视
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = 'TCL 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10003.webp', 1),
((SELECT id FROM products WHERE name = 'TCL 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10010.webp', 2),
((SELECT id FROM products WHERE name = 'TCL 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10011.webp', 3);

-- 小米 55英寸电视
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小米 55英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10004.webp', 1),
((SELECT id FROM products WHERE name = '小米 55英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10012.webp', 2),
((SELECT id FROM products WHERE name = '小米 55英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10013.webp', 3);

-- 海信 75英寸电视
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '海信 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10005.webp', 1),
((SELECT id FROM products WHERE name = '海信 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10014.webp', 2),
((SELECT id FROM products WHERE name = '海信 75英寸4K智能电视' AND category = 'appliance' LIMIT 1), '/image/appliances/tv/10015.webp', 3);

-- 美的 智能洗地机
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '美的 智能洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10001.png', 1),
((SELECT id FROM products WHERE name = '美的 智能洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10004.png', 2),
((SELECT id FROM products WHERE name = '美的 智能洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10005.png', 3);

-- 海尔 智能洗地机
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '海尔 智能洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10002.png', 1),
((SELECT id FROM products WHERE name = '海尔 智能洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10006.png', 2),
((SELECT id FROM products WHERE name = '海尔 智能洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10007.png', 3);

-- 小米 无线洗地机
INSERT INTO product_images (product_id, image_url, sort_order) VALUES
((SELECT id FROM products WHERE name = '小米 无线洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10003.png', 1),
((SELECT id FROM products WHERE name = '小米 无线洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10008.png', 2),
((SELECT id FROM products WHERE name = '小米 无线洗地机' AND category = 'appliance' LIMIT 1), '/image/appliances/floorWasher/10009.png', 3);
