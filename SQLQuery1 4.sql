SELECT TOP (1000) [Id]
      ,[Financing]
      ,[Name]
  FROM [Academy].[dbo].[Departments]

  --1. Вивести таблицю кафедр, але розташувати її поля у зворотному порядку.
  SELECT *
  FROM Departments
  ORDER BY Id DESC;


  --6.Вивести назви кафедр, фонд фінансування яких менший
  --за 11000 або більше 25000.
  SELECT *
  FROM Departments
  WHERE Financing<11000 AND Financing<25000
  ORDER BY Financing DESC;

--12.Вивести назви кафедр, які в алфавітному порядку розміщуються до кафедри “Software Development”. Поле, що виводиться повинно мати назву “Name of Department”.
  SELECT 
    [Name] AS 'Name of Department'
FROM [Academy].[dbo].[Departments]
WHERE [Name] < 'Software Development'
ORDER BY [Name] ASC;