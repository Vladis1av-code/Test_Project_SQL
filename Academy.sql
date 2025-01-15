USE [Academy]
GO
CREATE TABLE [Groups](
[Id] INT NOT NULL PRIMARY KEY  IDENTITY(1,1) CHECK(LEN(Id)>0),
[Name] nvarchar(10) NOT NULL UNIQUE	 CHECK(LEN(Name)>0),
[Rating] INT NOT NULL CHECK ([Rating]>=0 and [Rating]<=5),
[Year] INT NOT NULL CHECK ([Year]>=1 and [Year]<=5) ,
CONSTRAINT CK_Groups_Rating CHECK([Rating]>=0 and [Rating]<=5),
CONSTRAINT CK_Groups_Year CHECK ([Year]>=1 and [Year]<=5),
CONSTRAINT CK_Groups_Name CHECK(LEN(Name)>0),
CONSTRAINT CK_Groups_Id  CHECK(LEN(Id)>0),
);


CREATE TABLE [Departments](
[ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
[Financing] MONEY NOT NULL CHECK(Financing>=0 and 0<Financing),
[Name] NVARCHAR(100) NOT NULL UNIQUE CHECK(LEN(NAME)>0),
CONSTRAINT CK_Teachers_Financing CHECK(Financing>=0 and 0<Financing),
CONSTRAINT CK_Teachers_Name CHECK(LEN(NAME)>0),
);


CREATE TABLE [Faculties](
[ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
[Name] NVARCHAR(100) NOT NULL UNIQUE CHECK(LEN(NAME)>0),
CONSTRAINT CK_Teachers_Name CHECK(LEN(NAME)>0),
);


CREATE TABLE [Teachers](
[ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
[EmploymentDate] date NOT NULL CHECK([EmploymentDate]>'01-01-1990'),
[Name] nvarchar(max) NOT NULL CHECK(LEN(Name)> 0),
[Premium] MONEY NOT NULL CHECK(0<Premium) DEFAULT(0) ,
[Salary] MONEY NOT NULL CHECK(Salary>=0 and 0<Salary),
[Surname] NVARCHAR(MAX) NOT NULL CHECK(LEN(Surname)>0),
CONSTRAINT CK_Teachers_EmploymentDate CHECK([EmploymentDate]<'01-01-1990'),
CONSTRAINT CK_Teachers_Premium CHECK(0<Premium),
CONSTRAINT CK_Teachers_Salary CHECK(Salary>=0 and 0<Salary),
CONSTRAINT CK_Teachers_Surname CHECK(LEN(Surname)>0),

)
