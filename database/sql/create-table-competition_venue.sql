CREATE TABLE competition_venue (
  competition_id integer REFERENCES competition NOT NULL,
  venue_id       integer REFERENCES venue NOT NULL,
  CONSTRAINT competition_venue_pkey PRIMARY KEY (competition_id, venue_id)
);
