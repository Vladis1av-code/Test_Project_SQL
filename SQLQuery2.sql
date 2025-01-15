--[Surname] -> прізвище
--[Name] -> ім'я
--[Name_Subject] -> назва_дисципліни
--[Name_Groups] -> назва_групи
--[Teachers] -> викладачі
--[Subject] -> читає
--[Groups] -> дисципліни
--[Lectures] -> групи
--[ip_Teachers] -> код_викладача
--[ip_Subject] -> код_дисципліни
--[ip_Groups] -> код_групи
--[ip_Lectures] -> код_аудиторії
--CROSS JOIN-з'єднання таблиць та груп.

--1. Вивести всі можливі пари рядків викладачів та груп
SELECT
g1.Name_Groups AS 'Имя учителя ',
t1.Name AS 'Имя учителя',t1.Surname AS 'фамилия учителя',
g2.Name_Groups AS 'Название группы 2',
t2.Name AS 'Имя учителя',t2.Surname AS 'Фамилия учителя'
FROM Teachers t1
CROSS JOIN Groups g1
CROSS JOIN Teachers t2
CROSS JOIN Groups g2
WHERE t2.ip_Teachers!=t1.ip_Teachers


--2. Вивести назви факультетів, фонд фінансування кафедр
--яких перевищує фонд фінансування факультету
SELECT
f.Name_Faculties
d.Financing_Departament
FROM Faculties f
JOIN Departament d ON f.ip_Faculties=d.ip_Faculties
WHERE d.Financing_Departament > f.Financing_Faculties;

--3. Вивести прізвища кураторів груп та назви груп, які вони
--курирують.
SELECT
gs.[Surname],
g.[Name_Groups]
FROM GroupsCurators gs
INNER JOIN Groups g ON g.ip_Groups=gs.ip_Groups
INNER JOIN Teachers t ON gs.ip_Teachers=t.ip_Teachers



--4. Вивести імена та прізвища викладачів, які читають лекції
--у групі “P107”.
SELECT 
[Surname],
[Name]
FROM [Teachers] t
INNER JOIN Subject c ON t.ip_Teachers=c.ip_Teachers
INNER JOIN Groups g ON c.ip_Groups=g.ip_Groups
WHERE g.Name_Groups='P107'

--5. Вивести прізвища викладачів та назви факультетів, на яких
--вони читають лекції.
SELECT
t.[Surname],
f.[Name]
FROM [Teachers] t
INNER JOIN Subject s ON t.ip_Teachers=s.ip_Teachers
INNER JOIN Groups g ON s.ip_Groups=g.ip_Groups
INNER JOIN Departament d ON g.ip_Departament=d.ip_Departament
INNER JOIN Faculties f ON d.ip_Faculties=f.ip_Faculties
--6. Вивести назви кафедр та назви груп, які до них належать.
SELECT 
d.Name_Departament,
g.Name_Groups
FROM [Departments] d
INNER JOIN Groups g ON g.ip_Groups=g.ip_Groups

--7. Вивести назви дисциплін, які читає викладач “Samantha
--”.
SELECT
g.[Name]
FROM [Groups]  g
INNER JOIN Subject c ON  g.ip_Techers=c.ip_Teachers
WHERE c.Teachers='Samantha
Adams'

--8. Вивести назви кафедр, де читається дисципліна “Database
--Theory”.
SELECT
Name_Departaments
From Departaments
Where Subject='Database
--Theory'

--9. Вивести назви груп, що належать до факультету Computer
--Science.
SELECT G.Name
FROM [Groups] G
INNER JOIN [Faculties] F ON G.Id_Faculties=F.Id_Faculties
WHERE F.Name='Computer Science'

--10. Вивести назви груп 5-го курсу, а також назву факультетів,
--до яких вони належать.
SELECT
g.Name_Groups,
f.Name_Faculties
FROM Groups g
JOIN Faculties f ON g.ip_Faculties=f.ip_Faculties
WHERE g.Subject=5;

--11. Вивести повні імена викладачів та лекції, які вони читають (назви дисциплін та груп), причому відібрати лише ті
--лекції, що читаються в аудиторії “B103”.
SELECT 
d.Name_Subject,
g.Name_Groups
FROM [Teachers] t
INNER JOIN Subject s ON t.ip_Teachers=s.ip_Teachers
INNER JOIN Groups g ON s.ip_Groups=g.ip_Groups
INNER JOIN Subject d ON s.ip_Subject=d.ip_Subject
WHERE g.Name_Groups='B103'


