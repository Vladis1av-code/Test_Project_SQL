SELECT TOP (1000) [Id]
      ,[Name]
      ,[Salary]
      ,[Surname]
  FROM [Academy_3].[dbo].[Teachers]

  --1. Вивести всі можливі пари рядків викладачів та груп.
 SELECT [Name]
 [Groups],
 [Name]
FROM [Academy_3].[dbo].[Teachers]


  --4. Вивести імена та прізвища викладачів, які читають лекції
--у групі “P107”.
 
 SELECT 
 [Name],
 [Surname]
 FROM [Academy_3].[dbo].[Teachers]
 WHERE [Groups]='P107'
 



--5. Вивести прізвища викладачів та назви факультетів, на яких
--вони читають лекції.
SELECT
[Name]
FROM [Teachers] 



--11. Вивести повні імена викладачів та лекції, які вони читають (назви дисциплін та груп), причому відібрати лише ті
--лекції, що читаються в аудиторії “B103”.
SELECT 
[Name],
[Surname]
FROM [Teachers] 