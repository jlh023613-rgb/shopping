-- 2. 用户表 (Users)
-- 核心属性：手机号、密码、用户名、角色
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户主键ID',
    username VARCHAR(50) NOT NULL COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '加密后的密码',
    phone VARCHAR(20) NOT NULL UNIQUE COMMENT '手机号(唯一)',
    gender CHAR(1) DEFAULT 'M' COMMENT '性别 M/F/U',
    role VARCHAR(20) DEFAULT 'ROLE_USER' COMMENT '角色：ROLE_USER / ROLE_ADMIN',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB COMMENT='用户表';

-- 3. 收货地址表 (Addresses)
-- 关系：多对一 (一个用户可以有多个地址)
CREATE TABLE addresses (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT '关联用户ID',
    receiver_name VARCHAR(30) NOT NULL COMMENT '收货人姓名',
    receiver_phone VARCHAR(20) NOT NULL COMMENT '收货人电话',
    province VARCHAR(30) NOT NULL COMMENT '省份',
    city VARCHAR(30) NOT NULL COMMENT '城市',
    district VARCHAR(30) NOT NULL COMMENT '区/县',
    detail_address VARCHAR(200) NOT NULL COMMENT '详细地址',
    is_default TINYINT(1) DEFAULT 0 COMMENT '是否默认地址: 0-否, 1-是',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_id (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB COMMENT='收货地址表';

-- 4. 商品表 (Products)
-- 核心属性：价格、库存、图片、描述
CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '商品主键',
    name VARCHAR(200) NOT NULL COMMENT '商品名称',
    category VARCHAR(50) COMMENT '商品分类',
    price DECIMAL(10, 2) NOT NULL COMMENT '当前售价',
    original_price DECIMAL(10, 2) COMMENT '原价/市场价',
    stock INT NOT NULL DEFAULT 0 COMMENT '库存数量',
    image_url VARCHAR(512) COMMENT '商品主图URL',
    description TEXT COMMENT '商品详情描述',
    status TINYINT DEFAULT 1 COMMENT '状态：1-上架, 0-下架',
    merchant_id BIGINT DEFAULT 0 COMMENT '商家ID (0代表自营)',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB COMMENT='商品表';

-- 5. 购物车表 (Cart Items)
-- 关系：多对多 (用户与商品的中间表)
CREATE TABLE cart_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT '用户ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    quantity INT NOT NULL DEFAULT 1 COMMENT '购买数量',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    -- 联合唯一索引：确保同一个用户对同一个商品只有一条记录，重复加购只增加数量
    UNIQUE KEY uk_user_product (user_id, product_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB COMMENT='购物车表';

-- 6. 订单主表 (Orders)
-- 核心属性：总金额、状态、收货信息
CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '订单ID',
    order_no VARCHAR(64) NOT NULL UNIQUE COMMENT '订单编号(业务唯一标识)',
    user_id BIGINT NOT NULL COMMENT '下单用户ID',
    total_amount DECIMAL(10, 2) NOT NULL COMMENT '订单总金额',
    status TINYINT DEFAULT 0 COMMENT '状态: 0-待付款, 1-待发货, 2-已发货, 3-已完成, 4-已取消',

    -- 收货信息快照 (即便用户删除了地址表中的地址，订单里的地址不能变)
    receiver_name VARCHAR(30) NOT NULL,
    receiver_phone VARCHAR(20) NOT NULL,
    receiver_address VARCHAR(255) NOT NULL,

    pay_time DATETIME COMMENT '支付时间',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_user_id (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB COMMENT='订单主表';

-- 7. 订单详情表 (Order Items)
-- 关系：订单与商品的中间表 (记录具体买的什么)
CREATE TABLE order_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL COMMENT '关联订单ID',
    product_id BIGINT NOT NULL COMMENT '关联商品ID',

    -- 数据快照 (防止商品改名或改价后，历史订单显示错误)
    product_name VARCHAR(200) NOT NULL COMMENT '下单时的商品名称',
    product_image VARCHAR(512) COMMENT '下单时的商品图片',
    current_unit_price DECIMAL(10, 2) NOT NULL COMMENT '下单时的单价',

    quantity INT NOT NULL COMMENT '购买数量',
    total_price DECIMAL(10, 2) NOT NULL COMMENT '本项小计 (单价*数量)',

    INDEX idx_order_id (order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
) ENGINE=InnoDB COMMENT='订单商品详情表';