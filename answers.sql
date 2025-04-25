-- Question 1
SELECT 
    OrderID,
    CustomerName,
    SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', numbers.n), ',', -1) AS Product
FROM 
    ProductDetail
JOIN 
    (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3) numbers
    ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= numbers.n - 1;
-- Question 2

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OriginalTable;

INSERT INTO OrderDetails (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OriginalTable;
