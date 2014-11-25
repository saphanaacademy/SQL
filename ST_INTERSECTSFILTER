CREATE SCHEMA DEVTEST;  

CREATE COLUMN TABLE "DEVTEST"."GEOTEST" (
	"ROW_ID" INTEGER CS_INT,
	"MY_GEO" ST_GEOMETRY,
	PRIMARY KEY ("ROW_ID")	
);

insert into "DEVTEST"."GEOTEST" values(1, NEW ST_POLYGON('POLYGON((0 0, 0 6, 6 6, 0 0))'));
insert into "DEVTEST"."GEOTEST" values(2, NEW ST_LineString('LineString (2.2 1.1, 5.2 10.2)'));
insert into "DEVTEST"."GEOTEST" values(3 , NEW ST_POINT('POINT(2 4)'));

SELECT MY_GEO.ST_AsWKT(), MY_GEO.ST_IntersectsFilter(NEW ST_LineString('LineString (1 1, 5 10)'))
FROM "DEVTEST"."GEOTEST";

SELECT MY_GEO.ST_AsWKT(), MY_GEO.ST_Intersects(NEW ST_LineString('LineString (1 1, 5 10)'))
FROM "DEVTEST"."GEOTEST";

insert into "DEVTEST"."GEOTEST" values(4 , NEW ST_POINT('POINT(-9 -9)'));
