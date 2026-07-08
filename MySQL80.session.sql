-- Delete table if it already exists
DROP TABLE IF EXISTS Employees;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    PRIMARY KEY (EmployeeID)
);

-- Insert data
INSERT INTO Employees (FirstName, LastName, Department, Salary)
VALUES
('John', 'Doe', 'Engineering', 75000.00),
('Jane', 'Smith', 'Marketing', 65000.00),
('Emily', 'Johnson', 'Sales', 55000.00),
('Michael', 'Brown', 'Engineering', 80000.00),
('Sarah', 'Davis', 'HR', 60000.00),
('Siva', 'Kumar', 'HR', 60000.00);

-- Display all records
SELECT * FROM Employees;

-- Employees with salary greater than 60000
SELECT *
FROM Employees
WHERE Salary > 60000
ORDER BY Salary;

-- Employees from Engineering department
SELECT *
FROM Employees
WHERE Department = 'Engineering';

-- Employees with salary less than 70000 and in Marketing
SELECT *
FROM Employees
WHERE Salary < 70000
AND Department = 'Marketing';

-- Employees with salary between 60000 and 70000
SELECT *
FROM Employees
WHERE Salary BETWEEN 60000 AND 70000;

-- First name starts with J
SELECT *
FROM Employees
WHERE FirstName LIKE 'J%';

-- Last name ends with 'n'
SELECT *
FROM Employees
WHERE LastName LIKE '%n';

-- Department contains 'Eng'
SELECT *
FROM Employees
WHERE Department LIKE '%Eng%';

-- Employees ordered by highest salary
SELECT *
FROM Employees
ORDER BY Salary DESC;

-- Employees ordered alphabetically by first name
SELECT *
FROM Employees
ORDER BY FirstName ASC;