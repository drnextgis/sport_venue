CREATE OR REPLACE FUNCTION venue_type_is_same(aid int, vid int) RETURNS bool
AS $$
DECLARE
  vtype_attribute_based int;
  vtype_venue_based     int;
BEGIN
  SELECT venue_type_attribute.venue_type_id INTO STRICT vtype_attribute_based
    FROM venue_type_attribute WHERE venue_type_attribute.id = venue_type_is_same.aid;
  SELECT venue.venue_type_id INTO STRICT vtype_venue_based
    FROM venue WHERE venue.id = venue_type_is_same.vid;
  RETURN vtype_attribute_based = vtype_venue_based;
END
$$ LANGUAGE plpgsql;
