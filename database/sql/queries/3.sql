-- 3. Получить список спортсменов, тренирующихся у некого тренера в
-- целом либо не ниже определенного разряда.

SELECT sportsman.id, sportsman.firstname, sportsman.lastname, sportsman_class.class
  FROM sportsman
  JOIN sportsman_coach
    ON sportsman.id = sportsman_coach.sportsman_id
  JOIN coach
    ON coach.id = sportsman_coach.coach_id
  JOIN sportsman_class
    ON sportsman.id = sportsman_class.sportsman_id
   AND sportsman_class.sport_type_id = coach.sport_type_id
 WHERE coach.id = 8
   AND sportsman_class.class <= '3-й спортивный разряд'


-- sport_venue=> SELECT sportsman.id, sportsman.firstname, sportsman.lastname, sportsman_class.class
-- sport_venue->   FROM sportsman
-- sport_venue->   JOIN sportsman_coach
-- sport_venue->     ON sportsman.id = sportsman_coach.sportsman_id
-- sport_venue->   JOIN coach
-- sport_venue->     ON coach.id = sportsman_coach.coach_id
-- sport_venue->   JOIN sportsman_class
-- sport_venue->     ON sportsman.id = sportsman_class.sportsman_id
-- sport_venue->    AND sportsman_class.sport_type_id = coach.sport_type_id
-- sport_venue->  WHERE coach.id = 8
-- sport_venue->    AND sportsman_class.class <= '3-й спортивный разряд';
--  id | firstname | lastname |              class               
-- ----+-----------+----------+----------------------------------
--  23 | Василий   | Самойлов | Кандидат в мастера спорта России
--  45 | Сидор     | Михеев   | 3-й спортивный разряд
-- (2 rows)


-- Замечание: в данном запросе подразумевается, что мы рассматриваем
-- класс спортсмена только в том виде спорта, в котором он тренируется
-- у указанного тренера. В этом случае спортсмен может иметь и более
-- высокий разряд в другом виде спорта, но это не будет учитываться в запросе.
