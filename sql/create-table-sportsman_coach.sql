CREATE TABLE sportsman_coach (
  sportsman_id integer REFERENCES sportsman NOT NULL,
  coach_id     integer REFERENCES coach NOT NULL,
  CONSTRAINT sportsman_coach_pkey PRIMARY KEY (sportsman_id, coach_id)
);
