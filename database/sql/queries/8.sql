-- 8. Получить перечень соревнований, проведенных в указанном спортивном
-- сооружении в целом либо по определенному виду спорта.

SELECT c.id, c.name, c.date_start, c.date_end, venue.name
  FROM competition c
  JOIN competition_venue
    ON competition_venue.competition_id = c.id
  JOIN venue
    ON venue.id = competition_venue.venue_id
 WHERE venue.id = 3
   AND c.sport_type_id = 4


-- sport_venue=> SELECT c.id, c.name, c.date_start, c.date_end, venue.name
-- sport_venue->   FROM competition c
-- sport_venue->   JOIN competition_venue
-- sport_venue->     ON competition_venue.competition_id = c.id
-- sport_venue->   JOIN venue
-- sport_venue->     ON venue.id = competition_venue.venue_id
-- sport_venue->  WHERE venue.id = 3
-- sport_venue->    AND c.sport_type_id = 4;
--  id |       name        | date_start |  date_end  |     name     
-- ----+-------------------+------------+------------+--------------
--  10 | Чемпионат города  | 2013-12-11 | 2013-12-17 | ЛДС «Сибирь»
--  11 | Чемпионат области | 2014-02-06 | 2014-02-12 | ЛДС «Сибирь»
--  12 | Чемпионат России  | 2015-04-13 | 2015-04-18 | ЛДС «Сибирь»
-- (3 rows)
