DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;


\c craigslist

CREATE TABLE Users (
  id SERIAL PRIMARY KEY,
  username TEXT,
  pref_region TEXT
);

CREATE TABLE Posts (
  id SERIAL PRIMARY KEY,
  title TEXT,
  text TEXT,
  user_id INTEGER REFERENCES Users ON DELETE SET NULL,
  location TEXT,
  region TEXT
);