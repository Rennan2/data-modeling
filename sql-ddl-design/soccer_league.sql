DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;


\c soccer_league;


CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
)

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    height INTEGER NOT NULL,
    current_team INTEGER REFERENCES teams,
);

CREATE TABLE referee
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
);
CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    location TEXT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    season_id INTEGER REFERENCES seasons,
    head_ref_id INTEGER REFERENCES referees,
    assistant_ref_1_id INTEGER REFERENCES referees,
    assistant_ref_2_id INTEGER REFERENCES referees
);

