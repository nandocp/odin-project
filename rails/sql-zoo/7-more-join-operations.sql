-- More JOIN operaions
-- This tutorial introduces the notion of a join. The db consists of three tables: 'movie', 'actor', and 'casting'.

PROBLEM 1: 1962 movies
-- List the films where the yr is 1962 [Show id, title]
SELECT id, title FROM movie
	WHERE yr = 1962;

PROBLEM 2: When was Citizen Kane released?
-- Give the year of 'Citizen Kane'
SELECT yr FROM movie
	WHERE title LIKE 'Citizen Kane';

PROBLEM 3: Star Trek movies
-- List all of the Star Trek movies.
-- Include the 'id', 'title', and 'yr' (all of the movies include 'Star Trek' in the title)
-- Order results by year.
SELECT id, title, yr FROM movie
	WHERE title LIKE 'Star Trek%'
	ORDER BY yr ASC;

PROBLEM 4: id for actor Glenn Close
-- What 'id'number does the actor 'Glenn Close' have?
SELECT id FROM actor
	WHERE name LIKE 'Glenn Close';

PROBLEM 5: id for Casablanca
-- What is the 'id' of the film 'Casablanca'?
SELECT id FROM movie
	WHERE title LIKE 'Casablanca';

PROBLEM 6: Cast list for Casablanca
-- Obtain the cast list for 'Casablanca'.
-- The following query returns actorid
SELECT actorid FROM casting JOIN movie ON movieid = id
	WHERE movie.title LIKE 'Casablanca';
-- This next one returns actor/tress names.
SELECT actor.name FROM actor JOIN casting ON id = actorid
	WHERE movieid = 11768;

PROBLEM 7: Alien cast list
-- Obtain the cast list for the film 'Alien'.
SELECT actor.name FROM actor JOIN casting ON id = actorid
	WHERE movieid = (SELECT id FROM movie
									 WHERE title LIKE 'Alien');

PROBLEM 8: Harrison Ford movies
-- List the filmes in which 'Harrison Ford' has appeared.
SELECT title FROM movie JOIN casting ON movie.id = casting.movieid
	WHERE actorid LIKE (SELECT id FROM actor
											WHERE name LIKE 'Harrison Ford');

PROBLEM 9: Harrison Ford as supporting actor
-- List the films where 'Harrison Ford' has appeared - but not in the starring role.
-- [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT title FROM movie JOIN casting ON movie.id = casting.movieid
	WHERE ord != 1 AND actorid LIKE (SELECT id FROM  actor
																	 WHERE name LIKE 'Harrison Ford');

PROBLEM 10: Lead actors in 1962 movies
-- List the films together with the leading star for all 1962 films.
-- WTF re leading stars?
SELECT title, name FROM movie INNER JOIN actor ON movie.id = actor.id
	WHERE yr=1962 AND name LIKE (SELECT name FROM actor JOIN casting ON actor.id = actorid
															 WHERE casting.ord = 1);

PROBLEM 11: Busy years for John Travolta
-- Which were the busiest years for 'John Travolta'?
-- Show the year and the number of movies he made each year
-- for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM movie JOIN casting ON movie.id = movieid
         													JOIN actor ON actorid = actor.id
	WHERE name='John Travolta' GROUP BY yr
	HAVING COUNT(title)=(SELECT MAX(c) FROM	(SELECT yr,COUNT(title) AS c FROM movie JOIN casting ON movie.id = movieid
         																																					JOIN actor ON actorid=actor.id
 																					 	WHERE name='John Travolta'
 																						GROUP BY yr) AS t)

PROBLEM 12: Lead actor in Julie Andrews movies
-- List the film title and the leading actor for all of the films 'Julie Andrews' played in.
SELECT title, name FROM movie JOIN casting ON (movieid = movie.id AND ord = 1)
															JOIN actor ON (actorid = actor.id)
	WHERE movie.id IN (SELECT movieid FROM casting
										 WHERE actorid IN (SELECT id FROM actor
										 									 	WHERE name LIKE 'Julie Andrews'))

PROBLEM 13: Actors with 30 leading roles
-- Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles.
SELECT name FROM actor JOIN casting
	ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=30)
GROUP BY name

PROBLEM 14
-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title
SELECT movie.title, COUNT(actorid) AS cast FROM movie JOIN casting ON id = movieid
	WHERE yr = 1978
	GROUP BY title
	GROUP BY cast DESC

PROBLEM 15
-- List all the people who have worked with 'Art Garfunkel'
SELECT DISTINCT name FROM actor JOIN casting ON id = actorid
	WHERE movieid IN (SELECT movieid FROM casting JOIN actor ON (actorid = id AND name = 'Art Garfunkel')) AND name != 'Art Garfunkel'
	GROUP BY name