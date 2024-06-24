CREATE DATABASE demo1;
USE demo1;

CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100),
    productPrice DECIMAL(10, 2),
    productAmount INT,
    productDescription TEXT,
    productStatus VARCHAR(20)
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P001', 'Product 1', 10.00, 100, 'Description for Product 1', 'Available'),
    ('P002', 'Product 2', 20.00, 200, 'Description for Product 2', 'Out of Stock'),
    ('P003', 'Product 3', 30.00, 300, 'Description for Product 3', 'Available'),
    ('P004', 'Product 4', 40.00, 400, 'Description for Product 4', 'Available'),
    ('P005', 'Product 5', 50.00, 500, 'Description for Product 5', 'Discontinued');

-- Tạo Unique Index trên cột productCode
CREATE UNIQUE INDEX idx_productCode ON Products (productCode);

-- Tạo Composite Index trên cột productName và productPrice
CREATE INDEX idx_productName_productPrice ON Products (productName, productPrice);

-- Sử dụng câu lệnh EXPLAIN để kiểm tra truy vấn
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';
EXPLAIN SELECT * FROM Products WHERE productName = 'Product 1' AND productPrice = 10.00;

-- Tạo view
CREATE VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Sửa đổi view 
DROP VIEW IF EXISTS ProductView;
CREATE VIEW ProductView AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

-- Xoá view
DROP VIEW IF EXISTS ProductView;

--
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;

--
DELIMITER //

CREATE PROCEDURE AddProduct(
    IN p_productCode VARCHAR(50),
    IN p_productName VARCHAR(100),
    IN p_productPrice DECIMAL(10, 2),
    IN p_productAmount INT,
    IN p_productDescription TEXT,
    IN p_productStatus VARCHAR(20)
)
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
END //

DELIMITER ;


