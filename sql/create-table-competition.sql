CREATE TABLE competition (
  id              serial  PRIMARY KEY,
  name            varchar NOT NULL,
  organization_id integer REFERENCES organization NOT NULL,
  sport_type_id   integer REFERENCES sport_type NOT NULL,
  date_start      date    NOT NULL,
  date_end        date    NOT NULL
);
