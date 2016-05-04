#!/usr/bin/env bash
createuser sport_venue_admin -P -e
createdb -O sport_venue_admin -E=UTF8 -e sport_venue
