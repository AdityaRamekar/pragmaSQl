USE SqlAssessment1;

CREATE TABLE TABLEA(
ID VARCHAR(20));

CREATE TABLE TABLEB(
ID VARCHAR(20));

ALTER TABLE TABLEA
ALTER COLUMN ID VARCHAR(20);
INSERT INTO TABLEA VALUES(NULL);
INSERT INTO TABLEA VALUES(NULL);
INSERT INTO TABLEA VALUES(NULL);
INSERT INTO TABLEA VALUES(NULL);
INSERT INTO TABLEA VALUES(NULL);
INSERT INTO TABLEA VALUES(NULL);

ALTER TABLE TABLEB
ALTER COLUMN ID VARCHAR(20);

INSERT INTO TABLEB VALUES(NULL);
INSERT INTO TABLEB VALUES(NULL);
INSERT INTO TABLEB VALUES(NULL);

SELECT * FROM TABLEA;
SELECT * FROM TABLEB;


--1) Using below tables find out the result of inner join ?

SELECT A.ID,B.ID FROM TABLEA A
INNER JOIN TABLEB B ON A.ID = B.ID;

--2)ANS - INNER JOIN, LEFT OUTER JOIN,FULL OUTER JOIN, RIGHT OUTER JOIN 

--3)  Using below Tables Writes SQL Results?

CREATE TABLE TestA(
ID VARCHAR(20));

CREATE TABLE TestB(
ID VARCHAR(20));

INSERT INTO TESTA VALUES
('1'),
('4'),
('5'),
('0'),
('0'),
(NULL),
(NULL),
('1');

SELECT * FROM TESTA;

INSERT INTO TESTB VALUES
('1'),
('8'),
('3'),
('2'),
(NULL),
(NULL);


SELECT * FROM TESTB;

--Q.4 Using Above Both tables, Write SQL query for inner Join, cross join , right outer join , full outer join & left outer join ?

--inner join
SELECT * FROM TestA A
inner join TestB B on A.id = B.id;

--cross join
SELECT * FROM TestA A
cross join TestB ;

--right outer join
SELECT * FROM TestA A
right outer join TestB B on A.id = B.id;

--full outer join
SELECT * FROM TestA A
full outer join TestB B on A.id = B.id;

--left outer join
SELECT * FROM TestA A
left outer join TestB B on A.id = B.id;

--Q.5 Using Above Table “TestA” list the ways to get count of records from table? atleast write 2 SQL query?
--1
SELECT COUNT(*) FROM TestA WHERE ID IS not NULL;--5
--2
SELECT COUNT(ID) AS ID FROM TestA;--5

SELECT COUNT(ID) FROM TestA WHERE ;
--Q.6 Using Above Table “TestA” how can you select unique records from table? write the SQL Query?

SELECT DISTINCT ID FROM TestA;

--Q.7 Using Above Table “TestA” How can you create an empty table from existing table? Write the SQL Syntax?

SELECT * INTO EMPTYTABLE
FROM TestA WHERE 1=2;

--Q8)Using Above Table “TestA”, How to delete ID having value 5 from table? Write the SQL Syntax?

DELETE FROM TestA WHERE ID = '5';

--Q9)Using Above Table “TestA”, Display the duplicate records from table? Write the SQL Syntax?
SELECT * FROM TestA GROUP BY ID HAVING COUNT(ID)>1;

--Q10)Using Above Table “TestB”, Display the ID having values (1,8,3,2) from table? Write the SQL Syntax?

SELECT ID FROM TestB WHERE ID IN (1,8,3,2);

--Q11)Using Above Table “TestB”, Display NULL records from table? Write the SQL Syntax?

SELECT * FROM TestB WHERE ID IS NULL;

--Q12)Using Above Table “TestB”, How to implement multiple conditions using WHERE clause?Write the SQL Syntax? Allow to use AND, OR operators.

SELECT * FROM TestB WHERE ID = 1 OR ID = 8;

SELECT * FROM TestB WHERE ID BETWEEN 0 AND 8 ;

--Q13)Using Above Table “TestB”, Display ID Between 1 To 8 from table? Write the SQL Syntax?

SELECT * FROM TestB WHERE ID BETWEEN 1 AND 8;

--Q14)Using Above Table “TestB”, Remove all records from table? Write the SQL Syntax?

DELETE FROM TestB;

--Q.15 Use table EmployeeDetails and Write Query

CREATE TABLE EmployeeDetails(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(20),
SALARY INT,
REGION VARCHAR(20));

INSERT INTO EmployeeDetails VALUES
(111,'A',24000,'North'),
(222,'C',34000,'North'),
(333,'D',55000,'North'),
(444,'AA',75000,'North'),
(555,'N',21000,'East'),
(666,'G',40000,'East'),
(777,'HHH',50000,'South'),
(888,'FF',70000,'East'),
(999,'H',45000,'East'),
(10000,'R',11000,'South');


select * from employeedetails;


--1.Write SQL Query to get the third maximum salary of an employee from employee table?

SELECT MIN(SALARY) FROM EMPLOYEEDETAILS WHERE SALARY IN (SELECT TOP 3 SALARY FROM EMPLOYEEDETAILS ORDER BY SALARY DESC);

--2.Write SQL Query,to find the names of employees that begin with “A” ?

SELECT EMP_NAME FROM EMPLOYEEDETAILS WHERE EMP_NAME LIKE 'A%';

--3.Identify what is wrong in the below query.

/*SELECT EMP_ID, AVG(SALARY)
FROM EmployeeDetails
WHERE AVG(SALARY) > 75
GROUP BY EMP_ID*/



--ANS -  AGGREGATE AVG CANNOT CONTAIN IN WHERE CLAUSE



--4.Write a query to display the number of employees working in each region?

SELECT COUNT(REGION) FROM EMPLOYEEDETAILS GROUP BY REGION;

--5.Write query to fetch employee ID having salary greater than or equal to 23000?

SELECT EMP_ID FROM EMPLOYEEDETAILS WHERE SALARY >= 23000;
 


