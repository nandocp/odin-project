-- JOIN and UEFA EURO 2012
-- This tutorial introduces JOIN which allows you to use data from two or more tables.
-- The tables contain all matches and goals from UEFA EURO 2012 Football Championship in Poland and Ukraine.

PROBLEM 1
-- The first example shows the goal scored by a player with the last name 'Bender'.
-- The * says to list all the columns in the table.
SELECT * FROM goal
	WHERE player LIKE '%Bender';
-- Modify it to show the 'matchid' and 'player' name for all goals scored by Germany.
-- To identify German players, check for: "teamid = 'GER'"
SELECT matchid, player FROM goal
	WHERE teamid = 'GER';

PROBLEM 2
-- From the previous query you can see that Lars Bender scored a goal in game 1012.
-- Now we want to know which teams were playing in that match.
SELECT id,stadium,team1,team2 FROM game
	WHERE id = 1012;

PROBLEM 3
-- You can combine two steps into a single query using JOIN.
-- The code below shows the player (from the goal) and stadium name (from game table) for every goal scored.
SELECT player, stadium FROM game JOIN goal
	ON (id = matchid)
-- Modify it to show the player, teamid, stadium and mdate for evey 'German' goal.
SELECT player, teamid, stadium, mdate FROM game JOIN goal ON (id = matchid) 
	WHERE teamid = 'GER';

PROBLEM 4
-- Use the same JOIN as in the previous question.
-- Show team1, team2 and player for every goal scored by a player called Mario.
SELECT team1, team2, player FROM game JOIN goal ON (id = matchid) 
	WHERE player LIKE 'Mario%';

PROBLEM 5
-- The table eteam gives details of every national team including the coach.
-- You can JOIN goal to eteam using the phrase goal JOIN eteam ON eteam=id
-- Show 'player', 'teamid', 'coach', 'gtime' for all goals scored in the first 10 minutes gtime <= 10.
SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON (teamid = id) 
	WHERE gtime <= 10;

PROBLEM 6
-- To JOIN game with eteam you could use either 'game JOIN eteam ON (team1=eteam.id)' or 'game JOIN eteam ON (team2=eteam.id)'.
-- Notice that because id is a column name in both 'game' and 'eteam' you must specify eteam.id instead of just 'id'.
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname FROM game JOIN eteam ON (team1 = eteam.id)
	WHERE coach LIKE 'Fernando Santos';

PROBLEM 7
-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
SELECT player FROM goal JOIN game ON (matchid = id)
	WHERE stadium LIKE 'National Stadium, Warsaw';

PROBLEM 8
-- The example query shows all goals scored in the Germany-Greece quarterfinal.
SELECT player FROM game JOIN goal ON (matchid = id)
	WHERE (team1 = 'GER' AND team2 = 'GRE');
-- Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player FROM game JOIN goal ON (id = matchid)
	WHERE (team1 LIKE 'GER' OR team2 = 'GER') AND teamid != 'GER';

PROBLEM 9
-- Show teamname and the total number of goals scored.
