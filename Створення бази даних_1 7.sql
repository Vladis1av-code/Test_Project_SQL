use [master];
go

if db_id('Academy') is not null
begin
	drop database [Academy];
end
go

create database [Academy];
go

use [Academy];
go

create table [Departments]
(
	[Id] int not null identity(1, 1) primary key,
	[Financing] money not null check ([Financing] >= 0.0),
	[Name] nvarchar(100) not null unique check ([Name] <> N'')
);
go

create table [Faculties]
(
	[Id] int not null identity(1, 1) primary key,
	[Dean] nvarchar(max) not null check ([Dean] <> N''),
	[Name] nvarchar(100) not null unique check ([Name] <> N''),
);
go

create table [Groups]
(
	[Id] int not null identity(1, 1) primary key,
	[Name] nvarchar(10) not null unique check ([Name] <> N''),
	[Rating] float not null check ([Rating] between 0 and 5),
	[Year] int not null check ([Year] between 1 and 5)
);
go

create table [Teachers]
(
	[Id] int not null identity(1, 1) primary key,
	[EmploymentDate] date not null check ([EmploymentDate] >= '1990-01-01'),
	[IsAssistant] bit not null default 0,
	[IsProfessor] bit not null default 0,
	[Name] nvarchar(max) not null check ([Name] <> N''),
	[Position] nvarchar(max) not null check ([Position] <> N''),
	[Premium] money not null check ([Premium] >= 0.0) default 0.0,
	[Salary] money not null check ([Salary] > 0.0),
	[Surname] nvarchar(max) not null check ([Surname] <> N'')
);
go