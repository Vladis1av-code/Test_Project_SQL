SELECT TOP (1000) [Id]
      ,[Name]
      ,[Salary]
      ,[Surname]
  FROM [Academy_3].[dbo].[Teachers]

  --1. ������� �� ������ ���� ����� ���������� �� ����.
 SELECT [Name]
 [Groups],
 [Name]
FROM [Academy_3].[dbo].[Teachers]


  --4. ������� ����� �� ������� ����������, �� ������� ������
--� ���� �P107�.
 
 SELECT 
 [Name],
 [Surname]
 FROM [Academy_3].[dbo].[Teachers]
 WHERE [Groups]='P107'
 



--5. ������� ������� ���������� �� ����� ����������, �� ����
--���� ������� ������.
SELECT
[Name]
FROM [Teachers] 



--11. ������� ���� ����� ���������� �� ������, �� ���� ������� (����� �������� �� ����), ������� ������� ���� �
--������, �� ��������� � ������� �B103�.
SELECT 
[Name],
[Surname]
FROM [Teachers] 