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

    --3. ������� ��� ���������� ��� �������, ������� ������ ��
--��������� �� �������� �� ������� ������ �� ���������
--�� �������� (���� ������ �� ��������).
SELECT 
    [Surname],
    (Salary / Premium) * 100 AS '% from Premium',
    (Salary / (Salary + Premium)) * 100 AS '% from Salary'
FROM [Academy].[dbo].[Teachers]
	--5. ������� ������� ����������, �� � ����������� �� ������
    --���� �������� 1050.
	SELECT 
    [Name],
    [Salary]
FROM [Academy].[dbo].[Teachers]
WHERE [Salary] > 1050;
	
	--8. ������� ������� �� ������ ����������, �� �� � �����������.
	SELECT 
    [Name],
    [IsAssistant]
    ,[IsProfessor]
FROM [Academy].[dbo].[Teachers]
WHERE [IsAssistant] != 'Professor';

	--9. ������� �������, ������, ������ �� �������� ���������,
    --� ���� �������� � ������� �� 160 �� 550.
	SELECT 
    [Surname],
    [IsAssistant]
   ,[IsProfessor]
   ,[Salary]
   ,[Premium]
FROM [Academy].[dbo].[Teachers]
WHERE [Premium] BETWEEN 160 AND 550;

	--10. ������� ������� �� ������ ���������.
	SELECT 
	[Surname],
	[IsAssistant],
	[Premium]
	FROM [Academy].[dbo].[Teachers]
	ORDER BY [Premium] ASC
	--11. ������� ������� �� ������ ����������, �� ���� �������
    --�� ������ �� 01.01.2000.
	SELECT 
    [Surname],
    [IsAssistant]
   ,[IsProfessor]
FROM [Academy].[dbo].[Teachers]
WHERE [EmploymentDate] < '2000-01-01';
ORDER BY [Surname] ASC
	--13. ������� ������� ���������, �� ����� �������� (����
    --������ �� ��������) �� ����� 1200.
	SELECT 
    [Surname]
FROM [Academy].[dbo].[Teachers]
WHERE [Salary] + [Premium] <= 1200;
ORDER BY [Surname] ASC
	--15. ������� ������� ��������� � ������� ����� 550 ���
    --��������� ����� 200.
	SELECT 
     [Surname]
FROM [Academy].[dbo].[Teachers]
WHERE (Salary < 550 OR Premium < 200);

