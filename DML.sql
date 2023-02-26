Use ElectricBillingDB
Go

-- Inserting data into the Customers table
INSERT INTO Customers (Customer_Id, customer_name,phone_number, email, billing_address) 
VALUES  (1, 'Md Easin Alif', '+8801794022773', 'tweet.easinalif@gmail.com','Agrabad Industrial Area,Chittagong'),
		(2, 'Abid Rana', '+8801783781901', 'abdrana11@outlook.com', 'Ashugonj'),
		(3, 'Arafat Hossain', '+8801756587032', 'arafathsn@yahoo.com', 'Bajitpur, Kishoreganj'),
		(4, 'Rana Hamid', '+8801634044860', 'rana444@gmail.com', 'Syed Shah Road,Chittagong'),
		(5, 'Adnan Sumon', '+8801786075902', 'adn616@yahoo.com', 'Bandarbon, Hilltrac District'),
		(6, 'Nahiyean Alif', '+8801784022555', 'n.alif@gmail.com','Agrabad Industrial Area,Chittagong'),
		(7, 'Zunayed Nahid', '+8801887559666', 'znahid@outlook.com', 'Ashugonj'),
		(8, 'Rafiqul Islam', '+8801656583333', 'ri.soft@yahoo.com', 'Bajitpur, Kishoreganj'),
		(9, 'Abdus Salam', '+8801534033890', 'absalam@gmail.com', 'Syed Shah Road,Chittagong'),
		(10, 'Mezba Rahman', '+8801386088990', 'mezbarahman@yahoo.com', 'Bandarbon, Hilltrac District');
Go

-- Inserting data into the Meters table
INSERT INTO Meters (meter_id,location, serial_number, initial_reading, current_reading, installation_date)
VALUES	 (1, 'Agrabad Industrial Area,Chittagong', 'A123', 100, 120, '2022-01-01'),
		 (2, 'Ashugonj', 'B456', 200, 240, '2022-02-01'),
		 (3, 'Bajitpur, Kishoreganj', 'C789', 300, 320, '2022-03-01'),
		 (4, 'Syed Shah Road,Chittagong', 'D321', 400, 440, '2022-04-01'),
		 (5, 'Bandarbon, Hilltrac District', 'E654', 500, 550, '2022-05-01'),
		 (6, 'Agrabad Industrial Area,Chittagong', 'F123', 600, 160, '2022-01-01'),
		 (7, 'Ashugonj', 'G456', 700, 770, '2022-02-01'),
		 (8, 'Bajitpur, Kishoreganj', 'H789', 800, 880, '2022-03-01'),
		 (9, 'Syed Shah Road,Chittagong', 'I321', 900, 990, '2022-04-01'),
		 (10, 'Bandarbon, Hilltrac District', 'J654', 1000, 1100, '2022-05-01');
Go

-- Inserting data into the Billing table
INSERT INTO Billing (bill_id, customer_id,  meter_id, billing_period_start, billing_period_end, due_date, amount, status) 
VALUES  (1, 1, 1, '2023-01-01', '2022-01-31', '2023-02-15', 2000, 'unpaid'),
		(2, 2, 2, '2023-02-01', '2022-02-28', '2023-03-15', 3000, 'unpaid'),
		(3, 3, 3, '2023-03-01', '2022-03-31', '2023-04-15', 4000, 'unpaid'),
		(4, 4, 4, '2023-04-01', '2022-04-30', '2023-05-15', 5000, 'unpaid'),
		(5, 5, 5, '2023-05-01', '2022-05-31', '2023-06-15', 6000, 'unpaid'),
		(6, 6, 6, '2023-01-01', '2022-01-31', '2023-02-15', 2500, 'unpaid'),
		(7, 7, 7, '2023-02-01', '2022-02-28', '2023-03-15', 3500, 'unpaid'),
		(8, 8, 8, '2023-03-01', '2022-03-31', '2023-04-15', 4500, 'unpaid'),
		(9, 9, 9, '2023-04-01', '2022-04-30', '2023-05-15', 5500, 'unpaid'),
		(10, 10, 10, '2023-05-01', '2022-05-31', '2023-06-15', 6500, 'unpaid');
Go

-- Inserting data into the Payments table
INSERT INTO Payments (payment_id, bill_id, customer_id, payment_date, amount, method) 
VALUES	(1, 1, 1, '2023-02-15', 2000, 'credit_card'),
		(2, 2, 2, '2023-03-15', 3000, 'debit_card'),
		(3, 3, 3, '2023-04-15', 4000, 'online_banking'),
		(4, 4, 4, '2023-05-15', 5000, 'cash'),
		(5, 5, 5, '2023-06-15', 6000, 'credit_card'),
		(6, 6, 6, '2023-02-15', 2500, 'credit_card'),
		(7, 7, 7, '2023-03-15', 3500, 'debit_card'),
		(8, 8, 8, '2023-04-15', 4500, 'online_banking'),
		(9, 9, 9, '2023-05-15', 5500, 'cash'),
		(10, 10, 10, '2023-06-15', 6500, 'credit_card');
