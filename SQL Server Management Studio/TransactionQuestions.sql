
use school;

select * from empl
/*Give the last names and salaries of employees and their managers whenever the employee earns more than the manager.*/

 select e1.ename as employee,e1.sal , m1.ename as manager ,m1.sal from empl e1
 join empl m1 on e1.empno = m1.deptno where e1.sal > m1.sal;

 /*Give count of such employees*/
select e1.ename as employee,e1.sal from empl e1
join empl e2 on e1.mgr = e2.empno where e1.sal > e2.sal;

 
/*Display employeename,City,Salary where salary is greater than average salary of that city employees*/

select e1.ename from empl e1 where sal > (select avg(sal) as averageSal from empl e2 group by deptno having e1.DEPTNO = e2.DEPTNO)

/*Display employeename,job,Salary where salary is greater than average salary of that same job of the employee*/
select e1.ename,e1.job,e1.sal from empl e1 where sal > (select avg(sal) as averageSal from empl e2 group by e2.job having e1.job = e2.job)

