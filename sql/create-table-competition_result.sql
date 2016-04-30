CREATE TABLE competition_result (
  id             serial PRIMARY KEY,
  competition_id integer REFERENCES competition NOT NULL,
  sportsman_id   integer REFERENCES sportsman NOT NULL,
  place          integer CHECK (place > 0)
);
