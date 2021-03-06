-- Nobel Laureates
-- We continue practicing simple SQL queries on a single table.
-- This tutorial is concerned with a table of Nobel prize winners:
--      nobel(yr, subject, winner)

PROBLEM 1: Winners from 1950
-- Change the query shown so that it displays Nobel prizes for 1950
SELECT * FROM nobel
	WHERE yr = 1950;

PROBLEM 2: 1962 Literature
-- Show who won the 1962 prize for 'Literatue'
SELECT winner FROM nobel
	WHERE subject = 'Literature'
	AND yr = 1962;

PROBLEM 3: Albert Einstein
-- Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject FROM nobel
	WHERE winner='Albert Einstein';

PROBLEM 4: Recent Peace Prizes
-- Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel
	WHERE subject='Peace'
	AND yr >= 2000;

PROBLEM 5: Literature in the 1980s
-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive
SELECT * FROM nobel
	WHERE subject='Literature'
	AND yr >= 1980 AND yr <= 1989;

PROBLEM 6: Only Presidents
-- Show all details of the presidential winners:
-- * Theodore Roosevelt
-- * Woodrow Wilson
-- * Jimmy Carter
-- * Barack Obama
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
 									'Woodrow Wilson',
 									'Jimmy Carter',
 									'Barack Obama');

PROBLEM 7: John
-- Show the winners with first name 'John'
SELECT winner FROM nobel
	WHERE winner LIKE 'John%';

PROBLEM 8: Chemistry and Physics from different years
-- Show the 'Physics' winners for 1980 together with the 'Chemistry' winners for 1984.
SELECT * FROM nobel
	WHERE subject='Physics' AND yr = 1980 OR subject='Chemistry' AND yr = 1984;

PROBLEM 9: Exclude Chemistry and Medics
-- Show the winners for 1980 excluding the Chemistry and Medicine
SELECT * FROM nobel
	WHERE yr = 1980 AND subject NOT LIKE 'Chem%' AND subject NOT LIKE 'Med%';

PROBLEM 10: Early Medicine, Late Literature
-- Show who won a 'Medicine' prize in an early year (before 1910, NOT including 1910),
-- together with winners of a 'Literature' prize in a later year (after 2004, including 2004).
SELECT * FROM nobel
	WHERE subject LIKE 'Med%' AND yr < 1910 OR subject LIKE 'Litera%' AND yr >= 2004;

PROBLEM 11: Umlaut
-- Find all details of the prize won by 'Peter Grünberg'
SELECT * FROM nobel
	WHERE winner LIKE 'Peter Grünberg';

PROBLEM 12: Apostrophe
-- Find all details of the prize won by 'Eugene O'Neill'
SELECT * FROM nobel
	WHERE winner LIKE 'Eugene O\'Neill';

PROBLEM 13: Knights of the realm
-- Knights in order
-- List the winners, year and subject where the winner starts with Sir.
-- Show the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel
	WHERE winner LIKE 'Sir%'
ORDER BY yr DESC; -- ORDER BY winner ASC;

PROBLEM 14: Chemistry and Physics last
-- The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject FROM world
	WHERE yr = 1984
ORDER BY subject IN('Phys%','Chem%'), subject, winner;
-- ORDER BY
-- CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END, subject, wineer;