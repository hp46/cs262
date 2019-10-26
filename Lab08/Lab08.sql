--8.1--

--a-- 
SELECT * 
FROM Game
ORDER BY time DESC;

--b--
SELECT * 
FROM Game
WHERE time >= NOW() - INTERVAL '1 week';

--c--
SELECT Name
FROM Player
WHERE Name is not NULL;

--d--
SELECT id
FROM Player, PlayerGame
WHERE score > 2000;

--e--
SELECT name
FROM Player
WHERE emailaddress
LIKE '%gmail%';


--8.2--
--a--
SELECT name, score
FROM Player, PlayerGame
WHERE name LIKE '%The King%' 
ORDER BY score DESC;

SELECT name, game
FROM Player, Game, PlayerGame
WHERE Player.ID = PlayerGame.playerID
AND Game.ID = PlayerGame.gameID
AND Game.time = '2006-06-28 13:20:00'
ORDER BY score DESC
LIMIT 1;

--c--
SELECT P1.name
FROM Player AS P1, Player AS P2
WHERE P1.name = p2.name
AND P1.ID < P2.ID; -- make sure that the same player doesnt hav ethe same ID

--d--
-- An realistic situation in which you would want to join a table to itself
-- is if there is a table of employees where mangerID is a foreignkey to employeeID on the same table.