Go

--Inserting data into the Tariff table
INSERT INTO Tariff (tariff_id, rate, tax, type) 
VALUES	(1, 0.15, 0.05, 'Residential'),
		(2, 0.20, 0.10, 'Commercial'),
		(3, 0.25, 0.15, 'Industrial');
Go

-- Inserting data into the Employees table
INSERT INTO Employees (employee_id, employee_name, employee_address, phone_number, email, employee_position) 
VALUES	(1, 'Nahiyean Alif', 'Chittagong Sadar', '+8801910940115', 'nalif@outlook.com', 'admin'),
		(2, 'Jaber Jihad', 'Ashugonj', '+8801634044866', 'jj77@yahoo.com', 'employee'),
		(3, 'Ariyean Akiv', 'Bajitpur', '+8801794022778', 'ariyean.akiv@gmail.com', 'admin'),
		(4, 'Raihan Kabir', 'Syed Shah Road,Chittagong', '+8801552656483', 'rk991@yahoo.com', 'employee'),
		(5, 'Anfal Adiyat', 'Bandarbon, Hilltrac District', '+8801967895643', 'an.adiyat@gmail.com', 'admin');
Go

------- Select From Table -------
Select * From Customers
Select * From Meters
Select * From Billing
Select * From Payments
Select * From Tariff
Select * From Employees


------- MERGE ------
INSERT INTO Candidate(ID,Name) 
VALUES (1,'Nahiyean'),(2,'Alif'),(3,'Partho');
Go

INSERT INTO Person(ID,Name,Age) 
VALUES (1,'Nahiyean', 22),(2,'Alif', 24),(3,'Partho', 27);
Go

MERGE INTO Person AS P
USING Candidate AS C ON P.ID=C.ID
when Matched THEN
UPDATE SET P.Name=C.Name
WHEN NOT MATCHED THEN 
INSERT (ID,Name,Age) 
VALUES (C.ID,C.Name,22);

SELECT * FROM Person;
Go

-------- Join ---------
SELECT Customers.customer_name, Meters.location, Billing.billing_period_start, Billing.amount
FROM Billing
JOIN Customers ON Billing.customer_id = Customers.customer_id
JOIN Meters ON Billing.meter_id = Meters.meter_id
ORDER BY Billing.amount DESC;
Go

---Inner join
SELECT SUM(Billing.amount) - SUM(Payments.amount) as tariff
FROM Billing
Inner JOIN Payments ON Billing.bill_id = Payments.bill_id
WHERE Billing.customer_id = 3;
Go

--- Self join
SELECT c.Customer_Name AS CustomerName, b.billing_period_start AS Billing_Date, p.amount
FROM Customers c, Billing b, Payments p
WHERE c.Customer_ID <> b.Customer_ID
AND p.amount = b.amount
ORDER BY c.customer_id, b.billing_period_start;
go

---- Outer joins
SELECT c.Customer_name, c.billing_address, b.billing_period_start, p.amount
FROM Customers c
LEFT JOIN Billing b
ON c.customer_id = b.customer_id
LEFT JOIN Payments p
ON b.amount = p.amount
Go

----Cross join
SELECT c.Customer_name, c.billing_address, m.serial_number, b.billing_period_start, b.amount, p.method, tf.type
FROM Customers c
CROSS JOIN Meters m
CROSS JOIN Billing b
CROSS JOIN Payments p
CROSS JOIN Tariff tf
Go
------- Top Clause -------
SELECT TOP 10 c.customer_name, SUM(b.amount) as total_amount
FROM customers c
INNER JOIN billing b ON c.customer_id = b.customer_id
GROUP BY c.customer_name
ORDER BY total_amount DESC;
Go

---- Subquery ------
SELECT customer_name, phone_number, email, billing_address
FROM Customers
WHERE customer_id IN (
    SELECT customer_id FROM Billing
    WHERE amount > 50
);
go

SELECT payment_id, bill_id, customer_id, payment_date, amount
FROM Payments
WHERE method = 'credit_card' AND bill_id IN (
    SELECT bill_id FROM Billing
);
go

------- Correleted Subquery ------
SELECT Billing.bill_id, Billing.customer_id, Billing.amount, Billing.due_date,
(SELECT SUM(Payments.amount) 
FROM Payments WHERE Payments.bill_id = Billing.bill_id) as paid_amount
FROM Billing
WHERE (SELECT COUNT(Payments.bill_id) 
FROM Payments WHERE Payments.bill_id = Billing.bill_id) > 0;
Go

------ Complex Queries -----
SELECT 
  c.Customer_Name, 
  SUM(p.amount) AS total_paid
