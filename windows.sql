DROP TABLE IF EXISTS food;
create Table food (
    food_id INT,
    name    VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2)
);

insert into food (food_id, name, amount) values
(1, 'Pizza', 10.00),
(1, 'Sushi', 15.00),
(3, 'Burger', 15.00),
(3, 'Taco', 5.00),
(5, 'Pasta', 12.00);

select * from food;

SELECT food_id, name, amount,
ROW_NUMBER() OVER(PARTITION BY food_id) AS running_total
from food;


















SELECT
    food_id,
    name,
    amount,
    PERCENT_RANK() OVER(ORDER BY amount DESC) AS score,
    RANK() OVER(ORDER BY amount DESC) AS ranking
FROM food;

SELECT 
    food_id,
    name,
    amount,
    NTILE(3) OVER(ORDER BY amount DESC) AS quartile
from food;



