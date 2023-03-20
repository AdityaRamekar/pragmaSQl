create table students(
id int primary key,
name varchar(20),
marks int);

insert into students values (1,'noman',25);
insert into students values (2,'aman',26);

--before

begin transaction
update students 
set marks = 25 where id = 1;

save transaction m25;

begin transaction
rollback transaction m25;

begin transaction
update students 
set marks = 26 where id = 1;
save transaction m26;

begin transaction
rollback transaction m26;

begin transaction
update students 
set marks = 27 where id = 1;
save transaction m27;

begin transaction
rollback transaction m27;

commit transaction
select @@TRANCOUNT


select * from students;
drop table students;