FROM customers c
LEFT JOIN payments p ON c.customer_id = p.customer_id
GROUP BY c.Customer_Name;
Go

------- CTE --------
WITH payments_cte AS (
    SELECT bill_id, SUM(amount) as total_paid
    FROM Payments
    GROUP BY bill_id
)
SELECT b.bill_id, b.customer_id, b.amount, b.due_date, p.total_paid
FROM Billing b
LEFT JOIN payments_cte p ON b.bill_id = p.bill_id
Go

------- WildCard (Like Operator) ------
SELECT * FROM Customers
WHERE customer_name LIKE 'a%';
Go

SELECT * FROM customers
WHERE customer_name NOT LIKE '[JK]%';
Go

SELECT * FROM Customers
WHERE billing_address LIKE '%ng';
GO

------- Logical Operator --------
SELECT * FROM customers
WHERE customer_name LIKE 'A%' AND billing_address LIKE '%ng';
Go

SELECT * FROM customers
WHERE customer_name LIKE 'A%' OR billing_address LIKE '%ng';
Go

SELECT * FROM customers
WHERE NOT (customer_name LIKE 'A%' AND billing_address LIKE '%ng');
Go

------ Having Opeartor -----
SELECT Customer_ID, SUM(Amount) as TotalPayment
FROM Payments
GROUP BY Customer_ID
HAVING SUM(Amount) > 3000
Go
---- Union Opeartor ------
SELECT bill_id, customer_id, amount as bill_amount, due_date
FROM Billing
UNION
SELECT bill_id, customer_id, amount as payment_amount, payment_date as due_date
FROM Payments;
Go

------- Cube Opeartor --------
SELECT customer_id, meter_id, billing_period_start, SUM(amount) as total_amount
FROM Billing
GROUP BY customer_id, meter_id, billing_period_start WITH CUBE;
Go

----- Rollup Opeartor -------
SELECT customer_id, meter_id, billing_period_start, SUM(amount) as total_amount
FROM Billing
GROUP BY customer_id, meter_id, billing_period_start WITH ROLLUP;
Go

--------- Grouping Sets Opeartor ------
SELECT customer_id, meter_id, billing_period_start, SUM(amount) as total_amount
FROM Billing
GROUP BY GROUPING SETS((customer_id, meter_id), (billing_period_start));
Go

------ Exist Operator ------
SELECT Billing.bill_id, Billing.customer_id, Billing.amount, Billing.due_date
FROM Billing
WHERE EXISTS (SELECT * FROM Payments WHERE Payments.bill_id = Billing.bill_id);
GO

------- Except & Intersect Operator------
SELECT Customer_ID, Customer_Name
FROM Customers
EXCEPT
SELECT Employee_Id, Employee_Name
FROM Employees
ORDER BY Customer_ID; 
Go

SELECT Customer_ID, Customer_Name
FROM Customers
INTERSECT
SELECT Employee_Id, Employee_Name
FROM Employees


---- Over ------
SELECT customer_id, meter_id, billing_period_start, SUM(amount) 
OVER (PARTITION BY customer_id) as total_amount_per_customer
FROM Billing
Go

------- Any Keyword -------
SELECT customer_id, meter_id, billing_period_start, amount
FROM Billing
WHERE amount > ANY (SELECT amount FROM Billing WHERE customer_id = 1);
Go

------ All Keyword -----
SELECT customer_id, meter_id, billing_period_start, amount
FROM Billing
WHERE amount > ALL (SELECT amount FROM Billing WHERE customer_id = 1);
Go

------- CASE -----
SELECT bill_id, amount, 
CASE 
    WHEN amount BETWEEN 10 AND 20 THEN 'Low'
    WHEN amount BETWEEN 30 AND 40 THEN 'Medium'
    ELSE 'High'
END AS bill_category
FROM Billing;
Go

------- CAST --------
SELECT CAST('01-December-2022' AS date)
Go

------- CONVERT -------
SELECT Datetime = CONVERT(datetime,'01-December-2022 10:00:10.00')
Go

------ TRY_CONVERT ------
SELECT TRY_CONVERT(INT, '11') AS 'Integer Conversion',
       TRY_CONVERT(DATE, '2022-12-31') AS 'Date Conversion',
       TRY_CONVERT(VARCHAR(10), GETDATE()) AS 'Datetime Conversion'
Go
------ IIF and CHOOSE functions ------
-- Using IIF function
SELECT bill_id, amount, IIF(amount>3000, 'High Bill', 'Low Bill') AS 'Bill Type'
FROM Billing
Go

-- Using CHOOSE Function
SELECT payment_id, payment_date, amount,
       CHOOSE(method, 'Cash', 'CreditCard', 'Debit Card', 'Online Transfer') AS PaymentMethod
