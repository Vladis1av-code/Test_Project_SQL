CREATE TABLE [Football_Command]
(
[Id] int not null,
[TeamName] nvarchar(50) not null,
[City] nvarchar(50) not null,
[Wins] int null,
[Losses] int null,
[Draw] int null,
[Nation] nvarchar(50) not null
);

CREATE TABLE [Player]
(
[Id_player] int not null,
[full_name_player] nvarchar(85) not null,
[country] nvarchar(50)not null,
[number_player] int not null ,
[position_field] nvarchar(50) not null,
[Team_1] nvarchar(max) not null,
[Team_2] nvarchar(max) not null,
[Match_Team] int not null
);