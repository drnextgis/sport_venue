-- 7. Получить список призеров указанного соревнования.

SELECT sportsman.id, sportsman.firstname, sportsman.lastname, place
  FROM sportsman
  JOIN competition_result
    ON competition_result.sportsman_id = sportsman.id
   AND competition_result.place IN (1, 2, 3)
 WHERE competition_result.competition_id = 1

-- sport_venue=> SELECT sportsman.id, sportsman.firstname, sportsman.lastname, place
-- sport_venue->   FROM sportsman
-- sport_venue->   JOIN competition_result
-- sport_venue->     ON competition_result.sportsman_id = sportsman.id
-- sport_venue->    AND competition_result.place IN (1, 2, 3)
-- sport_venue->  WHERE competition_result.competition_id = 1;
--  id | firstname |  lastname   | place 
-- ----+-----------+-------------+-------
--   3 | Порфирий  | Харитонов   |     2
--   4 | Глафира   | Ильина      |     3
--   2 | Ирина     | Виноградова |     1
-- (3 rows)
