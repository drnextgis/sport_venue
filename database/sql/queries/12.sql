-- 12. Получить список организаторов соревнований и число проведенных
-- ими соревнований в течение определенного периода времени.

  SELECT organization.id, organization.name, count(competition)
    FROM organization
    JOIN competition
      ON competition.organization_id = organization.id
   WHERE competition.date_start > '2013-01-01'
     AND competition.date_end < '2016-01-01'
GROUP BY organization.id


-- sport_venue=>   SELECT organization.id, organization.name, count(competition)
-- sport_venue->     FROM organization
-- sport_venue->     JOIN competition
-- sport_venue->       ON competition.organization_id = organization.id
-- sport_venue->    WHERE competition.date_start > '2013-01-01'
-- sport_venue->      AND competition.date_end < '2016-01-01'
-- sport_venue-> GROUP BY organization.id;
--  id |               name                | count 
-- ----+-----------------------------------+-------
--   8 | Всероссийская федерация волейбола |     3
--   3 | Российская федерация баскетбола   |     3
--  47 | Федерация хоккея России           |     3
--  48 | Федерация хоккея с мячом России   |     3
--  30 | Федерация тяжёлой атлетики России |     3
--  32 | Российский футбольный союз        |     6
--  49 | Российская шахматная федерация    |     3
--  27 | Федерация тенниса России          |     3
-- (8 rows)
