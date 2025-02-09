# 📊 Spotify Data Analysis Using PostgreSQL
![Spotify Logo](https://upload.wikimedia.org/wikipedia/commons/1/19/Spotify_logo_without_text.svg)
## 📌 Project Overview
This project aims to analyze a Spotify dataset using **PostgreSQL**. The dataset contains various song attributes, such as artist details, album information, song characteristics, streaming numbers, and user engagement metrics. The goal is to derive insights into song trends, artist popularity, streaming preferences, and engagement metrics.

## 📂 Dataset Information
The dataset includes the following key attributes:
- **Basic Details:** `artist`, `track`, `album`, `album_type`
- **Song Characteristics:** `danceability`, `energy`, `loudness`, `speechiness`, `acousticness`, `instrumentalness`, `liveness`, `valence`, `tempo`, `duration_min`
- **Engagement Metrics:** `views`, `likes`, `comments`, `licensed`, `official_video`, `stream`
- **Streaming Platform Information:** `most_played_on`

## 🛠 Database Schema
The dataset is structured as follows:
```sql
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
```

---

## 🔍 Exploratory Data Analysis (EDA)

### ✅ Basic Insights
- **Total records in the dataset**
- **Unique artists and albums**
- **Album types available**
- **Longest song duration**
- **Handling invalid records (songs with duration = 0)**
- **Identifying most-played platforms**
- **Filtering highly streamed songs (above 1 billion streams)**
- **Listing albums and artists alphabetically**

### 📌 Queries:
```sql
SELECT COUNT(*) FROM spotify;
SELECT COUNT(DISTINCT artist) FROM spotify;
SELECT COUNT(DISTINCT album) FROM spotify;
SELECT DISTINCT album_type FROM spotify;
SELECT MAX(duration_min) FROM spotify;
SELECT * FROM spotify WHERE duration_min = 0;
DELETE FROM spotify WHERE duration_min = 0;
SELECT DISTINCT most_played_on FROM spotify;
SELECT * FROM spotify WHERE stream > 1000000000;
SELECT DISTINCT album, artist FROM spotify ORDER BY 1;
```

---

## 📈 Medium-Level Queries

### 🎵 **Analyzing Song Popularity and Engagement**
- **Total comments for licensed songs**
- **Songs categorized as singles**
- **Total number of songs by each artist**
- **Albums ranked by average danceability**
- **Top 5 tracks with the highest average energy**
- **Most viewed and liked official videos**
- **Total views per album and track**

### 📌 Queries:
```sql
SELECT SUM(comments) AS total_comments FROM spotify WHERE licensed = 'true';
SELECT * FROM spotify WHERE album_type = 'single';
SELECT artist, COUNT(*) AS total_number_songs FROM spotify GROUP BY artist;
SELECT album, AVG(danceability) AS avg_dance FROM spotify GROUP BY 1 ORDER BY 2 DESC;
SELECT DISTINCT track, AVG(energy) FROM spotify GROUP BY 1 ORDER BY 2 DESC LIMIT 5;
SELECT track, SUM(views) AS total_views, SUM(likes) AS total_likes FROM spotify
WHERE official_video = 'true' GROUP BY 1 ORDER BY 2 DESC LIMIT 5;
SELECT album, track, SUM(views) FROM spotify GROUP BY 1, 2 ORDER BY 3 ASC;
```

---

## 🎧 Streaming Platform Analysis
### **Comparing Streams on YouTube vs. Spotify**
This query helps analyze the most-played platform for each track by comparing streams on **YouTube vs. Spotify**.

### 📌 Query:
```sql
SELECT
    track,
    COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END), 0) AS stream_on_youtube,
    COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END), 0) AS stream_on_spotify
FROM spotify
GROUP BY 1;
```

---

## 🚀 How to Use
1. **Load the Dataset**: Import the dataset into your PostgreSQL database.
2. **Execute Queries**: Run the provided queries in a PostgreSQL environment.
3. **Analyze Results**: Derive insights into song trends, artist popularity, and streaming preferences.

## 📝 Author
This project was developed using **PostgreSQL** to analyze and extract insights from the Spotify dataset.

---
**📌 Happy Querying! 🎶**
