CREATE TABLE venue (
  id               serial PRIMARY KEY,
  name             varchar NOT NULL,
  address          varchar NOT NULL,
  venue_type_id    integer REFERENCES venue_type NOT NULL
);
