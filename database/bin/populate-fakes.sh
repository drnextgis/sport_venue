#!/usr/bin/env bash
cat ../fakes/club.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy club(name) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/sportsman.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy sportsman(firstname, lastname, club_id) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/sport_type.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy sport_type(name) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/coach.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy coach(firstname, lastname, sport_type_id) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/sportsman_class.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy sportsman_class(class, sportsman_id, sport_type_id) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/organization.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy organization(name) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/venue_type.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy venue_type(name) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/venue.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy venue(name, address, venue_type_id) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/sportsman_coach.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy sportsman_coach(sportsman_id, coach_id) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/competition.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy competition(name, organization_id, sport_type_id, date_start, date_end) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/venue_type_attribute.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy venue_type_attribute(name, venue_type_id) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/venue_attribute.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy venue_attribute(attribute_id, venue_id, value) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/competition_venue.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy competition_venue(competition_id, venue_id) FROM stdin with delimiter as ',' CSV HEADER"

cat ../fakes/competition_result.csv | psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -a -c \
"\copy competition_result(competition_id, sportsman_id, place) FROM stdin with delimiter as ',' CSV HEADER"
