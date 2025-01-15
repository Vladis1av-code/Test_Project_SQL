
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1), -- Уникальный идентификатор пользователя
    Username NVARCHAR(100) NOT NULL UNIQUE, -- Логин пользователя
    PasswordHash NVARCHAR(256) NOT NULL, -- Хеш пароля
    Email NVARCHAR(255) NOT NULL UNIQUE, -- Email пользователя
    CreatedAt DATETIME DEFAULT GETDATE(), -- Дата создания записи
    IsActive BIT DEFAULT 1 -- Флаг активности пользователя
);
GO

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1), -- Уникальный идентификатор роли
    RoleName NVARCHAR(50) NOT NULL UNIQUE -- Название роли (например, Admin, User)
);
GO

CREATE TABLE UserRoles (
    UserRoleID INT PRIMARY KEY IDENTITY(1,1), -- Уникальный идентификатор связи
    UserID INT NOT NULL, -- Идентификатор пользователя
    RoleID INT NOT NULL, -- Идентификатор роли
    AssignedAt DATETIME DEFAULT GETDATE(), -- Дата назначения роли
    FOREIGN KEY (UserID) REFERENCES Users(UserID), -- Связь с таблицей пользователей
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID) -- Связь с таблицей ролей
);
GO



