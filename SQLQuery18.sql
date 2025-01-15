
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1), -- ���������� ������������� ������������
    Username NVARCHAR(100) NOT NULL UNIQUE, -- ����� ������������
    PasswordHash NVARCHAR(256) NOT NULL, -- ��� ������
    Email NVARCHAR(255) NOT NULL UNIQUE, -- Email ������������
    CreatedAt DATETIME DEFAULT GETDATE(), -- ���� �������� ������
    IsActive BIT DEFAULT 1 -- ���� ���������� ������������
);
GO

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1), -- ���������� ������������� ����
    RoleName NVARCHAR(50) NOT NULL UNIQUE -- �������� ���� (��������, Admin, User)
);
GO

CREATE TABLE UserRoles (
    UserRoleID INT PRIMARY KEY IDENTITY(1,1), -- ���������� ������������� �����
    UserID INT NOT NULL, -- ������������� ������������
    RoleID INT NOT NULL, -- ������������� ����
    AssignedAt DATETIME DEFAULT GETDATE(), -- ���� ���������� ����
    FOREIGN KEY (UserID) REFERENCES Users(UserID), -- ����� � �������� �������������
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID) -- ����� � �������� �����
);
GO



