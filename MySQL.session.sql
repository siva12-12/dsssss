DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS ride;

CREATE TABLE ride(
    ride_id        INT,
    driver_id      INT,
    passenger_id   INT,
    start_location VARCHAR(255) NOT NULL,
    end_location   VARCHAR(255),
    fare           DECIMAL(10, 2) CHECK (fare >= 0),
    ride_date      DATETIME,
    PRIMARY KEY (ride_id, driver_id),
    INDEX idx_driver_id (driver_id)  
);

INSERT IGNORE INTO ride (ride_id, driver_id, passenger_id, start_location, end_location, fare, ride_date)
VALUES
(2, 103, 202, 'Madurai', 'Trichy',  800.00, '2026-05-06 09:15:00'),
(2, 104, 203, 'Salem',   'Erode',   600.75, '2026-05-07 14:00:00'),
(4, 105, 204, 'Chennai', 'Vellore', 500.00, '2026-05-08 18:45:00');

SELECT * FROM ride;

CREATE TABLE drivers(
    driver_id      INT PRIMARY KEY,  -- ✅ Primary Key add pannu
    start_location VARCHAR(255) NOT NULL,
    end_location   VARCHAR(255),
    FOREIGN KEY (driver_id) REFERENCES ride(driver_id)
);

-- ✅ driver_id also insert pannu
INSERT INTO drivers (driver_id, start_location, end_location) VALUES
(103, 'Madurai', 'Trichy'),   -- ✅ ride table la 103 iruku
(104, 'Salem',   'Erode'),    -- ✅ ride table la 104 iruku
(105, 'Chennai', 'Vellore');  -- ✅ ride table la 105 iruku


ALTER TABLE drivers ADD COLUMN is_delete BOOLEAN DEFAULT FALSE;
UPDATE DRIVERS SET is_delete = TRUE WHERE driver_id = 104;
SELECT * FROM drivers;
desc drivers;



