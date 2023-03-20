--use DbPractice;

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


