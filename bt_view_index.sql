CREATE DATABASE demo1;
USE demo1;
drop database demo1;
CREATE TABLE products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(50) NOT NULL,
    product_name VARCHAR(100),
    product_price DECIMAL(10, 2),
    product_amount INT,
    product_description TEXT,
    product_status VARCHAR(20)
);

INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES
    ('P001', 'Product 1', 10.00, 100, 'Description for Product 1', 'Available'),
    ('P002', 'Product 2', 20.00, 200, 'Description for Product 2', 'Out of Stock'),
    ('P003', 'Product 3', 30.00, 300, 'Description for Product 3', 'Available'),
    ('P004', 'Product 4', 40.00, 400, 'Description for Product 4', 'Available'),
    ('P005', 'Product 5', 50.00, 500, 'Description for Product 5', 'Discontinued');

-- Tạo Unique Index trên cột productCode
CREATE UNIQUE INDEX idx_productCode ON products (product_code);

-- Tạo Composite Index trên cột productName và productPrice
CREATE INDEX idx_productName_productPrice ON products (product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để kiểm tra truy vấn
EXPLAIN SELECT * FROM products WHERE product_code = 'P001';
EXPLAIN SELECT * FROM products WHERE product_name = 'Product 1' AND product_price = 10.00;

-- Tạo view
CREATE VIEW product_view AS
SELECT product_code, product_name, product_price, product_status
FROM products;

-- Sửa đổi view 
DROP VIEW IF EXISTS product_view;
CREATE VIEW product_view AS
SELECT product_code, product_name, product_price, product_status, product_amount
FROM products;

-- Xoá view
DROP VIEW IF EXISTS product_view;

--
DELIMITER //

CREATE PROCEDURE get_all_products()
BEGIN
    SELECT * FROM products;
END //

DELIMITER ;

--
DELIMITER //

CREATE PROCEDURE add_product(
    IN product_code VARCHAR(50),
    IN product_came VARCHAR(100),
    IN product_price DECIMAL(10, 2),
    IN product_amount INT,
    IN product_description TEXT, 	
    IN product_status VARCHAR(20)
)
BEGIN
    INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (product_code, product_name, product_price, product_amount, product_description, product_status);
END //

DELIMITER ;

-- Sửa
DELIMITER //

CREATE PROCEDURE update_product(
    IN Id INT,
    IN product_code VARCHAR(50),
    IN product_name VARCHAR(100),
    IN product_price DECIMAL(10, 2),
    IN product_amount INT,
    IN product_description TEXT,
    IN product_status VARCHAR(50)
)
BEGIN
    UPDATE products
    SET product_code = product_code,
        product_name = product_name,
        product_price = product_price,
        product_amount = product_amount,
        product_description = product_description,
        product_status = product_status
    WHERE Id = Id;
END //

DELIMITER ;

-- Xóa
DELIMITER //

CREATE PROCEDURE delete_product(IN Id INT)
BEGIN
    DELETE FROM products WHERE Id = Id;
END //

DELIMITER ;



