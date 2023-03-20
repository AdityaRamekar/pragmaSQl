CREATE TABLE movie(mov_id INTEGER PRIMARY KEY,mov_title CHAR(50),mov_year INTEGER,mov_time INTEGER,mov_lang CHAR(50),mov_dt_rel DATE,mov_rel_country CHAR(5));
CREATE TABLE director(dir_id INTEGER PRIMARY KEY,dir_fname CHAR(20),dir_lname CHAR(20));
CREATE TABLE actor(act_id INTEGER PRIMARY KEY,act_fname CHAR(20),act_lname CHAR(20),act_gender CHAR(1));
CREATE TABLE reviewer(rev_id INTEGER PRIMARY KEY,rev_name CHAR(30));
CREATE TABLE genres(gen_id INTEGER PRIMARY KEY,gen_title CHAR(20));
CREATE TABLE movie_direction(dir_id INTEGER FOREIGN KEY REFERENCES DIRECTOR,mov_id INTEGER FOREIGN KEY REFERENCES movie );
CREATE TABLE movie_cast(act_id INTEGER FOREIGN KEY REFERENCES actor,movie_id INTEGER FOREIGN KEY REFERENCES movie,Rolle CHAR(30));
CREATE TABLE movie_genres(mov_id INTEGER FOREIGN KEY REFERENCES movie,gen_id integer);
CREATE TABLE rating(mov_id INTEGER FOREIGN KEY REFERENCES movie,rev_id INTEGER FOREIGN KEY REFERENCES reviewer,rev_stars INTEGER,num_o_ratings INTEGER);

SELECT * FROM information_schema.tables;

INSERT INTO movie values (1,'The Light: Swami Vivekananda',2013,2,'hindi','2013-02-01','India');
INSERT INTO movie values (2,'Tanhaji: The Unsung Warrior',2020,2.15,'hindi','2013-1-10','India');
INSERT INTO movie values (3,'Hera Pheri',2000,2.36,'hindi','2000-3-31','India');

INSERT INTO actor VALUES (1,'J. Misra Ashok',' Ranjan Chakraborty','M');
INSERT INTO actor VALUES (2,'Ajay','Devgan','M');
INSERT INTO actor VALUES (3,'Akshay','Kumar','M');

INSERT INTO director VALUES (1,'Utpa','Sinha');
INSERT INTO director VALUES (2,'Om','Raut');
INSERT INTO director VALUES (3,'Priyadarshan','');

INSERT INTO movie_direction VALUES (1,1);
INSERT INTO movie_direction VALUES (2,2);
INSERT INTO movie_direction VALUES (3,3);

INSERT INTO movie_cast(act_id,movie_id,Rolle) VALUES (1,1,'hero');
INSERT INTO movie_cast(act_id,movie_id,Rolle) VALUES (2,2,'hero');
INSERT INTO movie_cast(act_id,movie_id,Rolle) VALUES (3,3,'gambler');

INSERT INTO reviewer VALUES (1,'Aditya');
INSERT INTO reviewer VALUES (2,'Saheb');
INSERT INTO reviewer VALUES (3,'Tejas');

INSERT INTO genres VALUES (1,'Leadership');
INSERT INTO genres VALUES (2,'Kranti');
INSERT INTO genres VALUES (3,'Gambling');


INSERT INTO movie_genres VALUES (1,1);
INSERT INTO  movie_genres VALUES (2,2);
INSERT INTO  movie_genres VALUES (3,3);

INSERT INTO rating VALUES (1,1,4,8.8);
INSERT INTO rating VALUES (2,2,3.5,7.5);
INSERT INTO rating VALUES (3,3,4,8.1);

----------------------------Date:- 14-03-2023---------------------------
insert into movie values(4,'The women',2008,2,'English','2008-09-04','US');

insert into actor values(4,'Meg','Ryan','F');	
insert into actor values(5,'Annette','Bening','F');
insert into actor values(6,'Eva','Mendes','F');
insert into actor values(7,'Debra','Messing','F');

insert into director values(4,'Diane', 'English');

insert into movie_direction values(4,4);

insert into movie_cast values(4,4,'Mary Haines');
insert into movie_cast values(5,4,'Sylvie Fowler');
insert into movie_cast values(6,4,'Crystal Allen');
insert into movie_cast values(7,4,'Edie Cohen');

insert into reviewer values(4,'idbm');

insert into genres values(4,'1936 play');

insert into movie_genres values(4,4);

insert into rating values(4,4,2.4,5);

--1)Find the films with more women actors than men.
--'The Women' 
/*select movie.mov_title from movie;
select  movie.mov_title,actor.act_fname,actor.act_lname from movie  
join movie_cast on (movie.mov_id = movie_cast.movie_id)
join actor on actor.act_id = movie_cast.act_id
where (select count(act_gender) from actor where act_gender = 'F') > (select count(act_gender) from actor where act_gender = 'M');
*/

