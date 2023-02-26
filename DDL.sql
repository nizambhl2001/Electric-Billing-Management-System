Use Master
Go

Drop Database ElectricBillingDB
Go
-- Create the Database
CREATE DATABASE ElectricBillingDB
On primary(
Name = N'ElectricBillingDB_Data_1',
Filename = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ElectricBillingDB_Data_1.mdf',
Size = 50MB,
MaxSize = 100MB, 
FileGrowth = 5%)

Log on(
Name = N'ElectricBillingDB_Log_1',
Filename = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ElectricBillingDB_Log_1.ldf',
Size = 25MB,
MaxSize = 50MB, 
FileGrowth = 1%)
Go

USE ElectricBillingDB;
Go

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    billing_address VARCHAR(255) NOT NULL
);
Go

-- Create the Meters table
CREATE TABLE Meters (
    meter_id INT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    serial_number VARCHAR(255) NOT NULL,
    initial_reading DECIMAL(10,2) NOT NULL,
    current_reading DECIMAL(10,2) NOT NULL,
    installation_date DATE NOT NULL
);
Go

-- Create the Billing table
CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    meter_id INT REFERENCES Meters(meter_id),
    billing_period_start DATE NOT NULL,
    billing_period_end DATE NOT NULL,
    due_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status Varchar(50) NOT NULL,
);
Go

-- Create the Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    bill_id INT REFERENCES Billing(bill_id),
    customer_id INT REFERENCES Customers(customer_id),
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    method Varchar(50) NOT NULL,
);
Go

-- Create the Tariff table
CREATE TABLE Tariff (
    tariff_id INT PRIMARY KEY,
    rate DECIMAL(10,2) NOT NULL,
    tax DECIMAL(10,2) NOT NULL,
    type VARCHAR(255) NOT NULL
);
Go

-- Create the Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    employee_address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    employee_position Varchar(255) NOT NULL
);
Go

------ Create Index ------ 
CREATE CLUSTERED INDEX IX_Employees
    ON Employees (Employee_ID);
Go

CREATE NONCLUSTERED INDEX IX_Customers  
    ON Customers (Customer_ID);   
Go

------ Create Constraint -----
ALTER TABLE Employees
ADD CONSTRAINT PK_Employees PRIMARY KEY (Employee_ID,Employee_Name);
Go

------ Create Merge Table-------
CREATE TABLE Candidate(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR(50)
);

CREATE TABLE Person(
	ID INT PRIMARY KEY NOT NULL,
	NAME VARCHAR(50),
	Age INT
);

------ Create Store Procedure --------
CREATE PROCEDURE insert_customer
@customer_id INT, 
@customer_name VARCHAR(255), 
@billing_address VARCHAR(255), 
@phone_number VARCHAR(255)
As
BEGIN
  INSERT INTO customers (customer_id, customer_name, billing_address, phone_number)
  VALUES (11, 'Raihan Farhan', 'Rangamati', '+880196025267');
END

-------- Create Out parameter in Store Procedure ---------- 
CREATE PROCEDURE usp_ElectricBill (
    @Amount int,
    @Status Varchar(50) output
) AS
BEGIN
    SELECT @Amount, @Status FROM Billing
END;

DECLARE @Bill INT;
EXEC usp_ElectricBill @Amount = 50, @Status=@Bill OUTPUT;
SELECT @Bill;
GO

---------- Create Table Value Function --------
CREATE FUNCTION get_billing_by_customer(@customer_id INT)
RETURNS TABLE
AS
RETURN (
    SELECT bill_id, customer_id, amount, due_date
    FROM Billing
    WHERE customer_id = @customer_id
)

SELECT * FROM get_billing_by_customer(5);

--------- Create Scaler Value Function -----------
CREATE FUNCTION get_total_payments(@customer_id INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @total DECIMAL(10,2);
    SELECT @total = SUM(amount) FROM Payments WHERE customer_id = @customer_id
    RETURN @total;
END;

SELECT get_total_payments(5);
Go
---------- Create Multi-Statement Table-Valued Function  ------------
CREATE FUNCTION GetBillingAndPaymentsByCustomer (@customer_ID INT, @billing_period_start DATE, @billing_period_end DATE)
RETURNS TABLE
AS
RETURN (
    SELECT B.Bill_ID, B.Customer_id, B.Amount, P.Payment_ID, P.Payment_Date, P.Method
    FROM Billing B
    JOIN Payments P ON B.Bill_ID = P.Bill_ID
    WHERE B.Customer_ID = @customer_ID AND B.billing_period_start BETWEEN @billing_period_start AND @billing_period_end
)

SELECT * FROM GetBillingAndPaymentsByCustomer(1,'2022-01-01','2022-01-31')
Go

-------- Create Raiserror Trigger ----------
CREATE TRIGGER dbo.Trg_InsteadOfUpdate_Billing
ON Billing
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @bill_id int, @customer_id int, @meter_id int, @billing_period_start Varchar(50), @billing_period_end Varchar(50), 
	@amount int, @status Varchar(50);
	SELECT @bill_id = eb.bill_id,
	       @customer_id = eb.customer_id,
	       @meter_id = eb.meter_id,
	 	   @billing_period_start = eb.billing_period_start,
		   @billing_period_end = eb.billing_period_end,
		   @amount = eb.amount,
		   @status = eb.status
	FROM Billing eb
	if UPDATE(customer_id)
	BEGIN
        RAISERROR('ElectricBill cannot be updated.', 16 ,1)
	    ROLLBACK
	END
	ELSE
	BEGIN
	  UPDATE [Billing]
	  SET bill_id = @bill_id
	  WHERE customer_id = @customer_id
	END
END
GO

---------- Create View ----------
CREATE VIEW billing_payments AS
SELECT	bl.bill_id, 
		bl.customer_id, 
		bl.amount, 
		bl.due_date, 
		py.payment_date
FROM Billing bl
JOIN Payments py
ON bl.bill_id = py.bill_id

SELECT * FROM billing_payments;

------- Create Encrypt View --------
CREATE VIEW EncryptedPayments
WITH ENCRYPTION
AS
SELECT Payment_ID, Amount, Method
FROM Payments;

SELECT * FROM EncryptedPayments

------ Schemabinding View -------
create table vendors(
	vendorid int,
	vendorname varchar(15),
	vendorcity varchar(15),
	vendorstate varchar(15)
 );
 
insert into vendors values (20,'Alif','Bhola','Powro Algi'), (21,'Asif','Barishal','Baker Gonj'),
(22,'Akiv','Potuakhali','Sereemoni Road'),(23,'Adil','Perozfur','Sahabazpur Coloni'),(24,'Abir','Borguna','Hazi Para')
Go

create table mcninvoices(
	invoiceid int not null identity primary key,
	vendorid int not null,
	invoiceno varchar(15),
	invoicetotal money,
	paymenttotal money,
	creadittotal money
);
insert into mcninvoices values (20,'e001',100,100,0.00),(21,'e002',200,200,0.00),
(22,'e003',500,0.00,100),(23,'e004',1000,100,100),(24,'e005',1200,200,500)
Go

create view viewschema
with schemabinding
as
select vendorname as name,invoicetotal as invoice_total
from dbo.mcninvoices join dbo.vendors
on mcninvoices.vendorid=vendors.vendorid

select * from viewschema
Go
