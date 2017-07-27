-- World Country Profile: Aggregate functions
-- This tutorial is about aggregate functions such as COUNT, SUM and AVG.
-- An aggregate function takes many values and delivers just one value.
-- For example the function SUM would aggregate the values 2, 4 and 5 to deliver the single value 11.
-- By default, the result of a SELECT may contain duplicate rows. They can be removed using DISTINCT keyword.

-- world(name, continent, area, population, gdp)

PROBLEM 1: Total world population
-- Show the total population of the world
SELECT SUM(population)
	FROM world;

PROBLEM 2: List of continents
-- List all the continents - just each one
SELECT DISTINCT continent FROM world;

PROBLEM 3: GDP of Africa
-- Give the total GDP of Africa
SELECT SUM(gdp) FROM world
	WHERE continent = 'Africa';

PROBLEM 4: Count the big countries
-- How many countries have an area of at least 1000000
SELECT COUNT(name) FROM world
	WHERE area >= 1000000;

PROBLEM 5: Baltic states population
-- What is the total population of 'Estonia', 'Latvia', 'Lithuania'
SELECT SUM(population) FROM world
	WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

PROBLEM 6: Counting the countries of each continent
-- For each continent show the number of countries.
SELECT continent, COUNT(name) FROM world
	GROUP BY continent;

PROBLEM 7: Counting big countries in each continent
-- For each continent show the number of countries with population of at least 10 million.
SELECT continent, COUNT(name) FROM world
	WHERE population >= 10000000
	GROUP BY continent;

PROBLEM 8: Counting big continents
-- List the continents that have a total population of at least 100 million.
SELECT continent FROM world
	GROUP BY continent
	HAVING SUM(population) >= 100000000;