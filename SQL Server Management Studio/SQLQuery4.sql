
/*WRITE A QUERY TO DISPLAY ACTORID,ACTORNAME, MOVIENAME,ROLE,GENRE,RATING FOR ALL ACTORS  

WRITE A QUERY TO DISPLAY ACTORID,ACTORNAME, MOVIENAME,ROLE,GENRE,RATING FOR ALL DIRECTORS  

 WRITE A QUERY TO DISPLAY ACTORID,ACTORNAME, MOVIENAME,ROLE,GENRE,RATING FOR ALL ACTORS WHERE RATING IS MORE THAN 5 
 
WRITE A QUERY TO DISPLAY ACTORID,ACTORNAME WHERE AVG RATING IS MORE THAN 5 FOR ALL MOVIES DONE BY HIM*/

use PracMovie;
select * from actor;
select * from movie;
select * from movie_cast;
select * from genres;
select * from rating;

/*UPDATE movie
SET mov_id = 1
WHERE mov_title = 'The Light: Swami Vivekananda';*/

select * from actor 
join movie on actor.act_id = movie.mov_id 
join movie_cast on actor.act_id = movie_cast.movie_id 
join genres on actor.act_id = genres.gen_id 
join rating on actor.act_id = rating.rev_id;

