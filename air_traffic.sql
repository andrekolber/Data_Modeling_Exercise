-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passenger (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL CHECK (length(seat) <= 4)
);

CREATE TABLE city (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE country (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passenger NOT NULL,
  airline_id INTEGER REFERENCES airlines NOT NULL,
  seat_id INTEGER REFERENCES seats NOT NULL,
  from_city_id INTEGER REFERENCES city UNIQUE NOT NULL,
  from_country_id INTEGER REFERENCES country UNIQUE NOT NULL,
  to_city_id INTEGER REFERENCES city UNIQUE NOT NULL,
  to_country_id INTEGER REFERENCES country UNIQUE NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL
);


INSERT INTO passenger (first_name, last_name)
VALUES 
('John', 'Doe');

INSERT INTO seats (seat)
VALUES 
('34A');

INSERT INTO city (name)
VALUES 
('Seoul'),
('Chicago');

INSERT INTO country (name)
VALUES 
('South Korea'),
('United States');

INSERT INTO airlines (name)
VALUES 
('Air Korea');

INSERT INTO tickets (passenger_id, airline_id, seat_id, from_city_id, 
                    from_country_id, to_city_id, to_country_id, departure, arrival)
VALUES
(1, 1, 1, 1, 1, 2, 2, '2021-01-01 12:12:12', '2021-01-01 16:16:16');

