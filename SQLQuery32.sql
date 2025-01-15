SELECT TOP (1000) [Id]
      ,[Name]
      ,[Rating]
      ,[Year]
  FROM [Academy].[dbo].[Groups]

  --2. ¬ивести назви груп та њх рейтинги, використовуючи, €к
--назви пол≥в, що вивод€тьс€, УGroup NameФ та УGroup RatingФ
--в≥дпов≥дно.
  SELECT *
   ,[Name],[Rating]
   FROM [Academy].[dbo].[Groups]

 --14. ¬ивести назви груп 5-го курсу, €к≥ мають рейтинг у д≥апазон≥ в≥д 2 до 4.
  SELECT 
    [Name]
FROM [Academy].[dbo].[Groups]
WHERE [Year] = 5 AND [Rating] BETWEEN 2 AND 4;
