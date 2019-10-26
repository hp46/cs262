-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Buildings
DROP TABLE IF EXISTS SaveGame;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp,
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	Score integer,
	Cash integer
	);

CREATE TABLE Property(
	ID integer PRIMARY KEY,
	Name varchar,
	playerID integer REFERENCES Player(ID)
	);

CREATE TABLE Buildings(
	ID  integer PRIMARY KEY,
	BuildType integer,
	PropID integer REFERENCES Property(ID)
	);


CREATE TABLE SaveGame(
	PlayerID integer REFERENCES Player(ID),
	GameID integer REFERENCES Game(ID),
	PropID integer REFERENCES Property(ID)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON Buildings TO PUBLIC;
GRANT SELECT ON SaveGame TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player VALUES (1, 'me@calvin.edu', 'Maker');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 2000.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 1.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 500.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 1500.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 2000.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 150.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 1400.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 300.00);

INSERT INTO Property VALUES (1,'Mediterranean Avenue', 1);
INSERT INTO Property VALUES (2,'Baltic Avenue', 2);
INSERT INTO Property VALUES (3,'Connecticut Avenue, 3');
INSERT INTO Property VALUES (4,'Indiana Avenue', 2);
INSERT INTO Property VALUES (5,'New York Avenue', 1);
INSERT INTO Property VALUES (6,'Calvin University Avenue', 1);

INSERT INTO Buildings VALUES (1, 1, 4);
INSERT INTO Buildings VALUES (2, 2, 1);
INSERT INTO Buildings VALUES (3, 2, 2);
INSERT INTO Buildings VALUES (4, 1, 6);
INSERT INTO Buildings VALUES (5, 1, 4);

INSERT INTO SaveGame VALUES (1, 3, 4);
INSERT INTO SaveGame VALUES (2, 2, 5);

SELECT * FROM Game;
SELECT * FROM Player;
SELECT * FROM Buildings;
SELECT * FROM Property;