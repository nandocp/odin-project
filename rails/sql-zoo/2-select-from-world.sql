-- Country Profile
-- In this tutorial you will use the SELECT command on the table 'world'.

PROBLEM 1
-- Observe the result of running the following SQL command to show the name, continent and population of all countries.
SELECT name, continent, population FROM world
-- Results in a truncated table, showing the first 50 results

PROBLEM 2
-- Show the name for the countries that have a population of at least 200 million.
-- There are eight zeros in 200 million.
SELECT name FROM world
	WHERE population >= 200000000;

PROBLEM 3
-- Give the 'name' and the 'per capita GDP' for those countries with a 'population' of at least 200 million.
SELECT name, gdp/population FROM world
	WHERE population >= 200000000;

PROBLEM 4
-- Show the 'name' and 'population' in millions for the countries of the 'continent' 'South America'.
-- Divide the population by 1000000 to get population in millions
SELECT name, population/1000000 FROM world
	WHERE continent='South America';

PROBLEM 5
-- Show the 'name' and 'population' for France, Germany, Italy
SELECT name, population FROM world
	WHERE name IN ('France', 'Germany', 'Italy');

PROBLEM 6
-- Show the countries which have a 'name' that includes the word 'United'
SELECT name FROM world
	WHERE name LIKE 'United%';

PROBLEM 7
-- Two ways to be big: a country is big if it has an area of more than 3 million sq km or
-- it has a population of more than 250 million
-- Show the countries that are big by area or big by population.
-- Show name, population and area
SELECT name, population, area FROM world
	WHERE area >= 3000000 OR population >= 250000000;

PROBLEM 8
-- Exclusive OR (XOR). Show the countries that are big by area or big by population but not both.
-- Show name, population and area.
SELECT name, population, area FROM world
	WHERE area >= 3000000 XOR population >= 250000000;

PROBLEM 9
-- Show the 'name' and 'population' in millions and the GDP in billions for the countries of the continent 'South America'.
-- Use the ROUND function to show the values to two decimal places.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
	WHERE name IN continent='South America';

PROBLEM 10
-- Show the 'name' and per-capita GDP for thpse countries with a GDP of at least one trillion.
-- Round this value to the nearest 1000.
SELECT name, ROUND(gdp/population, -3) FROM world
	WHERE gdp >= 1000000000000;

PROBLEM 11
-- The 'CASE' statement shown is used to substitute 'North America' for 'Caribbean' in the third column.
	 SELECT name, continent,
CASE WHEN continent='Caribbean' THEN 'North America'
		 ELSE continent END
		 FROM world
		WHERE name LIKE 'J%';
-- Show the name - but substitute Australasia for Oceania - for countries beginning with N.
SELECT name, CASE WHEN continent='Oceania' THEN 'Australasia' ELSE continent END
	FROM world
 WHERE name LIKE 'N%';

PROBLEM 12
-- Show the name and the continent - but substitute Eurasia for Europe and Asia; substitue America - for each country in North and South America or Caribbean.
-- Show countries beginning with A or B
SELECT name, CASE WHEN continent='Europe' OR continent='Asia' THEN 'Eurasia' 
						 			WHEN continent='South America' OR continent='North America' OR continent='Caribbean' THEN 'America' 
						 			ELSE continent END 
	FROM world
WHERE name LIKE 'A%' OR name LIKE 'B%';

PROBLEM 13
-- Put the continents right...
-- Oceania becomes Australasia
-- Countries in Eurasia and Turkey go to Europe/Asia
-- Caribbean islands starting with 'B' go to North America, other Caribbean islands go to South America
-- Order by country name in ascending order
-- Test your query using 'WHERE' clause with the following:
--    WHERE tld IN ('.ag','.ba','.bb','.ca','.cn','.nz','.ru','.tr','.uk')
SELECT name, continent, CASE WHEN continent='Oceania' THEN 'Australasia'
														 WHEN continent='Eurasia' OR name='Turkey' THEN 'Europe/Asia'
														 WHEN continent='Caribbean' AND name LIKE 'B%' THEN 'North America'
														 WHEN continent='Caribbean' THEN 'South America'
														 ELSE continent END
	FROM world
WHERE tld IN ('.ag','.ba','.bb','.ca','.cn','.nz','.ru','.tr','.uk')