# IMPORT DANYCH Z PLIKU 'warsaw_poland.osm':
## SQL TABLES
- db schema avaliable in `initialize_osm_tables.sql`
- everything is based on points placed on the plane
- objects: street, crossroads and ronabouts are set of ordered points
- if there's possibility to directly drive from point A to B (two of the same object), then there are two points in object with order A->B (for two way street there are at least two instances of way)
- if you can drive from object1 to object2 - there is connection - two points which link two objects
- to improve finding the shortests path there are two additional tables
  - `sections` - which is used to store segments of route which have no crossroads or rondabouts with their length
  - `section_connectsions` - which store information which sections are connected
## IMPORTING SCRIPT
- osm data is imported by file `import_osm_data.py`
- we won't use any xml parser because it will lead to high RAM consumption, osm xml schema is very simple, so custom solution will be good enough
- import steps:
    - scan all `way` tags and store points used in them
    - write points and ways to the database
    - detect connections and write them to the `passage` table
    - count all distances and fill `sections` and `section_connections` tables
