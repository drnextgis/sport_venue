CREATE TABLE coach (
  id            serial PRIMARY KEY,
  firstname     varchar NOT NULL,
  lastname      varchar NOT NULL,
  sport_type_id integer REFERENCES sport_type NOT NULL
);
