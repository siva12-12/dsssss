DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    sales_amount DECIMAL(10,2),
    sales_date DATE
);

INSERT INTO products (product_id, product_name, sales_amount, sales_date) VALUES
(1, 'Laptop', 55000.00, '2026-01-05'),
(2, 'Mouse', 800.00, '2026-01-08'),
(3, 'Keyboard', 1500.00, '2026-01-10'),
(4, 'Monitor', 12000.00, '2026-01-15'),
(5, 'Headphones', 2500.00, '2026-01-18'),
(6, 'Laptop', 60000.00, '2026-02-02'),
(7, 'Mouse', 900.00, '2026-02-05'),
(8, 'Keyboard', 1700.00, '2026-02-08'),
(9, 'Monitor', 13000.00, '2026-02-12'),
(10, 'Headphones', 3000.00, '2026-02-15'),
(11, 'Laptop', 58000.00, '2026-03-01'),
(12, 'Mouse', 850.00, '2026-03-03'),
(13, 'Keyboard', 1600.00, '2026-03-05'),
(14, 'Monitor', 12500.00, '2026-03-08'),
(15, 'Headphones', 2800.00, '2026-03-10');

SELECT product_id,product_name,sales_date,sales_amount,
LAG(sales_amount)
OVER (PARTITION BY product_name ORDER BY sales_date) AS previous_sales_amount,

lead(sales_amount)
OVER (PARTITION BY product_name ORDER BY sales_date) AS next_sales_amount,

sales_amount - LAG(sales_amount)
OVER (PARTITION BY product_name ORDER BY sales_date) AS diff
from products;

select count(*) as total_rows from products;

select * from products;
drop table if exists products_copy;
create table products_copy as select * from products;

explain format = json
select * from products_copy;

select * from products
union 
select * from products_copy;