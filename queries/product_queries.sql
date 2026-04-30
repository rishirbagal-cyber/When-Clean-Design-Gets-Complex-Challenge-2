-- PRODUCT QUERIES
-- These queries simulate common product requests in an application

-- Some of these queries will break after normalization.
-- Your job is to update them so they work with your improved schema.

-- Query 1
-- Get all products

SELECT 
    p.product_id,
    p.product_name,
    p.price,
    s.supplier_name,
    i.stock_quantity
FROM products p
LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id
LEFT JOIN inventory i ON p.product_id = i.product_id;



-- Query 2
-- Find products under a specific category
-- NOTE: This will break after normalization

SELECT p.*
FROM products p
JOIN product_categories pc ON p.product_id = pc.product_id
JOIN categories c ON pc.category_id = c.category_id
WHERE c.category_name LIKE '%Electronics%';



-- Query 3
-- Find supplier details for a product
-- NOTE: supplier data currently lives inside products table

SELECT p.product_name, s.supplier_name, s.supplier_phone
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id;



-- Query 4
-- Find products with low stock

SELECT p.product_name, i.stock_quantity
FROM products p
JOIN inventory i ON p.product_id = i.product_id
WHERE i.stock_quantity < 10;



-- TODO FOR LEARNERS
-- After normalizing the schema:
-- 1. Rewrite these queries using JOINs
-- 2. Ensure the same information can still be retrieved