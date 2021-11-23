DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(15) NOT NULL,
    pref_region INTEGER REFERENCES region
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location TEXT NOT NULL,
    user_id INTEGER REFERENCES users NOT NULL,
    region_id INTEGER REFERENCES region NOT NULL,
    category_id INTEGER REFERENCES categories NOT NULL
);

INSERT INTO region (name)
VALUES
('Northeast'),
('Southeast'),
('Midwest'),
('West'),
('Northwest');

INSERT INTO users (username, password, pref_region)
VALUES
('nct127', 'asdfasdf', 5),
('ENHYPHEN', 'asdasfg', 1),
('TXT', 'assadfasdf', 4);

INSERT INTO categories (name)
VALUES
('Tools'),
('Electronics'),
('Clothes');

INSERT INTO posts (title, text, location, user_id, region_id, category_id)
VALUES
('New PS5 For Sale!', 'Brand new PS5 for sale that has never been opened', 
'Dallas, TX', 1, 2, 2),
('Slightly used drill press for sale', 'Excellent condition drill press
for sale', 'Seattle, WA', 3, 5, 1),
('NEW, UNOPENED, GUCCI X FENDI T-Shirt', 'Limited edition collab shirt for sale',
'Los Angeles, CA', 2, 4, 3);


