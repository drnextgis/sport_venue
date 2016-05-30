-- 6. Получить перечень соревнований, проведенных в течение заданного
-- периода времени в целом либо указанным организатором.

SELECT c.id, c.name, c.date_start, c.date_end, sport_type.name, organization.name
  FROM competition c
  JOIN sport_type
    ON sport_type.id = c.sport_type_id
  JOIN organization
    ON organization.id = c.organization_id
 WHERE c.date_start > '2014-01-01'
   AND c.date_end < '2016-01-01'
   AND c.organization_id = 3


-- sport_venue=> SELECT c.id, c.name, c.date_start, c.date_end, sport_type.name, organization.name
-- sport_venue->   FROM competition c
-- sport_venue->   JOIN sport_type
-- sport_venue->     ON sport_type.id = c.sport_type_id
-- sport_venue->   JOIN organization
-- sport_venue->     ON organization.id = c.organization_id
-- sport_venue->  WHERE c.date_start > '2014-01-01'
-- sport_venue->    AND c.date_end < '2016-01-01'
-- sport_venue->    AND c.organization_id = 3;
--  id |       name        | date_start |  date_end  |   name    |              name               
-- ----+-------------------+------------+------------+-----------+---------------------------------
--   2 | Чемпионат области | 2014-12-11 | 2014-12-18 | Баскетбол | Российская федерация баскетбола
--   3 | Чемпионат России  | 2015-03-06 | 2015-03-06 | Баскетбол | Российская федерация баскетбола
-- (2 rows)
