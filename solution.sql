CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE Employee_Log (
    Message VARCHAR(100)
);

DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Log (Message)
    VALUES (
        CONCAT('New employee inserted: ', NEW.EmpName)
    );
END //

DELIMITER ;

INSERT INTO Employee (EmpID, EmpName, Salary)
VALUES (101, 'Arun', 25000.00);

SELECT * FROM Employee;

SELECT * FROM Employee_Log;