select mov_title from movie m 
join movie_cast mc on m.mov_id=mc.movie_id
join actor a on a.act_id = mc.act_id where(select count(*) from actor a1
join movie_cast mc1 on a1.act_id=mc1.act_id 
where m.mov_id=mc1.movie_id and a1.act_gender='M')<(select count(*) from actor a1 
				join movie_cast mc1 on a1.act_id=mc1.act_id where m.mov_id=mc1.movie_id and a1.act_gender='F')
			

--2)List first name and last name of all the actors who played in the movie 'RRR' (2023)' *** Please add the record of RRR in yesterday's database
-- Alluri Sitarama Raju (Charan) and Komaram Bheem (NTR Jr) join forces in 1920 to fight the colonialists. Ajay Devgn, Alia Bhatt, Shriya Saran, Samuthirakani, Ray Stevenson, Alison Doody, and Olivia Morris also form the cast of RRR.
insert into movie values(5,'RRR',2023,2,'hindi','2022-3-25','India');
insert into actor values(8,'Alluri Sitarama','Raju','M');
insert into actor values(9,'Komaram','Bheem','M');
insert into actor values(10,'Aliya','Bhatt','F');
insert into movie_cast values(8,5,'Mary');


SELECT act_fname,act_lname from actor 
join movie_cast on movie_cast.act_id = actor.act_id
join movie on  movie.mov_id = movie_cast.movie_id
where movie.mov_title = 'RRR';

--3) List all the actors who acted in at least one film in 2nd half of the 19th century and in at least one film in the 1st half of the 20th century

insert into movie values(6,'Sant Janabai',1949,1.8,'Marathi','1949-3-25','India');
insert into actor values(11,'Hansa','Wadkar','F');
insert into movie_cast values(11,6,'devotee');

select * from movie;

select actor.act_fname,actor.act_lname from actor
join movie_cast on movie_cast.act_id = actor.act_id 
join movie on movie.mov_id = movie_cast.movie_id
where movie.mov_year between 1851 and 1950;

--4) List all the directors who directed a film in a leap year
--The Passion of the Christ,The Aviator

select director.dir_fname,director.dir_lname from director
join movie_direction on movie_direction.dir_id  = director.dir_id
join movie on movie_direction.mov_id  = movie.mov_id
where ((movie.mov_year % 400 = 0) and (movie.mov_year % 100 = 0)) or (movie.mov_year % 4 = 0);

insert into movie values(7,'Unknown',1900,1.8,'Hindi','1900-3-23','India');
insert into director values(5,'unknown','unknown');
insert into movie_direction values(5,7);
Select * from movie;
Select * from director;
Select * from actor;
select * from movie_cast;

-------------------------------------
/*
For every pair of male and female actors that appear together in some film, find the total number of films in which they appear together. Sort the answers in decreasing order of the total number of films.
*/
INSERT INTO movie VALUES(8,'Bahubali',2015,1.9,'Telgu','2015-07-10','India');
INSERT INTO movie VALUES(9,'Sholey',1975,1.7,'Hindi','1975-08-15','India');
INSERT INTO movie VALUES(10,'Dilwale Dulhaniya Le Jayenge',1995,2,'Hindi','1995-10-20','India');

INSERT INTO actor VALUES(12,'Prabhas','','M');
INSERT INTO actor VALUES(13,'Anushka','Shetty','F');
INSERT INTO actor VALUES(14,'Dharmendra','Singh','M');
INSERT INTO actor VALUES(15,'Hema','Malini','F');
INSERT INTO actor VALUES(16,'Shahrukh','khan','M');
INSERT INTO actor VALUES(17,'Kajol','','F');

INSERT INTO movie_cast VALUES(12,8,'hero');
INSERT INTO movie_cast VALUES(13,8,'hero');
INSERT INTO movie_cast VALUES(14,9,'hero');
INSERT INTO movie_cast VALUES(15,9,'hero');
INSERT INTO movie_cast VALUES(16,10,'hero');
INSERT INTO movie_cast VALUES(17,10,'hero');

UPDATE movie_cast 
SET Rolle = 'heroine'
WHERE act_id = 17;

INSERT INTO movie VALUES(11,'Bahubali 2',2019,1.9,'Telgu','2019-07-10','India');
INSERT INTO movie_cast VALUES(12,11,'hero');
INSERT INTO movie_cast VALUES(13,11,'heroine');


-----------Functions - Scalar Valued-------------
CREATE FUNCTION scalar(@VAL as integer)
RETURNS INTEGER
AS 
BEGIN
	RETURN @VAL*16
END;

SELECT dbo.scalar(108);

-----------Functions - Table Valued-------------

