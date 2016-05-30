-- 5. Получить список тренеров указанного спортсмена.

SELECT coach.id, coach.firstname, coach.lastname
  FROM coach
  JOIN sportsman_coach 
    ON coach.id = sportsman_coach.coach_id
  JOIN sportsman
    ON sportsman.id = sportsman_coach.sportsman_id
 WHERE sportsman.id = 12


-- sport_venue=> SELECT coach.id, coach.firstname, coach.lastname
-- sport_venue->   FROM coach
-- sport_venue->   JOIN sportsman_coach 
-- sport_venue->     ON coach.id = sportsman_coach.coach_id
-- sport_venue->   JOIN sportsman
-- sport_venue->     ON sportsman.id = sportsman_coach.sportsman_id
-- sport_venue->  WHERE sportsman.id = 12;
--  id | firstname | lastname 
-- ----+-----------+----------
--  10 | Никанор   | Савельев
--  11 | Творимир  | Васильев
--   2 | Спиридон  | Бобров
-- (3 rows)
