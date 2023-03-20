Create table emp(EmpId INTEGER,EmpName VARCHAR(20),ManagerId INTEGER);

INSERT INTO emp VALUES(1,'ADITYA',2033);
INSERT INTO emp VALUES(2,'BALASAHEB',2034);
INSERT INTO emp VALUES(3,'TEJAS',2033);
INSERT INTO emp VALUES(4,'SAURABH',2033);
INSERT INTO emp VALUES(5,'KIRAN',2034);

ALTER TABLE EMP
ALTER COLUMN EmpId int NOT NULL;

ALTER TABLE EMP
ADD PRIMARY KEY (EmpId);

SELECT * FROM EMP;

select department.dept_name,location.location_name from department 
join location on department.location_id = location.location_id;

select empid from emp
UNION
select ManagerId from emp;