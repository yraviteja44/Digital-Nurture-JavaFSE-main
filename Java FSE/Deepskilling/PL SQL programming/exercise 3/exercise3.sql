CREATE DATABASE BankDB;
USE BankDB;
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Accounts VALUES
(101,'Ravi','Savings',50000),
(102,'Rahul','Savings',30000),
(103,'Anjali','Current',40000),
(104,'Sneha','Savings',60000);
INSERT INTO Employees VALUES
(1,'Amit','IT',50000),
(2,'Priya','HR',45000),
(3,'Kiran','IT',60000),
(4,'Neha','Finance',55000);

DELIMITER //

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
    UPDATE Accounts
    SET Balance = Balance * 1.01
    WHERE AccountType = 'Savings';
END //

DELIMITER ;
CALL ProcessMonthlyInterest();

SET SQL_SAFE_UPDATES = 0;


DELIMITER //

CREATE PROCEDURE UpdateEmployeeBonus(
    IN deptName VARCHAR(50),
    IN bonusPercent DECIMAL(5,2)
)
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonusPercent / 100)
    WHERE Department = deptName;
END //

DELIMITER ;
CALL UpdateEmployeeBonus('IT',10);

SELECT * FROM Employees;

DELIMITER //

CREATE PROCEDURE TransferFunds(
    IN fromAcc INT,
    IN toAcc INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    DECLARE bal DECIMAL(10,2);

    SELECT Balance
    INTO bal
    FROM Accounts
    WHERE AccountID = fromAcc;

    IF bal >= amount THEN

        UPDATE Accounts
        SET Balance = Balance - amount
        WHERE AccountID = fromAcc;

        UPDATE Accounts
        SET Balance = Balance + amount
        WHERE AccountID = toAcc;

        SELECT 'Transfer Successful' AS Message;

    ELSE

        SELECT 'Insufficient Balance' AS Message;

    END IF;

END //

DELIMITER ;

CALL TransferFunds(101,102,5000);

SELECT * FROM Accounts;