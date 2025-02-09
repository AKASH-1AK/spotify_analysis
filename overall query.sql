CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

--eda 
select count(*) from spotify;

select count(distinct artist) from spotify;

select count(distinct album) from spotify;

select distinct album_type from spotify;

select max(duration_min) from spotify;

select * from spotify where duration_min = 0;

delete from spotify where duration_min = 0;
select * from spotify where duration_min = 0;

select distinct most_played_on from spotify;

select * from spotify  where stream > 1000000000

select distinct album,artist from spotify order by 1;

select
	sum(comments) as total_comments
from spotify where licensed = 'true' ;

select * from spotify where album_type = 'single';

select artist,count(*) as total_number_songs
from spotify
group by artist;

--medium level problems
select album,avg(danceability) as avg_dance
from spotify
group by 1
order by 2 desc

select distinct track,avg(energy)
from spotify
group by 1
order by 2 desc
limit 5;

select track,
	sum(views) as total_views,
	sum(likes) as total_likes
from spotify
where official_video = 'true'
group by 1
order by 2 desc
limit 5;

select 
	album,
	track,
	sum(views)
from spotify
group by 1, 2
order by 3 asc;


select 
	track,
	--most_played_on,
	coalesce(sum(case when most_played_on = 'Youtube' Then stream END,0) as stream_on_utube),
	coalesce(sum(case when most_played_on = 'Spotify' Then stream END,0) as stream_on_spotify)
FROM spotify
GROUP BY 1;


