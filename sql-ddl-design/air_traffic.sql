-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic
CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  country_id INT REFERENCES country(id),
  name TEXT NOT NULL
);
CREATE TABLE airline
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE customer
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);
CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customer(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airline(id),
  from_city INT REFERENCES city(id),
  to_city INT REFERENCES city(id)
);


INSERT INTO country
  (name)
VALUES
  ('United States') ,
  ('Japan') ,
  ('United Kingdom') ,
  ('Mexico') ,
  ('France') ,
  ('Morocco') ,
  ('UAE') ,
  ('China') ,
  ('Brazil') ,
  ('Chile');

INSERT INTO city
  (name)
VALUES
  ('Washington DC') ,
  ('Los Angeles') ,
  ('Seattle'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte') ,
  ('Las Vegas') ,
  ('Chicago') ,
  ('New Orleans') ,
  ('Tokyo') ,
  ('London') ,
  ('Mexico City') ,
  ('Paris') ,
  ('Casablanca') ,
  ('Dubai') ,
  ('China') ,
  ('Sao Paolo') ,
  ('Santiago');

INSERT INTO customer
  (first_name , last_name)
VALUES
  ('Waneta' , 'Skeleton') ,
  ('Jennifer' , 'Finch') ,
  ('Alvin'  , 'Leathes') ,
  ('Berkie' , 'Wycliff'),
  ('Thadeus' , 'Gathercoal'),
  ('Cory'   , 'Squibbes'),
  ('Sonja'  , 'Pauley');

INSERT INTO airline
  (name)
VALUES
  ('United'),
  ('Delta') ,
  ('Avianca Brasil'),
  ('Air China') ,
  ('TUI Fly Belgium'),
  ('American Airlines'),
  ('British Airways');



INSERT INTO tickets
  (customer_id, seat, departure, arrival, airline_id, from_city, to_city)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ( '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');