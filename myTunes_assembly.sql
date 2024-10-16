DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS temp_cds;
DROP TABLE IF EXISTS temp_songs;

CREATE TABLE temp_cds(
      cd_id text primary key not null, --cd unique id
      title text NOT NULL, --title of CD
      artist text NOT NULL, --artist whose CD it is or "various artists"
      producer text default NULL,
      year integer,
      contributer text --student number who contirbuted the data
      );

CREATE TABLE temp_songs(
      song_id integer primary key not null, --auto incrementing key
      title text NOT NULL, --title of song
      composer text NOT NULL, --person or persons who wrote the song
      cd_id text NOT NULL, --cd this song appears on
      track integer NOT NULL, --track number of the song
      contributer text --student number who contirbuted the data
      );

.read myTunes_Abdelghny.sql
INSERT INTO temp_cds(cd_id, title, artist, producer, year, contributer) select cd_id, title, artist, producer, year, contributer from cds;
INSERT INTO temp_songs( title, composer, cd_id, track, contributer) select title, composer, cd_id, track, contributer from songs;
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

.read myTunes_Ali.sql
insert or ignore into temp_cds(cd_id, title, artist, producer, year, contributer) select cd_id, title, artist, producer, year, contributer from cds;
insert into temp_songs( title, composer, cd_id, track, contributer) select  title, composer, cd_id, track, contributer from songs;
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs;

.read myTunes_Fatemeh.sql
INSERT INTO temp_cds(cd_id, title, artist, producer, year, contributer) select cd_id, title, artist, producer, year, contributer from cds;
INSERT INTO temp_songs( title, composer, cd_id, track, contributer) select  title, composer, cd_id, track, contributer from songs;
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs; 

.read myTunes_Monica.sql
INSERT INTO temp_cds(cd_id, title, artist, producer, year, contributer) select cd_id, title, artist, producer, year, contributer from cds;
INSERT INTO temp_songs( title, composer, cd_id, track, contributer) select  title, composer, cd_id, track, contributer from songs;
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs; 

.read myTunes_Rezieh.sql
INSERT INTO temp_cds(cd_id, title, artist, producer, year, contributer) select cd_id, title, artist, producer, year, contributer from cds;
INSERT INTO temp_songs( title, composer, cd_id, track, contributer) select  title, composer, cd_id, track, contributer from songs;
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs; 

.read myTunes_Saman.sql
INSERT INTO temp_cds(cd_id, title, artist, producer, year, contributer) select cd_id, title, artist, producer, year, contributer from cds;
INSERT INTO temp_songs( title, composer, cd_id, track, contributer) select  title, composer, cd_id, track, contributer from songs;
DROP TABLE IF EXISTS cds;
DROP TABLE IF EXISTS songs; 

CREATE TABLE cds(
    cd_id TEXT PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    artist TEXT NOT NULL,
    producer TEXT DEFAULT NULL,
    year INTEGER,
    contributer TEXT
);

CREATE TABLE songs(
    song_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    composer TEXT NOT NULL,
    cd_id TEXT NOT NULL,
    track INTEGER NOT NULL,
    contributer TEXT,
    PRIMARY KEY (song_id, cd_id) -- Composite key to ensure no conflicts
);


INSERT INTO cds(cd_id, title, artist, producer, year, contributer) select cd_id, title, artist, producer, year, contributer from temp_cds;
INSERT INTO songs(song_id, title, composer, cd_id, track, contributer)select song_id, title, composer, cd_id, track, contributer from temp_songs;

DROP TABLE IF EXISTS temp_cds;
DROP TABLE IF EXISTS temp_songs;