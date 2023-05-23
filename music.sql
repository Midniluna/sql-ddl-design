-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- Artists has artist name, albums_id
-- SONGS has title, artist_id, duration, release date
-- Albums has title, song_id
-- Producers has producer name, song_id


CREATE TABLE Artists (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Songs (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  artist_id INTEGER NOT NULL REFERENCES Artists(id),
  duration_in_seconds INTEGER,
  release_date TEXT NOT NULL
);

CREATE TABLE Albums (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  artist_id INTEGER NOT NULL REFERENCES Artists(id),
  songs_id INTEGER NOT NULL REFERENCES Songs(id)
);

CREATE TABLE Producers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  songs_id INTEGER NOT NULL REFERENCES Songs(id)
);

INSERT INTO Artists
  (name)
VALUES 
  ('Hanson'),
  -- ID of 1
  ('Queen'),
  -- ID of 2
  ('Mariah Cary'),
  -- ID of 3
  ('Boyz II Men'),
  -- ID of 4
  ('Lady Gaga'),
  -- ID of 5
  ('Bradley Cooper'),
  -- ID of 6
  ('Nickelback'),
  -- ID of 7
  ('Jay Z'),
  -- ID of 8
  ('Alicia Keys'),
  -- ID of 9
  ('Katy Perry'),
  -- ID of 10
  ('Juicy J'),
  -- ID of 11
  ('Maroon 5'),
  -- ID of 12
  ('Christina Aguilera'),
  -- ID of 13
  ('Avril Lavigne'),
  -- ID of 14
  ('Destiny s Child');
  -- ID of 15

INSERT INTO Songs 
  (title, artist_id, duration_in_seconds, release_date) 
VALUES 
  ('MMMBOP', '{1}', 238, '04-15-1997'),
  -- ^ ID of 1
  ('Bohemian Rhapsody', '{2}', 355, '10-31-1975'),
  -- ^ ID of 2
  ('One Sweet Day', '{3, 4}', 282, '11-14-1995'),
  -- ^ ID of 3
  ('Shallow', '{5, 6}', 216, '09-27-2018'),
  -- ^ ID of 4
  ('How You Remind Me', '{7}', 223, '08-21-2001'),
  -- ^ ID of 5
  ('New York State of Mind', '{8, 9}', 276, '10-20-2009'),
  -- ^ ID of 6
  ('Dark Horse', '{10, 11}', 215, '12-17-2013'),
  -- ^ ID of 7
  ('Moves Like Jagger', '{12, 13}', 201, '06-21-2011'),
  -- ^ ID of 8
  ('Complicated', '{14}', 244, '05-14-2002'),
  -- ^ ID of 9
  ('Say My Name', '{15}', 240, '11-07-1999');
  -- ^ ID of 10

INSERT INTO Albums
  (title, artist_id, song_id)
VALUES 
  ('Middle of Nowhere', 1, '{1}'),
  ('A Night at the Opera', 2, '{2}'),
  ('Daydream', 3, '{3}'),
  ('A Star is Born', 5, '{4}'),
  ('Silver Side Up', 7, '{5}'),
  ('The Blueprint 3', 8, '{6}'),
  ('Prism', 10, '{7}'),
  ('Hands All Over', 12, '{8}'),
  ('Let Go', 14, '{9}'),
  ('The Writing''s on the Wall', 15, '{10}');

INSERT INTO Producers
  (name, songs_id)
VALUES 
  ('Dust Brothers', 1),
  ('Stephen Lironi', 1),
  ('Roy Thomas Baker', 2),
  ('Walter Afanasieff', 3),
  ('Benjamin Rice', 4),
  ('Rick Parashar', 5),
  ('Al Shux', 6),
  ('Max Martin', 7),
  ('Cirkut', 7),
  ('Shellback', 8),
  ('Benny Blanco', 8),
  ('The Matrix', 9),
  ('Darkchild', 10);
  
-- Okay I had some problems here, Might need a little help on this one. The code essentially isn't functional, I'll need to revise, but I'm going to submit it for now









-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
