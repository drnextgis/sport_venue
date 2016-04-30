CREATE TABLE venue_attribute (
  attribute_id integer REFERENCES venue_type_attribute NOT NULL,
  venue_id     integer REFERENCES venue NOT NULL,
  value        varchar,
  CONSTRAINT venue_attribute_pkey PRIMARY KEY (attribute_id, venue_id)
);
