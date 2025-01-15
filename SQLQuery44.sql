SELECT TOP (1000) [Id]
      ,[EmploymentDate]
      ,[IsAssistant]
      ,[IsProfessor]
      ,[Name]
      ,[Position]
      ,[Premium]
      ,[Salary]
      ,[Surname]
  FROM [Academy].[dbo].[Teachers]

    --3. Вивести для викладачів їхнє прізвище, відсоток ставки по
--відношенню до надбавки та відсоток ставки по відношенню
--до зарплати (сума ставки та надбавки).
SELECT 
    [Surname],
    (Salary / Premium) * 100 AS '% from Premium',
    (Salary / (Salary + Premium)) * 100 AS '% from Salary'
FROM [Academy].[dbo].[Teachers]
	--5. Вивести прізвища викладачів, які є професорами та ставка
    --яких перевищує 1050.
	SELECT 
    [Name],
    [Salary]
FROM [Academy].[dbo].[Teachers]
WHERE [Salary] > 1050;
	
	--8. Вивести прізвища та посади викладачів, які не є професорами.
	SELECT 
    [Name],
    [IsAssistant]
    ,[IsProfessor]
FROM [Academy].[dbo].[Teachers]
WHERE [IsAssistant] != 'Professor';

	--9. Вивести прізвища, посади, ставки та надбавки асистентів,
    --у яких надбавка у діапазоні від 160 до 550.
	SELECT 
    [Surname],
    [IsAssistant]
   ,[IsProfessor]
   ,[Salary]
   ,[Premium]
FROM [Academy].[dbo].[Teachers]
WHERE [Premium] BETWEEN 160 AND 550;

	--10. Вивести прізвища та ставки асистентів.
	SELECT 
	[Surname],
	[IsAssistant],
	[Premium]
	FROM [Academy].[dbo].[Teachers]
	ORDER BY [Premium] ASC
	--11. Вивести прізвища та посади викладачів, які були прийняті
    --на роботу до 01.01.2000.
	SELECT 
    [Surname],
    [IsAssistant]
   ,[IsProfessor]
FROM [Academy].[dbo].[Teachers]
WHERE [EmploymentDate] < '2000-01-01';
ORDER BY [Surname] ASC
	--13. Вивести прізвища асистентів, які мають зарплату (сума
    --ставки та надбавки) не більше 1200.
	SELECT 
    [Surname]
FROM [Academy].[dbo].[Teachers]
WHERE [Salary] + [Premium] <= 1200;
ORDER BY [Surname] ASC
	--15. Вивести прізвища асистентів зі ставкою менше 550 або
    --надбавкою менше 200.
	SELECT 
     [Surname]
FROM [Academy].[dbo].[Teachers]
WHERE (Salary < 550 OR Premium < 200);

