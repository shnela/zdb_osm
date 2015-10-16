-- set of points
DROP TABLE IF EXISTS "points";
CREATE table "points" (
  id integer PRIMARY KEY,
  lon FLOAT(10),
  lat FLOAT(10)
);

-- tags for points (special places)
DROP TABLE IF EXISTS "point_tags";
CREATE TABLE "point_tags" (
  id SERIAL PRIMARY KEY,
  tag CHARACTER(100)
);

-- route - way / roundabout etc.
DROP TABLE IF EXISTS "route";
CREATE TABLE "route" (
  id SERIAL PRIMARY KEY,
  tag CHARACTER(100)
);

DROP TABLE IF EXISTS "route_points";
CREATE TABLE "route_points" (
  route_id integer,
  point_from integer,
  point_to integer,
  PRIMARY KEY (point_from, point_to)
);

-- connecteion - table which links two objects together make it connectable
DROP TABLE IF EXISTS "passage";
CREATE TABLE "passage" (
  point_from integer,
  point_to integer,
  PRIMARY KEY (point_from, point_to)
);

-- sections - way segments without any crossroads or rondabouts
DROP TABLE IF EXISTS "sections";
CREATE TABLE "sections" (
  point_from integer,
  point_to integer,
  distance integer,
  PRIMARY KEY (point_from, point_to)
);

DROP TABLE IF EXISTS "section_connections";
CREATE TABLE "section_connections" (
  section_from integer,
  section_to integer,
  PRIMARY KEY (section_from, section_to)
);
