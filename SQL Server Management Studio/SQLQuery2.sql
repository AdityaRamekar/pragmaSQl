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

--Q1)WRITE A QUERY TO DISPLAY ACTORID,ACTORNAME, MOVIENAME,ROLE,GENRE,RATING FOR ALL ACTORS  


select actor.act_fname,actor.act_lname,movie.mov_title,movie_cast.Rolle,genres.gen_title,rating.num_o_ratings from actor 
join movie on actor.act_id = movie.mov_id 
join movie_cast on actor.act_id = movie_cast.movie_id 
join genres on actor.act_id = genres.gen_id 
join rating on actor.act_id = rating.rev_id;

--Q2)WRITE A QUERY TO DISPLAY ACTORID,ACTORNAME, MOVIENAME,ROLE,GENRE,RATING FOR ALL DIRECTORS  

select * from director
join movie on director.dir_id = movie.mov_id 
join movie_cast on director.dir_id = movie_cast.movie_id 
join genres on director.dir_id = genres.gen_id 
join rating on director.dir_id = rating.rev_id;


--Q3)WRITE A QUERY TO DISPLAY ACTORID,ACTORNAME, MOVIENAME,ROLE,GENRE,RATING FOR ALL ACTORS WHERE RATING IS MORE THAN 5 

select actor.act_fname,actor.act_lname,movie.mov_title,movie_cast.Rolle,genres.gen_title,rating.num_o_ratings from actor 
join movie on actor.act_id = movie.mov_id 
join movie_cast on actor.act_id = movie_cast.movie_id 
join genres on actor.act_id = genres.gen_id 
join rating on actor.act_id = rating.rev_id
 where rating.num_o_ratings > 5;
 
--Q4)WRITE A QUERY TO DISPLAY ACTORID,ACTORNAME WHERE AVG RATING IS MORE THAN 5 FOR ALL MOVIES DONE BY HIM*/

select distinct(a.act_id),a.act_fname,a.act_lname from actor a 
join movie_cast mc on a.act_id=mc.act_id where 
(select avg(r.rev_stars) from movie_cast mc 
join movie m on m.mov_id=mc.movie_id join
rating r on r.mov_id=m.mov_id where a.act_id=mc.act_id)>5;