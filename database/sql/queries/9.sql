-- 9. Получить перечень спортивных клубов и число спортсменов этих
-- клубов, участвовавших в спортивных соревнованиях в течение заданного
-- интервала времени.

  SELECT club.id, club.name, count(sportsman)
    FROM club
    JOIN sportsman
      ON sportsman.club_id = club.id
    JOIN competition_result
      ON competition_result.sportsman_id = sportsman.id
    JOIN competition
      ON competition.id = competition_result.competition_id
   WHERE competition.date_start > '2013-01-01'
     AND competition.date_end < '2015-01-01'
GROUP BY club.id


-- sport_venue=>   SELECT club.id, club.name, count(sportsman)
-- sport_venue->     FROM club
-- sport_venue->     JOIN sportsman
-- sport_venue->       ON sportsman.club_id = club.id
-- sport_venue->     JOIN competition_result
-- sport_venue->       ON competition_result.sportsman_id = sportsman.id
-- sport_venue->     JOIN competition
-- sport_venue->       ON competition.id = competition_result.competition_id
-- sport_venue->    WHERE competition.date_start > '2013-01-01'
-- sport_venue->      AND competition.date_end < '2015-01-01'
-- sport_venue-> GROUP BY club.id;
--  id |      name       | count 
-- ----+-----------------+-------
--   1 | БК «Динамо»     |     1
--   9 | СК «Север»      |     2
--   6 | ХК «Сибсельмаш»‎ |     1
-- (3 rows)
