SELECT TOP (1000) [Id]
      ,[Dean]
      ,[Name]
  FROM [Academy].[dbo].[Faculties]

  --4. ¬ивести таблицю факультет≥в у вигл€д≥ одного пол€ у такому формат≥: УThe dean of faculty [faculty] is [dean].Ф.
  SELECT 
    CONCAT('The dean of faculty ', [Name], ' is ', [Dean], '.') AS '≤нформац≥€ про факультет'
FROM [Academy].[dbo].[Faculties];

--7. ¬ивести назви факультет≥в, окр≥м факультету УComputer
--ScienceФ.
SELECT 
    [Name]
FROM [Academy].[dbo].[Faculties]
WHERE [Name] != 'Computer Science';
