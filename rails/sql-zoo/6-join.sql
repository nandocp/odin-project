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
SELECT teamname, COUNT(teamid) FROM eteam JOIN goal ON id = teamid
	GROUP BY teamname;

PROBLEM 10
-- Show the stadium and number of goals scored in each stadium.
SELECT stadium, COUNT(matchid) FROM game JOIN goal ON id = matchid
	GROUP BY stadium;

PROBLEM 11
-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, COUNT(teamid) FROM goal JOIN game ON matchid = id
	WHERE team1 LIKE 'POL' OR team2 LIKE 'POL'
	GROUP BY mdate, matchid;

PROBLEM 12
-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(teamid) FROM goal JOIN game ON matchid = id
	GROUP BY teamid, matchid, mdate
	HAVING teamid LIKE 'GER';

PROBLEM 13
-- List every match with the goals scored by each tem as shown:
-- | mdate | team1 | score1 | team2 | score2 |
-- This will use 'CASE WHEN'.
-- Every goal is listed. If it was a team1 goal, then a 1 appears in score1, otherwise there is a 0.
-- This column can SUM() to get a count of goals scored by team1.
-- Sort result by mdate, matchid, team1 and team2.
SELECT  mdate, 
   			team1, SUM(CASE game.team1 WHEN goal.teamid THEN 1 ELSE 0 END) score1, 
        team2, SUM(CASE game.team2 WHEN goal.teamid THEN 1 ELSE 0 END) score2
	FROM game LEFT JOIN goal ON game.id = goal.matchid
	GROUP BY mdate, matchid, team1, team2;