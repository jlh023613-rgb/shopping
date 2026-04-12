-- Recreate cart_items table with new structure

-- 1. Backup and drop existing table
DROP TABLE IF EXISTS cart_items;

-- 2. Create new table with options
CREATE TABLE cart_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL COMMENT 'user id',
    product_id BIGINT NOT NULL COMMENT 'product id',
    quantity INT NOT NULL DEFAULT 1 COMMENT 'quantity',
    selected_color VARCHAR(50) COMMENT 'selected color',
    selected_storage VARCHAR(50) COMMENT 'selected storage',
    insurance_type VARCHAR(50) DEFAULT 'none' COMMENT 'insurance type: none/basic/premium',
    insurance_price DECIMAL(10,2) DEFAULT 0.00 COMMENT 'insurance price',
    unit_price DECIMAL(10,2) COMMENT 'unit price with options',
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'added time',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_user_product_options (user_id, product_id, selected_color, selected_storage, insurance_type),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='cart items table';
