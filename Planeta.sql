USE master;
GO

-- Check if the database 'Planeta_UA' exists
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'Planeta')
BEGIN
    -- Create the database 'Planeta_UA' if it doesn't exist
    CREATE DATABASE [Planeta];
END
GO

-- Use the newly created or existing database 'Planeta_UA'
USE Planeta;
GO

--Create table[Users]
--(
--[Id] int identity(1,1) not null,
--[Name] varchar(50) not null,
--[Surname] varchar(50) not null,
--[Email] nvarchar(max) not null,
--[Password] varchar(35) not null,
--[role] varchar(50) not null,
--primary key(id)
--);

create table [register]
(
id_user int identity(1,1) not null,
login_user varchar(50) not null,
password_user varchar(50)not null
);



insert into register(login_user,password_user) values('admin','admin')

