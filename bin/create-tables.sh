#!/usr/bin/env bash
cat ../sql/create-type-sportsman_class_types.sql \
    ../sql/create-table-venue_type.sql \
    ../sql/create-table-venue.sql \
    ../sql/create-table-venue_type_attribute.sql \
    ../sql/create-table-venue_attribute.sql \
    ../sql/create-table-club.sql \
    ../sql/create-table-sport_type.sql \
    ../sql/create-table-coach.sql \
    ../sql/create-table-organization.sql \
    ../sql/create-table-competition.sql \
    ../sql/create-table-sportsman.sql \
    ../sql/create-table-competition_result.sql \
    ../sql/create-table-competition_venue.sql \
    ../sql/create-table-sportsman_class.sql \
    ../sql/create-table-sportsman_coach.sql | \
    psql -U sport_venue_admin -h 127.0.0.1 -d sport_venue -1 -a -f -

