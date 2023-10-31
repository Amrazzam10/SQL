USE [HR ]
select* from HR_Analytics 
select count (empid) from HR_Analytics
--num_of_emps_in_dept
select Department, count (empid) as num_of_emps_in_dept
from HR_Analytics
group by Department
--count of Education Field
select EducationField , COUNT (empid) as countofEducationField
from HR_Analytics
group by EducationField

-- count of age group
select AgeGroup , COUNT (empid) as countofagegroup
from HR_Analytics
group by AgeGroup
order by countofagegroup  desc
--- male or famele ?
select gender , COUNT (empid) as numofmaleandfemale
from HR_Analytics
group  by gender
--num of jop role 
select JobRole, count (empid) as numofjoprole
from HR_Analytics
group by JobRole
-- avarge daily rate of JobRole
select JobRole , avg(DailyRate) as avgdailyrate
from HR_Analytics
group by JobRole
order by avgdailyrate desc
--average age of employees in each AgeGroup
SELECT AgeGroup, AVG(Age) AS AvgAge FROM HR_Analytics GROUP BY AgeGroup;
-- 
select MaritalStatus, COUNT (empid) as countofMaritalStatus
from HR_Analytics
group by MaritalStatus
order by countofMaritalStatus desc
---
select BusinessTravel , COUNT (empid) as traveltype
from HR_Analytics
group by BusinessTravel
order by  traveltype desc

--employees who have worked for more than 30 years at the company:
SELECT EmpID , SalarySlab
FROM HR_Analytics
WHERE YearsAtCompany > 30;
--male employees who are married
SELECT count (empid) as maleemployeeswhoaremarried
FROM HR_Analytics
WHERE Gender = 'Male' AND MaritalStatus = 'Married';

--Select employees with the highest hourly rate:
SELECT top (1)*
FROM HR_Analytics
ORDER BY HourlyRate DESC
 ---Select employees who have not experienced attrition:
 SELECT *
FROM HR_Analytics
WHERE Attrition = 'No';
--Select employees who live more than 2 miles from the workplace:
SELECT *
FROM HR_Analytics
WHERE DistanceFromHome <2;
--the Total Monthly Income of All Employees:
SELECT SUM(MonthlyIncome) AS TotalIncome
FROM HR_Analytics;
-- TotalIncome per Gender and  JobRole 
SELECT JobRole,Gender, SUM(MonthlyIncome) AS TotalIncome
FROM HR_Analytics
GROUP BY Gender, JobRole 
order by  TotalIncome desc
--Employee Age Distribution:
SELECT Age, COUNT(*) AS EmployeeCount
FROM HR_Analytics
GROUP BY Age
ORDER BY Age;
-- COUNTofSalarySlab
select SalarySlab, count (empid) as COUNTofSalarySlab
from  HR_Analytics
group by SalarySlab
order by COUNTofSalarySlab desc
-- activemps
select Attrition, count (empid) as Attritiontype
from HR_Analytics 
group by Attrition
--op 5 Highest Monthly Income Earners:
SELECT TOP (5) EmpID, MonthlyIncome
FROM HR_Analytics
ORDER BY MonthlyIncome DESC
-- Average Age of Employees in Each Department
SELECT Department, AVG(Age) AS AvgAge
FROM HR_Analytics
GROUP BY Department;
 --Average Percent Salary Hike by Education Field:
SELECT EducationField, AVG(PercentSalaryHike) AS AvgSalaryHike
FROM HR_Analytics
GROUP BY EducationField;
--Employees Have Worked Overtime 
SELECT EmpID
FROM HR_Analytics
WHERE OverTime = 'YES'
--Employees with the Highest Monthly Income in Each Department
select empid,Department,MonthlyIncome
from HR_Analytics as e
where MonthlyIncome=( select max(MonthlyIncome)
from HR_Analytics
where Department=e.Department 
)
--Employees Who Have Received the Highest Percent Salary Hike
SELECT EmpID, PercentSalaryHike,Department
FROM HR_Analytics
where PercentSalaryHike=( SELECT MAX(PercentSalaryHike)
    FROM HR_Analytics)
-- the List of Employees with the Highest Monthly Income and the Lowest Monthly Incom
SELECT EmpID, MonthlyIncome
FROM HR_Analytics
WHERE MonthlyIncome = (SELECT MAX(MonthlyIncome) FROM HR_Analytics)
UNION
SELECT EmpID, MonthlyIncome
FROM HR_Analytics
WHERE MonthlyIncome = (SELECT MIN(MonthlyIncome) FROM HR_Analytics);
