use [master];
go
if db_id('Sports_store') is not null
begin
	drop database [Sports_store];
end
go
create database [Sports_store];
go
use [Sports_store];
go
CREATE TABLE [Product]  (
[Id] int not null identity(1,1) primary key,
[Name] NVARCHAR(max) not null,
[type_of_product] NVARCHAR(MAX) not null,
[quantity_of_goods_in_stock] int null,
[cost_price] int not null,
[Selling_price] int not null,

);
go
CREATE TABLE [Sales](
[Id] int not null identity(1,1) primary key,
[Name] NVARCHAR(max) not null,
[value] int not null,
[quantity] int not null,
[Date_sale] SMALLDATETIME not null,
);
go
CREATE TABLE [Employees](
[Id] int not null identity(1,1) primary key,
[Name]NVARCHAR(20) NOT NULL,
[Surname]NVARCHAR(20) NOT NULL,
[position]Nvarchar(100) NOT NULL,
[date_employment] date not null,
[status] Nvarchar(100) not null,
[Salary] money not null, 
);
go
CREATE TABLE [Clients](
[Id] int not null identity(1,1) primary key,
[Name]NVARCHAR(20) not null,
[Surname]NVARCHAR(20) not null,
[email] nvarchar(max) not null,
[phone_num] int  not null,
[History_orders] Nvarchar(max) null,
[discount_percentage] int null,
[signed_for_mailing] nvarchar(20) null,

);
go
CREATE TABLE History (
  Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  ProductId int NOT NULL,
  Value INT NOT NULL,
  Quantity INT NOT NULL,
  Date_sale SMALLDATETIME NOT NULL,
  SellerId int NOT NULL,
  ClientId int NULL,
  FOREIGN KEY (ProductId) REFERENCES Product(Id),
  FOREIGN KEY (SellerId) REFERENCES Employees(Id),
  FOREIGN KEY (ClientId) REFERENCES Clients(Id)
);
go
CREATE TABLE Archive (
  Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  Name NVARCHAR(MAX) NOT NULL,
  Type_of_product NVARCHAR(MAX) NOT NULL,
  Cost_price INT NOT NULL,
  Manufacturer NVARCHAR(MAX) NOT NULL,
  Selling_price INT NOT NULL
);
go
CREATE TABLE Last_Unit (
  Id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
  ProductId int NOT NULL,
  Name NVARCHAR(MAX) NOT NULL,
  Type_of_product NVARCHAR(MAX) NOT NULL,
  Selling_price INT NOT NULL,
  FOREIGN KEY (ProductId) REFERENCES Product(Id)
);
--_________________________________________________________________
                      --#1
CREATE TRIGGER mod_Product_History ON Product
AFTER INSERT
AS
BEGIN
  INSERT INTO History (
    ProductId, Name, Type_of_product, Quantity_of_goods_in_stock, Cost_price_manufacturer, Selling_price
  )
  SELECT
    Id, Name, Type_of_product, Quantity_of_goods_in_stock, Cost_price_manufacturer, Selling_price
  FROM inserted;
END;


CREATE TRIGGER mod_Employees_History ON Emplotees
AFTER INSERT
AS
BEGIN
INSERT INTO History(
EmployeesId,Name,Surname,position,data_employment,status,Salary
)
SELECT
Id,Name,Surname,position,data_employment,status,Salary
FROM inserted;
END;


CREATE TRIGGER mod_Clients_History ON Clients
AFTER INSERT
AS
BEGIN
INSERT INTO History(
ClientsId,Name,Surname,email,phone_num,History_orders,discount_percentage,signed_for_mailing
)
SELECT
Id,Name,Surname,email,phone_num,History_orders,discount_percentage,signed_for_mailing
FROM inserted;
END;


CREATE TRIGGER mod_Sales_History ON Sales
AFTER INSERT
AS
BEGIN
INSERT INTO History(
SalesId,Name,valuable,quantity,Date_sale
)
SELECT
Id,Name,valuable,quantity,Date_sale
FROM inserted;
END;

--__________________________________________________
            --#2
