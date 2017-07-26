-- This tutorial looks at how we can use SELECT statements within SELECT statements to perform more complex queries.

PROBLEM 1
-- List each country name where the population is larger than that of 'Russia'.
-- world(name, continent, area, population, gdp)
SELECT name FROM world
	WHERE population > (SELECT population FROM world 
											WHERE name = 'Russia');

PROBLEM 2
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
	WHERE continent = 'Europe' 
		AND gdp/population > (SELECT gdp/population FROM world
													WHERE name = 'United Kingdom');

PROBLEM 3
-- List the names and continent of countries in the continents containing either Argentina or Australia.
-- Order by name of the country.
SELECT name, continent FROM world
	WHERE continent = (SELECT continent FROM world
											WHERE name = 'Argentina') 
		 OR continent = (SELECT continent FROM world 
		 									WHERE name = 'Australia');
ORDER BY name ASC;

PROBLEM 4
-- Which country has a population that is more than Canada but less than Poland?
-- Show the name and the population.
SELECT name, population FROM world
	WHERE population > (SELECT population FROM world
											WHERE name = 'Canada')
		 AND population < (SELECT population FROM world
		 									 WHERE name = 'Poland');

PROBLEM 5
-- Germany (population 80 million) has the largest population of the countries in Europe.
-- Austria (population 8.5 million) has 11% of the population of Germany.
-- Show the name and the population of each country in Europe.
-- Show the population as a percentage os the population of Germany.
-- I disagree with the answer from the SQLZoo folks, so I let mine.
SELECT name, CONCAT(ROUND((population/80000000)*100, 1), '%') FROM world
	WHERE continent = 'Europe';

PROBLEM 6
-- Which countries have a GDP higher than every country in Europe?
-- [Give the name only]
-- (Some countries may have NULL gdp values).
SELECT name FROM world
	WHERE gdp > ALL(SELECT gdp FROM world
									WHERE continent='Europe' AND gdp > 0);

-- We can refer to values in the outer SELECT within the inner SELECT.
-- We can name the tables so that we can tell the difference between the inner and outer versions.

PROBLEM 7
-- Find the largest country (by area) in each continent, show the continent, the name, and the area.
SELECT continent, name, area FROM world x
  WHERE area >= ALL(SELECT area FROM world y
        						WHERE y.continent = x.continent
          					AND area > 0);

PROBLEM 8
-- List each continent and the name of the country that comes first alphabetically.
SELECT continent, name FROM world x
	WHERE name = (SELECT name FROM world y
								WHERE x.continent = y.continent
								ORDER BY name ASC
								LIMIT 1)

PROBLEM 9
-- Find the continents where all countries have a population <= 250000000.
-- Then find the names of the countries associated with these continents.
-- Show name, continent and population.
SELECT name, continent, population FROM world x
	WHERE 250000000 > ALL (SELECT population FROM world
												 WHERE x.continent = continent);

PROBLEM 10
-- Some countrie have populations more than three times that of any of their neighbours (in the same continent).
-- Give the countries and continents.
SELECT name, continent FROM world x
	WHERE population > ALL(SELECT population*3 FROM world y
												 WHERE x.continent = y.continent 
												 AND population > 0
												 AND y.name != x.name)