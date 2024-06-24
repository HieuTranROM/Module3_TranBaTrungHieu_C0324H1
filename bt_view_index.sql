CREATE DATABASE demo1;
USE demo1;
drop database demo1;
CREATE TABLE products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100),
    productPrice DECIMAL(10, 2),
    productAmount INT,
    productDescription TEXT,
    productStatus VARCHAR(20)
);

INSERT INTO products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P001', 'Product 1', 10.00, 100, 'Description for Product 1', 'Available'),
    ('P002', 'Product 2', 20.00, 200, 'Description for Product 2', 'Out of Stock'),
    ('P003', 'Product 3', 30.00, 300, 'Description for Product 3', 'Available'),
    ('P004', 'Product 4', 40.00, 400, 'Description for Product 4', 'Available'),
    ('P005', 'Product 5', 50.00, 500, 'Description for Product 5', 'Discontinued');

-- Tạo Unique Index trên cột productCode
CREATE UNIQUE INDEX idx_productCode ON products (productCode);

-- Tạo Composite Index trên cột productName và productPrice
CREATE INDEX idx_productName_productPrice ON products (productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để kiểm tra truy vấn
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';
EXPLAIN SELECT * FROM Products WHERE productName = 'Product 1' AND productPrice = 10.00;

-- Tạo view
CREATE VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus
FROM products;

-- Sửa đổi view 
DROP VIEW IF EXISTS ProductView;
CREATE VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM products;

-- Xoá view
DROP VIEW IF EXISTS ProductView;

--
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM products;
END //

DELIMITER ;

--
DELIMITER //

CREATE PROCEDURE addProduct(
    IN productCode VARCHAR(50),
    IN productName VARCHAR(100),
    IN productPrice DECIMAL(10, 2),
    IN productAmount INT,
    IN productDescription TEXT, 	
    IN productStatus VARCHAR(20)
)
BEGIN
    INSERT INTO products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //

DELIMITER ;

-- Sửa
DELIMITER //

CREATE PROCEDURE updateProduct(
    IN Id INT,
    IN productCode VARCHAR(50),
    IN productName VARCHAR(100),
    IN productPrice DECIMAL(10, 2),
    IN productAmount INT,
    IN productDescription TEXT,
    IN productStatus VARCHAR(50)
)
BEGIN
    UPDATE products
    SET productCode = productCode,
        productName = productName,
        productPrice = productPrice,
        productAmount = productAmount,
        productDescription = productDescription,
        productStatus = productStatus
    WHERE Id = Id;
END //

DELIMITER ;

-- Xóa
DELIMITER //

CREATE PROCEDURE DeleteProduct(IN Id INT)
BEGIN
    DELETE FROM products WHERE Id = Id;
END //

DELIMITER ;