CREATE TRIGGER mod_Product_History ON Product
AFTER UPDATE
AS
BEGIN
  INSERT INTO Product_History (
    ProductId, Name, Type_of_product, Quantity_of_goods_in_stock, Cost_price_manufacturer, Selling_price
  )
  SELECT
    Id, Name, Type_of_product, Quantity_of_goods_in_stock, Cost_price_manufacturer, Selling_price
  FROM deleted;
END;

-- #2
CREATE TRIGGER mod_Employees_History ON Employees
AFTER UPDATE
AS
BEGIN
  INSERT INTO Employees_History (
    EmployeesId, Name, Surname, Position, Date_employment, Status, Salary
  )
  SELECT
    Id, Name, Surname, Position, Date_employment, Status, Salary
  FROM deleted;
END;

-- #3
CREATE TRIGGER mod_Clients_History ON Clients
AFTER UPDATE
AS
BEGIN
  INSERT INTO Clients_History (
    ClientsId, Name, Surname, Email, Phone_num, History_orders, Discount_percentage, Signed_for_mailing
  )
  SELECT
    Id, Name, Surname, Email, Phone_num, History_orders, Discount_percentage, Signed_for_mailing
  FROM deleted;
END;

-- #4
CREATE TRIGGER mod_Sales_History ON Sales
AFTER UPDATE
AS
BEGIN
  INSERT INTO Sales_History (
    SalesId, Name, Value, Quantity, Date_sale
  )
  SELECT
    Id, Name, Value, Quantity, Date_sale
  FROM deleted;
END;


CREATE TRIGGER mod_Product_Archive ON Product
AFTER UPDATE
AS
BEGIN
  DECLARE @Quantity INT;
  SELECT @Quantity = Quantity_of_goods_in_stock FROM deleted;
  IF @Quantity = 0
  BEGIN
    INSERT INTO Archive (
      Name, Type_of_product, Cost_price, Manufacturer, Selling_price
    )
    SELECT
      Name, Type_of_product, Cost_price, Manufacturer, Selling_price
    FROM deleted;
    DELETE FROM Product WHERE Id IN (SELECT Id FROM deleted);
  END;
END;


CREATE TRIGGER ban_Duplicate_Client ON Clients
BEFORE INSERT
AS
BEGIN
  DECLARE @Name NVARCHAR(MAX), @email NVARCHAR(MAX);
  SELECT @Name = Name, @email = email FROM inserted;
  IF EXISTS (SELECT * FROM Clients WHERE Name = @Name AND Email = @Email)
  BEGIN
    ROLLBACK;
    RAISERROR('Клієнт з таким ПІБ та email вже існує.', 16,	
	END;

	CREATE TRIGGER mod_Client_Discount ON Sales
AFTER INSERT
AS
BEGIN
  DECLARE @ClientId int, @TotalSales INT;
  SELECT @ClientId = ClientId, @TotalSales = (SELECT SUM(Value * Quantity) FROM Sales WHERE ClientId = @ClientId)
  IF @TotalSales > 50000
  BEGIN
    UPDATE Clients
    SET Discount_percentage = 15
    WHERE Id = @ClientId;
  END;
END;

CREATE TRIGGER ban_SportSunSh tanga ON Product
BEFORE INSERT
AS
BEGIN
  DECLARE @Name NVARCHAR(MAX)
  SELECT @Name = Name FROM inserted;
  IF @Name LIKE '%Спорт, сонце та штанга%'
  BEGIN
    ROLLBACK;
    RAISERROR('Заборонено додавати товари фірми "Спорт, сонце та штанга"', 16, 1);
  END;
END;

CREATE TRIGGER mod_Last_Unit ON Product
AFTER UPDATE
AS
BEGIN
  DECLARE @Quantity INT;
  SELECT @Quantity = Quantity_of_goods_in_stock FROM deleted;
  IF @Quantity = 1
  BEGIN
    INSERT INTO Last_Unit (
      ProductId, Name, Type_of_product, Selling_price
    )
    SELECT
      Id, Name, Type_of_product, Selling_price
    FROM deleted;
  END;
END;
