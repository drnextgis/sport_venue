CREATE TABLE venue_type_attribute (
  id               serial PRIMARY KEY,
  name             varchar NOT NULL,
  venue_type_id    integer REFERENCES venue_type NOT NULL
);
