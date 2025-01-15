SELECT TOP (1000) [Id]
      ,[Dean]
      ,[Name]
  FROM [Academy].[dbo].[Faculties]

  --4. ������� ������� ���������� � ������ ������ ���� � ������ ������: �The dean of faculty [faculty] is [dean].�.
  SELECT 
    CONCAT('The dean of faculty ', [Name], ' is ', [Dean], '.') AS '���������� ��� ���������'
FROM [Academy].[dbo].[Faculties];

--7. ������� ����� ����������, ���� ���������� �Computer
--Science�.
SELECT 
    [Name]
FROM [Academy].[dbo].[Faculties]
WHERE [Name] != 'Computer Science';
