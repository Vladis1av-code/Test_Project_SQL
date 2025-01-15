SELECT TOP (1000) [Id]
      ,[Financing]
      ,[Name]
  FROM [Academy].[dbo].[Departments]

  --1. ������� ������� ������, ��� ����������� �� ���� � ���������� �������.
  SELECT *
  FROM Departments
  ORDER BY Id DESC;


  --6.������� ����� ������, ���� ������������ ���� ������
  --�� 11000 ��� ����� 25000.
  SELECT *
  FROM Departments
  WHERE Financing<11000 AND Financing<25000
  ORDER BY Financing DESC;

--12.������� ����� ������, �� � ���������� ������� ����������� �� ������� �Software Development�. ����, �� ���������� ������� ���� ����� �Name of Department�.
  SELECT 
    [Name] AS 'Name of Department'
FROM [Academy].[dbo].[Departments]
WHERE [Name] < 'Software Development'
ORDER BY [Name] ASC;