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
