DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email         VARCHAR(255) UNIQUE,
    phone         VARCHAR(20) UNIQUE,
    city          VARCHAR(100)
);

CREATE TABLE transactions(
    transaction_id   INT PRIMARY KEY,
    customer_id      INT NOT NULL,
    transaction_date DATETIME,
    amount           DECIMAL(10,2) CHECK (amount >= 0),
    transaction_type VARCHAR(50),
    status           VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO customers (customer_id, customer_name, email, phone, city) VALUES
(1, 'Siva',  'siva@gmail.com',  '9876543210', 'Chennai'),
(2, 'Ravi',  'ravi@gmail.com',  '9876543211', 'Madurai'),
(3, 'Kumar', 'kumar@gmail.com', '9876543212', 'Coimbatore'),
(4, 'Priya', 'priya@gmail.com', '9876543213', 'Salem'),
(5, 'Deepa', 'deepa@gmail.com', '9876543214', 'Trichy');

INSERT INTO transactions (transaction_id, customer_id, transaction_date, amount, transaction_type, status) VALUES
(1,  1, '2026-01-01 10:00:00', 5000.00, 'Credit', 'Success'),
(2,  2, '2026-01-02 11:00:00', 3000.00, 'Debit',  'Success'),
(3,  3, '2026-01-03 12:00:00', NULL, 'Credit', 'Success'),
(4,  4, '2026-01-04 13:00:00', 2000.00, 'Debit',  'Failed'),
(5,  5, '2026-01-05 14:00:00', 8000.00, 'Credit', 'Success'),
(6,  1, '2026-02-01 10:00:00', 1500.00, 'Debit',  'Success'),
(7,  2, '2026-02-02 11:00:00', 4500.00, 'Credit', 'Pending'),
(8,  3, '2026-02-03 12:00:00', 6000.00, 'Debit',  'Success'),
(9,  4, '2026-02-04 13:00:00', NULL, 'Credit', 'Success'),
(10, 5, '2026-02-05 14:00:00', 3500.00, 'Debit',  'Failed'),
(11, 1, '2026-03-01 10:00:00', 2500.00, 'Credit', 'Success'),
(12, 2, '2026-03-02 11:00:00', 5500.00, 'Debit',  'Success'),
(13, 3, '2026-03-03 12:00:00', 1000.00, 'Credit', 'Pending'),
(14, 4, '2026-03-04 13:00:00', 7500.00, 'Debit',  'Success'),
(15, 5, '2026-03-05 14:00:00', 4000.00, 'Credit', 'Success');

SELECT
    transaction_id,
    transaction_date,
    transaction_type,
    COALESCE(amount, 0.00) AS amount
FROM transactions;


SELECT COUNT(*) AS Total_Transactions 
FROM transactions 
WHERE status NOT IN ('Failed', 'Pending');

SELECT SUM(amount) AS Total_Amount 
FROM transactions;

-- using group by and having ✅
SELECT transaction_type, SUM(amount) AS Total_Amount 
FROM transactions 
GROUP BY transaction_type
HAVING Total_Amount > 30000;

SELECT * FROM transactions
WHERE transaction_date BETWEEN '2026-01-01' AND '2026-02-01';  

-- using case function ✅
SELECT
    customer_id, 
    amount,
    CASE 
        WHEN amount >= 5000 THEN 'High'
        WHEN amount >= 2000 THEN 'Medium'
        ELSE 'Low'
    END AS spending 
FROM transactions;
