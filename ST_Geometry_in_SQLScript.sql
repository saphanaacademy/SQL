-- using spatial types and methods in a function
CREATE FUNCTION get_distance (
	IN pointA ST_GEOMETRY, 
	IN pointB ST_GEOMETRY
) 
RETURNS distance DOUBLE AS
BEGIN
      distance = :pointA.ST_Distance(:pointB);
END;

-- using spatial types and methods in a procedure
CREATE PROCEDURE get_distance_display (  
    --IN pt ST_POINT,
	IN pointA ST_GEOMETRY,
	IN pointB ST_GEOMETRY,
	OUT distance  DOUBLE,
	OUT display CLOB
) 
AS
BEGIN
	DECLARE pointADisp VARCHAR(50);
    DECLARE pointBDisp VARCHAR(50);
	distance = get_distance (:pointA, :pointB);
	pointADisp := :pointA.ST_AsEWKT();
	pointBDisp := :pointB.ST_AsWKT();
	display := :pointADisp || ' to ' || :pointBDisp;
END;

-- calling a procedure using spatial type (geometry) data
CALL get_distance_display(   
	pointA   => ST_GeomFromText('Point(7 48)', 0),
	pointB   => ST_GeomFromText('Point(2 55)', 0),
	distance => ?,
	display  => ?
);
