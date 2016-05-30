-- 10. Получить список тренеров по определенному виду спорта.

SELECT coach.id, coach.firstname, coach.lastname, coach.sport_type_id
  FROM coach
 WHERE coach.sport_type_id = 2


-- sport_venue=> SELECT coach.id, coach.firstname, coach.lastname, coach.sport_type_id
-- sport_venue->   FROM coach
-- sport_venue->  WHERE coach.sport_type_id = 2;
--  id | firstname | lastname  | sport_type_id 
-- ----+-----------+-----------+---------------
--   9 | Фотий     | Доронин   |             2
--  10 | Никанор   | Савельев  |             2
--  17 | Станимир  | Никифоров |             2
-- (3 rows)
