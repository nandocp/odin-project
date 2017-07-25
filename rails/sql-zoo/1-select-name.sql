-- Pattern Matching Strings
-- This tutorial uses the LIKE operator to check names. We will be using the SELECT command on the table world

PROBLEM 1
-- You can use WHERE name LIKE 'B%' to find the countries that start with "B".
SELECT name FROM world
	WHERE name LIKE 'B%';
-- The % is a wild-card: it can match any character
-- Find the country that start with 'Y'
SELECT name FROM world
	WHERE name LIKE 'Y%';

PROBLEM 2
-- Find the countries that end with 'y'
SELECT name FROM world
	WHERE name LIKE '%y';

PROBLEM 3
-- Luxembourg has an x - so does one other country. List them both.
-- Find the countries that contain the letter 'x'
SELECT name FROM world
	WHERE name LIKE '%x%';

PROBLEM 4
-- Iceland, Switzerland end with 'land' - but are there others?
-- Find the countrien that end with 'land'
SELECT name FROM world
	WHERE name LIKE '%land';

PROBLEM 5
-- Columbia starts with a 'C' and end with ia - there are two more like this.
-- Find the countries that start with 'C' and end with 'ia'.
SELECT name FROM world
	WHERE name LIKE 'C%ia';

PROBLEM 6
-- Greece has a double 'e' - who has a double 'o'?
SELECT name FROM world
	WHERE name LIKE '%oo%';

PROBLEM 7
-- Bahamas has three 'a' - who else?
-- Find the countries that have three or more a in the name
SELECT name FROM world
	WHERE name LIKE '%a%a%a%'

PROBLEM 8
-- India and Angola have and 'n' as the second character.
-- You can use the underscore as a single character wildcard.
SELECT name FROM world
	WHERE name LIKE '_n%'
ORDER BY name;
-- Find the countries that have 't as the second character
SELECT name FROM world
	WHERE name LIKE '_t%'
ORDER BY name;

PROBLEM 9
-- Lesotho and Moldova both have two 'o' charactr separated by two other characters.
-- Find the countries that have two 'o' characters separated by two others.
SELECT name FROM world
  WHERE name LIKE '%o__o%';
ORDER BY name;

PROBLEM 10
-- Cuba and Togo have four characters names.
-- Find the countries that have exactly four characters
SELECT name FROM world
	WHERE name LIKE '____';

PROBLEM 11
-- The capital of 'Luxembourg' is 'Luxembourg'.
-- Show all the countries where the capital is the same as the name of the country.
SELECT name FROM world
	WHERE name LIKE capital;

PROBLEM 12
-- The capital of 'Mexico' is 'Mexico City'.
-- Show all the countries where the capital has the country together with the word 'City'.
SELECT name FROM world
	WHERE capital LIKE concat(name, 'City');

PROBLEM 13
-- Find the capital and name where the capital includes the name of the country.
SELECT capital, name FROM world
	WHERE capital LIKE concat(name, '%');

PROBLEM 14
-- Find the capital and the name where the capital is an extension of name of the country.
-- You should include 'Mexico City' as it is longer than 'Mexico'.
-- You should NOT include Luxembourg as the capital is the same as the country.
SELECT name, capital FROM world
	WHERE capital LIKE concat(name, '_%');

PROBLEM 15
-- For 'Monaco-Ville' the name is 'Monaco' and the extension is '-Ville'.
-- Show the name and the extension where the capital is an extension of name of the country.
-- REPLACE function can be used
SELECT name, REPLACE(capital, name, '') FROM world
	WHERE capital LIKE concat(name, '_%');