CREATE TABLE EmployeeDemographics(
	EmployeeID INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Age INT,
	Gender VARCHAR(50)
)

CREATE TABLE EmployeeSalary 
(EmployeeID INT, 
JobTitle VARCHAR(50), 
Salary INT
)


CREATE TABLE WareHouseEmployeeDemographics(
	EmployeeID INT,
	JobTitle VARCHAR(50), 
	Salary INT
	)

INSERT INTO EmployeeDemographics  VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

INSERT INTO WareHouseEmployeeDemographics VALUES
(1010, 'Salesman', 45000),
(1011, 'Receptionist', 36000),
(1012, 'Salesman', 63000),
(1013, 'Accountant', 47000),
(1014, 'HR', 50000),
(1015, 'Regional Manager', 65000),
(1016, 'Supplier Relations', 41000),
(1017, 'Salesman', 48000),
(1018, 'Accountant', 42000)

SELECT * FROM EmployeeDemographics;

-- INNER JOIN

SELECT * 
FROM EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC;

SELECT JobTitle, AVG(Salary) AS Average_Salary
FROM EmployeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle;


-- FULL OUTER JOIN

SELECT * 
FROM EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


-- LEFT OUTER JOIN OR LEFT JOIN

SELECT * 
FROM EmployeeDemographics
LEFT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


-- RIGHT OUTER JOIN OR RIGHT JOIN

SELECT * 
FROM EmployeeDemographics
RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


-- UPDATE STATEMENT
UPDATE SQLTutorial.dbo.WareHouseEmployeeDemographics SET EmployeeID = 1001 WHERE EmployeeID = 1018
UPDATE SQLTutorial.dbo.WareHouseEmployeeDemographics SET JobTitle = 'Salesman' WHERE EmployeeID = 1001
UPDATE SQLTutorial.dbo.EmployeeSalary SET Salary = 42000 WHERE EmployeeID = 1001

-- UNION

SELECT * FROM SQLTutorial.dbo.EmployeeSalary
UNION
SELECT * FROM SQLTutorial.dbo.WareHouseEmployeeDemographics;


-- UNION ALL

SELECT * FROM SQLTutorial.dbo.EmployeeSalary
UNION ALL
SELECT * FROM SQLTutorial.dbo.WareHouseEmployeeDemographics;


-- CASE STATEMENT

SELECT FirstName, LastName, Age,
	CASE
		WHEN Age > 30 THEN 'Old'
		ELSE 'Young'
	END AS Old_Young			
FROM SQLTutorial.dbo.EmployeeDemographics 
WHERE Age IS NOT NULL
ORDER BY Age;

SELECT FirstName, LastName, Age,
	CASE
		WHEN Age > 30 THEN 'Old'
		WHEN Age BETWEEN 27 AND 30 THEN 'Young'
		ELSE 'Baby'
	END AS Old_Young			
FROM SQLTutorial.dbo.EmployeeDemographics 
WHERE Age IS NOT NULL
ORDER BY Age;


SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary *  .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


-- HAVING CLAUSE

SELECT JobTitle, COUNT(JobTitle)
FROM EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1;


SELECT JobTitle, AVG(Salary) AS Avg_Salary
FROM EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	ON EmployeeDemographics.UPDAEmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary) DESC;


-- UPDATING/DELETING DATA

UPDATE SQLTutorial.dbo.EmployeeDemographics 
SET EmployeeID = 1020
WHERE FirstName = 'Kevin' AND LastName = 'Malone';


DELETE SQLTutorial.dbo.EmployeeDemographics 
WHERE EmployeeID = 1020;


-- ALIASING
SELECT FirstName + ' ' + LastName AS FullName
FROM SQLTutorial.dbo.EmployeeDemographics;

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
	JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID;


-- PARTITION BY
SELECT FirstName, LastName, Gender, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
	JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID;

-- DIFERENCE BETWEEN PARTION BY AND GROUP BY
SELECT FirstName, LastName, Gender, COUNT(Gender)
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
	JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY FirstName, LastName, Gender;

SELECT Gender, COUNT(Gender)
FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
	JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY Gender;
























