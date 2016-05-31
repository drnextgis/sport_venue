-- 4. Получить список спортсменов, занимающихся более чем одним видом
-- спорта с указанием этих видов спорта.

SELECT *
FROM (
  SELECT sportsman.id, sportsman.firstname, sportsman.lastname, sport_type.name
    FROM sportsman
    JOIN sportsman_coach
      ON sportsman.id = sportsman_coach.sportsman_id
    JOIN coach
      ON coach.id = sportsman_coach.coach_id
    JOIN sport_type
      ON sport_type.id = coach.sport_type_id
  GROUP BY sportsman.id, sport_type.name) outr
WHERE(
    SELECT COUNT(*) FROM (
  SELECT sportsman.id, count(sport_type)
    FROM sportsman
    JOIN sportsman_coach
      ON sportsman.id = sportsman_coach.sportsman_id
    JOIN coach
      ON coach.id = sportsman_coach.coach_id
    JOIN sport_type
      ON sport_type.id = coach.sport_type_id
   GROUP BY sportsman.id, sport_type.name) inr
         WHERE inr.id = outr.id) > 1
ORDER BY outr.id


-- sport_venue=> SELECT *
-- sport_venue-> FROM (
-- sport_venue(>   SELECT sportsman.id, sportsman.firstname, sportsman.lastname, sport_type.name
-- sport_venue(>     FROM sportsman
-- sport_venue(>     JOIN sportsman_coach
-- sport_venue(>       ON sportsman.id = sportsman_coach.sportsman_id
-- sport_venue(>     JOIN coach
-- sport_venue(>       ON coach.id = sportsman_coach.coach_id
-- sport_venue(>     JOIN sport_type
-- sport_venue(>       ON sport_type.id = coach.sport_type_id
-- sport_venue(>   GROUP BY sportsman.id, sport_type.name) outr
-- sport_venue-> WHERE(
-- sport_venue(>     SELECT COUNT(*) FROM (
-- sport_venue(>   SELECT sportsman.id, count(sport_type)
-- sport_venue(>     FROM sportsman
-- sport_venue(>     JOIN sportsman_coach
-- sport_venue(>       ON sportsman.id = sportsman_coach.sportsman_id
-- sport_venue(>     JOIN coach
-- sport_venue(>       ON coach.id = sportsman_coach.coach_id
-- sport_venue(>     JOIN sport_type
-- sport_venue(>       ON sport_type.id = coach.sport_type_id
-- sport_venue(>    GROUP BY sportsman.id, sport_type.name) inr
-- sport_venue(>          WHERE inr.id = outr.id) > 1
-- sport_venue-> ORDER BY outr.id;
--  id  |  firstname  |   lastname    |       name       
-- -----+-------------+---------------+------------------
--    2 | Ирина       | Виноградова   | Хоккей с мячом
--    2 | Ирина       | Виноградова   | Теннис
--    3 | Порфирий    | Харитонов     | Тяжёлая атлетика
--    3 | Порфирий    | Харитонов     | Баскетбол
--    5 | Стоян       | Мухин         | Хоккей
-- ...
-- (278 rows)
