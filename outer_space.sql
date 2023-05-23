-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxy (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE star (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy_id INTEGER NOT NULL,
  star_id INTEGER NOT NULL
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER NOT NULL
);

INSERT INTO galaxy 
  (name)
VALUES
  ('Milky Way');
  -- ^ ID of 1

INSERT INTO star 
  (name)
VALUES 
  ('The Sun'),
  -- ^ ID of 1
  ('Proxima Centauri'),
  -- ^ ID of 2
  ('Gliese 876');
  -- ^ ID of 3

INSERT INTO planets 
  (name, orbital_period_in_years, galaxy_id, star_id)
VALUES 
  ('Earth', 1.00, '1', '1'),
  -- ^ ID of 1
  ('Mars', 1.88, '1', '1'), 
  -- ^ ID of 2
  ('Venus', 0.62, '1', '1'),
  -- ^ ID of 3
  ('Neptune', 164.8, '1', '1'),
  -- ^ ID of 4
  ('Proxima Centauri b', 0.03, '1', '2'),
  -- ^ ID of 5
  ('Gliese 876 b', 0.23, '1', '3');
  -- ^ ID of 6

INSERT INTO moons 
  (name, planet_id)
VALUES 
  ('The Moon', '1'),
  ('Phobos', '2'),
  ('Deimos', '2'),
  ('Naiad', '3'),
  ('Thalassa', '3'),
  ('Despina', '3'),
  ('Galatea', '3'),
  ('Larissa', '3'),
  ('S/2004 N 1', '3'),
  ('Proteus', '3'),
  ('Triton', '3'),
  ('Nereid', '3'),
  ('Halimede', '3'),
  ('Sao', '3'),
  ('Laomedeia', '3'),
  ('Psamathe', '3'),
  ('Neso', '3');
  

-- (( USE CODE BELOW TO SEE EACH PLANET, ITS STAR, AND GALAXY ))

-- SELECT p.id, p.name AS planet_name, s.name AS star, g.name AS galaxy FROM planets p
-- JOIN star s ON s.id = star_id
-- JOIN galaxy g ON g.id = galaxy_id;


--  (( USE CODE BELOW TO SEE EACH MOON, AND ITS CORRESPONDING PLANET ))

-- SELECT m.id, m.name AS moon, p.name AS planet FROM moons m
-- JOIN planets p ON planet_id = p.id;






  ------------------------- OLD CODE --------------------------------

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');