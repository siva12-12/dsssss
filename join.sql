DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS restaurants;

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name          VARCHAR(255) NOT NULL,
    city          VARCHAR(100)
);

INSERT INTO restaurants (restaurant_id, name, city) VALUES
(1, 'Pizza Palace', 'New York'),
(2, 'Sushi World', 'Los Angeles'),
(3, 'Burger Barn', 'Chicago'),
(4, 'Taco Town', 'Houston'),
(5, 'Pasta Place', 'Phoenix');

CREATE TABLE orders (
    order_id      INT PRIMARY KEY,
    restaurant_id INT,
    order_date    DATETIME,
    amount        DECIMAL(10,2) CHECK (amount >= 0),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO orders (order_id, restaurant_id, order_date, amount) VALUES
(1, 1, '2024-01-01 12:00:00', 25.50),
(2, 2, '2024-01-02 13:30:00', 40.00),
(3, 3, '2024-01-03 14:45:00', 15.75),
(4, 1, '2024-01-04 18:20:00', 30.00),
(5, 4, '2024-01-05 19:10:00', 22.50);

SELECT * FROM restaurants;
SELECT * FROM orders;

select r.name, o.order_date
from restaurants r
INNER JOIN orders o
ON  r.restaurant_id = o.restaurant_id;

SELECT r.name, o.order_date
FROM restaurants r
LEFT JOIN orders o
ON r.restaurant_id = o.restaurant_id;



