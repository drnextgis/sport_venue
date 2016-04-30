CREATE TABLE sportsman (
  id        serial PRIMARY KEY,
  firstname varchar NOT NULL,
  lastname  varchar NOT NULL,
  club_id   integer REFERENCES club
);
