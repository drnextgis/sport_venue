-- 1. Получить перечень спортивных сооружений указанного типа в целом
-- или удовлетворяющих заданным характеристикам (например, стадионы,
-- вмещающие не менее указанного числа зрителей).

SELECT venue.id, venue.name, venue_type_attribute.name, venue_attribute.value
  FROM venue
  JOIN venue_type_attribute
    ON venue_type_attribute.venue_type_id = venue.venue_type_id
  JOIN venue_attribute
    ON venue_attribute.attribute_id = venue_type_attribute.id
   AND venue_attribute.venue_id = venue.id
 WHERE venue.venue_type_id = 4
   AND venue_attribute.value::float > 1000
   AND venue_type_attribute.id = 2


-- sport_venue=> SELECT venue.id, venue.name, venue_type_attribute.name, venue_attribute.value
-- sport_venue->   FROM venue
-- sport_venue->   JOIN venue_type_attribute
-- sport_venue->     ON venue_type_attribute.venue_type_id = venue.venue_type_id
-- sport_venue->   JOIN venue_attribute
-- sport_venue->     ON venue_attribute.attribute_id = venue_type_attribute.id
-- sport_venue->    AND venue_attribute.venue_id = venue.id
-- sport_venue->  WHERE venue.venue_type_id = 4
-- sport_venue->    AND venue_attribute.value::float > 1000
-- sport_venue->    AND venue_type_attribute.id = 2;
--  id |     name     |    name     | value 
-- ----+--------------+-------------+-------
--   3 | ЛДС «Сибирь» | Вместимость | 7384
--   2 | ЛДС «Бердск» | Вместимость | 2000
-- (2 rows)
