-- 13. Получить перечень спортивных сооружений и даты проведения на
-- них соревнований в течение определенного периода времени.

SELECT venue.id, venue.name, competition.name, competition.date_start, competition.date_end
  FROM venue
  JOIN competition_venue
    ON competition_venue.venue_id = venue.id
  JOIN competition
    ON competition_venue.competition_id = competition.id
 WHERE competition.date_start > '2014-01-01'
   AND competition.date_end < '2015-07-01'


-- sport_venue=> SELECT venue.id, venue.name, competition.name, competition.date_start, competition.date_end
-- sport_venue->   FROM venue
-- sport_venue->   JOIN competition_venue
-- sport_venue->     ON competition_venue.venue_id = venue.id
-- sport_venue->   JOIN competition
-- sport_venue->     ON competition_venue.competition_id = competition.id
-- sport_venue->  WHERE competition.date_start > '2014-01-01'
-- sport_venue->    AND competition.date_end < '2015-07-01';
--  id |       name        |       name        | date_start |  date_end  
-- ----+-------------------+-------------------+------------+------------
--   3 | ЛДС «Сибирь»      | Чемпионат области | 2014-02-06 | 2014-02-12
--   3 | ЛДС «Сибирь»      | Чемпионат России  | 2015-04-13 | 2015-04-18
--   6 | Стадион «Спартак» | Чемпионат области | 2014-03-08 | 2014-03-08
--   1 | Мотодром РОСТО    | Чемпионат области | 2014-12-11 | 2014-12-18
-- (4 rows)
