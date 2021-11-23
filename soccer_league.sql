DROP DATABASE IF EXISTS s_league;

CREATE DATABASE s_league;

\c s_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams NOT NULL,
    away_team_id INTEGER REFERENCES teams CHECK (away_team_id != home_team_id) NOT NULL,
    location TEXT NOT NULL,
    date DATE NOT NULL, 
    start_time TEXT,
    season_id INTEGER REFERENCES season NOT NULL,
    referee_id INTEGER REFERENCES referees NOT NULL
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players NOT NULL,
    match_id INTEGER REFERENCES matches NOT NULL,
    team_id INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players NOT NULL,
    match_id INTEGER REFERENCES matches NOT NULL
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams NOT NULL,
    match_id INTEGER REFERENCES matches NOT NULL,
    result TEXT CHECK (result = 'W' OR result = 'L' OR result = 'D') NOT NULL
);

INSERT INTO teams (name, city)
VALUES 
('Thunder', 'Oklahoma City'),
('Warriors', 'San Francisco');

INSERT INTO players (name, team_id)
VALUES 
('Russel Westbrook', 1),
('Kevin Durant', 2);

INSERT INTO referees (name)
VALUES 
('Joe Shmow');

INSERT INTO season (start_date, end_date)
VALUES 
('2021-01-01', '2021-05-31');

INSERT INTO matches (home_team_id, away_team_id, location,
date, start_time, season_id, referee_id)
VALUES 
(1, 2, 'San Francisco', '2021-01-01', '5:30 PM', 1, 1);

INSERT INTO lineups (player_id, match_id, team_id)
VALUES 
(1, 1, 1),
(2,1, 2);

INSERT INTO goals (player_id, match_id)
VALUES 
(1, 1),
(2, 1);

INSERT INTO results (team_id, match_id, result)
VALUES 
(1, 1, 'W');

