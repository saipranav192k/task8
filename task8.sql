-- Step 0: Create and select the database
CREATE DATABASE IF NOT EXISTS company;
USE company;

-- Drop existing procedure and function if they exist
DROP PROCEDURE IF EXISTS GetEmployeesByDept;
DROP FUNCTION IF EXISTS GetBonus;

-- Drop tables if they exist
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Create Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Insert sample data into Departments
INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales');

-- Insert sample data into Employees
INSERT INTO Employees VALUES
(101, 'Alice', 50000, 1),
(102, 'Bob', 60000, 2),
(103, 'Charlie', 45000, 1),
(104, 'David', 70000, 3);

-- Create Stored Procedure: GetEmployeesByDept
DELIMITER $$

CREATE PROCEDURE GetEmployeesByDept(IN deptName VARCHAR(50))
BEGIN
    SELECT E.EmpName, E.Salary
    FROM Employees E
    JOIN Departments D ON E.DeptID = D.DeptID
    WHERE D.DeptName = deptName;
END $$

-- Create Function: GetBonus
CREATE FUNCTION GetBonus(salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE bonus INT;

    IF salary >= 60000 THEN
        SET bonus = salary * 0.10;
    ELSE
        SET bonus = salary * 0.05;
    END IF;

    RETURN bonus;
END $$

DELIMITER ;

-- Example usage
-- CALL GetEmployeesByDept('HR');
-- SELECT EmpName, Salary, GetBonus(Salary) AS Bonus FROM Employees;
