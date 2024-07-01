
CREATE DATABASE craigslist


\c craigslist;


CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    home_region INTEGER REFERENCES regions
);

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY
    name TEXT NOT NULL
);
CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE CASCADE ,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    category INTEGER REFERENCES categories,
    location TEXT NOT NULL,
    region INTEGER REFERENCES regions
);