-- 11. Получить список спортсменов, не участвовавших ни в каких
-- соревнованиях в течение определенного периода времени.

  SELECT sportsman.id, sportsman.firstname, sportsman.lastname
    FROM sportsman
   WHERE sportsman.id
  NOT IN (
    SELECT sportsman.id
      FROM sportsman
      JOIN competition_result
        ON competition_result.sportsman_id = sportsman.id
      JOIN competition
        ON competition.id = competition_result.competition_id
     WHERE competition.date_start > '2013-01-01'
       AND competition.date_end < '2016-01-01')
ORDER BY sportsman.id


-- sport_venue=>   SELECT sportsman.id, sportsman.firstname, sportsman.lastname
-- sport_venue->     FROM sportsman
-- sport_venue->    WHERE sportsman.id
-- sport_venue->   NOT IN (
-- sport_venue(>     SELECT sportsman.id
-- sport_venue(>       FROM sportsman
-- sport_venue(>       JOIN competition_result
-- sport_venue(>         ON competition_result.sportsman_id = sportsman.id
-- sport_venue(>       JOIN competition
-- sport_venue(>         ON competition.id = competition_result.competition_id
-- sport_venue(>      WHERE competition.date_start > '2013-01-01'
-- sport_venue(>        AND competition.date_end < '2016-01-01')
-- sport_venue-> ORDER BY sportsman.id
--  id  |  firstname  |   lastname    
-- -----+-------------+---------------
--    1 | Радован     | Сысоев
--    5 | Стоян       | Мухин
--    6 | Нинель      | Соловьева
--    7 | Федор       | Сорокин
--    8 | Варвара     | Мишина
--    ...
--    (196 rows)
