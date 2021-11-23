-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE suns (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_around_id INTEGER REFERENCES suns NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies NOT NULL,
  moons TEXT[] 
);

INSERT INTO moons (name)
VALUES 
('The Moon'), ('Phobos'), ('Deimos'), ('Naiad'), ('Thalassa'),
('Despina'), ('Galatea'), ('Larissa'), ('S/2004 N 1'), ('Proteus'), 
('Triton'), ('Nereid'), ('Halimede'), ('Sao'), ('Laomedeia'), ('Psamathe'), ('Neso');

INSERT INTO suns (name)
VALUES 
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxies (name)
VALUES 
('Milky Way');

INSERT INTO planets (name, orbits_around_id, orbital_period_in_years, galaxy_id,
                      moons)
VALUES 
('Earth', 1, 1.00, 1, '{"The Moon"}'),
('Mars', 1, 1.88, 1, '{"Phobos", "Deimos"}'),
('Venus', 1, 0.62, 1, '{}'),
('Neptune', 1, 164.8, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
('Proxima Centauri b', 2, 0.03, 1, '{}'),
('Gliese 876 b', 3, 0.23, 1, '{}');

