CREATE TABLE sportsman_class (
  class         sportsman_class_types,
  sportsman_id  integer REFERENCES sportsman NOT NULL,
  sport_type_id integer REFERENCES sport_type NOT NULL,
  CONSTRAINT sportsman_class_pkey PRIMARY KEY (sportsman_id, sport_type_id)
);