FROM Payments
WHERE payment_date  between '2023-02-15' and '2023-06-15'
Go

----- COALESCE and ISNULL Functions -----
-- Using COALESCE function
SELECT customer_name, billing_address, COALESCE(phone_number, 'N/A') AS 'Contact'
FROM Customers
Go

-- Using ISNULL function
SELECT customer_name, billing_address, ISNULL(email, 'N/A') AS 'Email'
FROM Customers
Go

----- Aggregate Function ------
SELECT COUNT(*) as NoOfCustomer FROM customers;
Go

SELECT SUM(amount) as TotalAmount FROM billing;
Go

SELECT AVG(amount) as TotalAverageAmount FROM billing;
Go

SELECT MIN(amount) as MinimumAmount FROM Payments;
Go

SELECT MAX(amount) as MaximumAmount FROM Payments;
GO

--------- Precedence of set operators ----------
-- Without Parentheses
Select Customer_ID, Customer_Name
From Customers
where Billing_Address = 'Bandarbon, Hilltrac District'
Union
Select c.Customer_ID, c.Customer_Name
From Customers c
where c.Customer_ID IN (Select b.Customer_ID
From Billing b, Payments p
where b.Bill_ID = p.Bill_ID
and p.Method = 'credit_card')
Intersect
Select Customer_ID, Customer_Name
From Customers
where Billing_Address = 'Bandarbon, Hilltrac District';
Go

-- With Parentheses
Select Customer_ID, Customer_Name
From Customers
where Billing_Address = 'Bajitpur, Kishoreganj'
Union
(
Select c.Customer_ID, c.Customer_Name
From Customers c
where c.Customer_ID IN (Select b.Customer_ID
From Billing b, Payments p
where b.Bill_ID = p.Bill_ID
and p.Method = 'online_banking')
Intersect
Select Customer_ID, Customer_Name
From Customers
where Billing_Address = 'Bajitpur, Kishoreganj'
);
Go

------- Store Procedure to Insert -------
Create Proc Sp_InsertCustomer
@customer_id int,
@customer_name Varchar(20),
@phone_number Varchar(20),
@email Varchar(20),
@billing_address Varchar(20)
as
Insert Into Customers(customer_id,customer_name,phone_number,email,billing_address)
values (@customer_id,@customer_name,@phone_number,@email,@billing_address)
go
Exec Sp_InsertCustomer 6,'Adiyen Rahi','+8801783291711','ad.rahi@yahoo.com','Bakergonj, Barishal'
go

------- Store Procedure to Update --------
Create Proc Sp_UpdateCustomer
@customer_id int,
@customer_name VARCHAR(20)
as
Update Customers set customer_name=@customer_name
where customer_id=@customer_id
go
EXEC Sp_UpdateCustomer 6,'Ariyean Elahi'
go

------ Store Procedure Delete -----
Create Proc Sp_DeleteCustomer
@customer_id int
as
Delete From Customers where customer_id = @customer_id
go
Exec Sp_DeleteCustomer 6
go

--------- Instead of Insert Trigger ---------
CREATE TRIGGER tr_validate_customer_info
ON Customers
INSTEAD OF INSERT
AS
BEGIN
    -- validate customer information
    IF EXISTS (SELECT 1 FROM inserted WHERE customer_name IS NULL OR billing_address IS NULL OR email IS NULL)
    BEGIN
        RAISERROR('Invalid customer information', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
    
    -- Insert the validated customer information
    INSERT INTO Customers (customer_name, billing_address, email)
    SELECT customer_name, billing_address, email
    FROM inserted
END
Go

-------- After Update Trigger -------
CREATE TRIGGER tr_update_payment_status
ON Billing
AFTER UPDATE
AS
BEGIN
    -- update the payment status
    UPDATE P
    SET P.method = 'credit_card'
    FROM Payments P
    JOIN inserted I ON P.bill_id = I.bill_id
    WHERE I.status = 'Paid'
END
Go

------ After Delete Trigger --------
CREATE TRIGGER archive_deleted_payments
ON payments
AFTER DELETE
As
BEGIN
    INSERT INTO payments_archive 
		(Payment_ID, Bill_ID, Customer_ID, Payment_Date, Amount, Method)
	SELECT Payment_ID, Bill_ID, Customer_ID, Payment_Date, Amount, Method
		From Deleted
END;

DELETE Payments
WHERE Payment_ID = 6;
Go

------------ Insert/Update/Delete from View --------------
-----Insert
Insert into billing_payments values(6, 6, 70.00, '2022-07-15', '2022-07-15');
go

---- Update
Update billing_payments 
Set 
    amount = 65.00
where
    bill_id = 5;

Select * From billing_payments;
go

-----Delete/Drop
Delete from billing_payments where customer_id = 5;
go

Drop View billing_payments;
go

Select * From billing_payments;
go