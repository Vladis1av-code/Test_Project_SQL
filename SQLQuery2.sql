--[Surname] -> �������
--[Name] -> ��'�
--[Name_Subject] -> �����_���������
--[Name_Groups] -> �����_�����
--[Teachers] -> ���������
--[Subject] -> ����
--[Groups] -> ���������
--[Lectures] -> �����
--[ip_Teachers] -> ���_���������
--[ip_Subject] -> ���_���������
--[ip_Groups] -> ���_�����
--[ip_Lectures] -> ���_�������
--CROSS JOIN-�'������� ������� �� ����.

--1. ������� �� ������ ���� ����� ���������� �� ����
SELECT
g1.Name_Groups AS '��� ������� ',
t1.Name AS '��� �������',t1.Surname AS '������� �������',
g2.Name_Groups AS '�������� ������ 2',
t2.Name AS '��� �������',t2.Surname AS '������� �������'
FROM Teachers t1
CROSS JOIN Groups g1
CROSS JOIN Teachers t2
CROSS JOIN Groups g2
WHERE t2.ip_Teachers!=t1.ip_Teachers


--2. ������� ����� ����������, ���� ������������ ������
--���� �������� ���� ������������ ����������
SELECT
f.Name_Faculties
d.Financing_Departament
FROM Faculties f
JOIN Departament d ON f.ip_Faculties=d.ip_Faculties
WHERE d.Financing_Departament > f.Financing_Faculties;

--3. ������� ������� �������� ���� �� ����� ����, �� ����
--���������.
SELECT
gs.[Surname],
g.[Name_Groups]
FROM GroupsCurators gs
INNER JOIN Groups g ON g.ip_Groups=gs.ip_Groups
INNER JOIN Teachers t ON gs.ip_Teachers=t.ip_Teachers



--4. ������� ����� �� ������� ����������, �� ������� ������
--� ���� �P107�.
SELECT 
[Surname],
[Name]
FROM [Teachers] t
INNER JOIN Subject c ON t.ip_Teachers=c.ip_Teachers
INNER JOIN Groups g ON c.ip_Groups=g.ip_Groups
WHERE g.Name_Groups='P107'

--5. ������� ������� ���������� �� ����� ����������, �� ����
--���� ������� ������.
SELECT
t.[Surname],
f.[Name]
FROM [Teachers] t
INNER JOIN Subject s ON t.ip_Teachers=s.ip_Teachers
INNER JOIN Groups g ON s.ip_Groups=g.ip_Groups
INNER JOIN Departament d ON g.ip_Departament=d.ip_Departament
INNER JOIN Faculties f ON d.ip_Faculties=f.ip_Faculties
--6. ������� ����� ������ �� ����� ����, �� �� ��� ��������.
SELECT 
d.Name_Departament,
g.Name_Groups
FROM [Departments] d
INNER JOIN Groups g ON g.ip_Groups=g.ip_Groups

--7. ������� ����� ��������, �� ���� �������� �Samantha
--�.
SELECT
g.[Name]
FROM [Groups]  g
INNER JOIN Subject c ON  g.ip_Techers=c.ip_Teachers
WHERE c.Teachers='Samantha
Adams'

--8. ������� ����� ������, �� �������� ��������� �Database
--Theory�.
SELECT
Name_Departaments
From Departaments
Where Subject='Database
--Theory'

--9. ������� ����� ����, �� �������� �� ���������� Computer
--Science.
SELECT G.Name
FROM [Groups] G
INNER JOIN [Faculties] F ON G.Id_Faculties=F.Id_Faculties
WHERE F.Name='Computer Science'

--10. ������� ����� ���� 5-�� �����, � ����� ����� ����������,
--�� ���� ���� ��������.
SELECT
g.Name_Groups,
f.Name_Faculties
FROM Groups g
JOIN Faculties f ON g.ip_Faculties=f.ip_Faculties
WHERE g.Subject=5;

--11. ������� ���� ����� ���������� �� ������, �� ���� ������� (����� �������� �� ����), ������� ������� ���� �
--������, �� ��������� � ������� �B103�.
SELECT 
d.Name_Subject,
g.Name_Groups
FROM [Teachers] t
INNER JOIN Subject s ON t.ip_Teachers=s.ip_Teachers
INNER JOIN Groups g ON s.ip_Groups=g.ip_Groups
INNER JOIN Subject d ON s.ip_Subject=d.ip_Subject
WHERE g.Name_Groups='B103'


