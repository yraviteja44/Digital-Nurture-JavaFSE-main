SELECT * FROM Customers;
SELECT * FROM Loans;


UPDATE Loans l
JOIN Customers c ON l.CustomerID = c.CustomerID
SET l.InterestRate = l.InterestRate - 1
WHERE c.Age > 60;
SELECT * FROM Loans;



SET SQL_SAFE_UPDATES = 0;
UPDATE Customers
SET IsVIP = TRUE
WHERE Balance > 10000;
SELECT * FROM Customers;


SELECT CONCAT(
    'Reminder: Dear ',
    c.Name,
    ', your loan (ID: ',
    l.LoanID,
    ') is due on ',
    DATE_FORMAT(l.DueDate, '%d-%b-%Y')
) AS Reminder_Message
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID
WHERE l.DueDate BETWEEN CURDATE()
AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);