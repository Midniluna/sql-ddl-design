DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;


\c soccer_league

CREATE TABLE "season" (
  "id" INTEGER PRIMARY KEY,
  "start_yr" TEXT,
  "end_yr" TEXT
);

CREATE TABLE "matches" (
  "id" INTEGER PRIMARY KEY,
  "season_id" INTEGER,
  "referee_id" INTEGER,
  "team1_id" INTEGER,
  "team2_id" INTEGER
);

CREATE TABLE "teams" (
  "id" INTEGER PRIMARY KEY,
  "team_name" TEXT
);

CREATE TABLE "players" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "team_id" INTEGER
);

CREATE TABLE "referees" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT
);

CREATE TABLE "goals" (
  "id" INTEGER PRIMARY KEY,
  "match_id" INTEGER,
  "player_id" INTEGER
);

ALTER TABLE "matches" ADD FOREIGN KEY ("team1_id") REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("team2_id") REFERENCES "teams" ("id");

ALTER TABLE "goals" ADD FOREIGN KEY ("match_id") REFERENCES "matches" ("id");

ALTER TABLE "goals" ADD FOREIGN KEY ("player_id") REFERENCES "players" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("season_id") REFERENCES "season" ("id");

ALTER TABLE "players" ADD FOREIGN KEY ("team_id") REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("referee_id") REFERENCES "referees" ("id");
