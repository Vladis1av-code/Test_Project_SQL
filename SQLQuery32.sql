SELECT TOP (1000) [Id]
      ,[Name]
      ,[Rating]
      ,[Year]
  FROM [Academy].[dbo].[Groups]

  --2. ������� ����� ���� �� �� ��������, ��������������, ��
--����� ����, �� ����������, �Group Name� �� �Group Rating�
--��������.
  SELECT *
   ,[Name],[Rating]
   FROM [Academy].[dbo].[Groups]

 --14. ������� ����� ���� 5-�� �����, �� ����� ������� � ������� �� 2 �� 4.
  SELECT 
    [Name]
FROM [Academy].[dbo].[Groups]
WHERE [Year] = 5 AND [Rating] BETWEEN 2 AND 4;
