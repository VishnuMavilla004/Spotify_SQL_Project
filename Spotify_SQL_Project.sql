-- Creating SPOTIFY Table
DROP TABLE IF EXISTS SPOTIFY;

CREATE TABLE SPOTIFY(
Artist VARCHAR(260),
Track VARCHAR(260),
Album VARCHAR(260),
Album_type VARCHAR(50),
Danceability FLOAT,
Energy FLOAT,
Loudness FLOAT,
Speechiness	FLOAT,
Acousticness FLOAT,
Instrumentalness FLOAT,
Liveness FLOAT,
Valence	FLOAT,
Tempo FLOAT,
Duration_min FLOAT,	
Title VARCHAR(260),
Channel	VARCHAR(260),
Views BIGINT,
Likes BIGINT,
Comments BIGINT,
Licensed BOOLEAN,
official_video BOOLEAN,
Stream BIGINT,
EnergyLiveness FLOAT,	
most_playedon VARCHAR(100)
);

--Displaying the total columns of SPOTIFY table.
SELECT *
FROM SPOTIFY;

--Identify the top 5 longest songs in the database by duration in milliseconds.
SELECT DISTINCT title,duration_min*(60*1000) AS duration_MS
FROM SPOTIFY
ORDER BY 2 DESC
LIMIT 5;

--List all songs in increasing order of tempo
SELECT *
FROM SPOTIFY
ORDER BY tempo;

--Find songs with danceability, energy, and valence all greater than 0.75.
SELECT *
FROM SPOTIFY
WHERE danceability>0.75 AND energy>0.75 AND valence>0.75; 

--Calculate the average energy of all songs in the dataset.
SELECT title,AVG(energy)
FROM SPOTIFY;

--List all songs by a specific artist, such as Post Malone, without assuming their artist ID
SELECT title,track,album,artist
FROM SPOTIFY
WHERE artist = 'Post Malone';

--Compute the average energy of songs by a specific artist, such as Drake, without assuming their artist ID.
SELECT title,AVG(energy)
FROM SPOTIFY
WHERE artist='Drake'

--Retrieve songs that feature other artists, identified by the presence of "feat." in the song name.
SELECT title,track,album,artist
FROM SPOTIFY
WHERE title ILIKE '%ft.%';

--Calculate the average energy, valence, and danceability of a user’s top 100 songs to determine their "Audio Aura".
SELECT title, AVG(energy) AS energy,AVG(valence) AS valence,AVG(danceability) AS danceability
FROM SPOTIFY
GROUP BY 1
ORDER BY 2,3,4
LIMIT 100;

--Calculate the average danceability for each album.
SELECT album,AVG(danceability) AS danceability
FROM SPOTIFY
GROUP BY 1
ORDER BY 2 DESC;

--For each album, calculate the total views of all its tracks.
SELECT DISTINCT album,SUM(views) AS Views
FROM SPOTIFY
GROUP BY 1
ORDER BY 2 DESC;

--Find all the tracks that belong to the album type single
SELECT *
FROM SPOTIFY
WHERE album_type = 'single';

--Count the total no.of songs by each artist
SELECT artist,COUNT(*) AS Total_Songs
FROM SPOTIFY
GROUP BY 1;

--Retrieve track names that have been streamed more on Spotify than on YouTube.
SELECT title,track,album,artist,duration_min,most_playedon
FROM SPOTIFY
WHERE most_playedon='Youtube'
ORDER BY 5 DESC;

--List all tracks with their views and likes where OFFICIAL_VIDEO=True
SELECT title,track,album,views,likes,artist
FROM SPOTIFY
WHERE official_video='true';

--

--
