CREATE database spotify
CREATE TABLE SpotifyTracks
 (
    TrackID VARCHAR(255) PRIMARY KEY,
    TrackName VARCHAR(255),
    ArtistID VARCHAR(255),
    AlbumID VARCHAR(255),
    DurationMS INT,
    Popularity INT,
    Explicit BOOLEAN,
    ReleaseDate DATE
);

CREATE TABLE SpotifyArtists (
    ArtistID VARCHAR(255) PRIMARY KEY,
    ArtistName VARCHAR(255),
    Followers INT,
    Popularity INT,
    Genre VARCHAR(255)
);

CREATE TABLE SpotifyAlbums (
    AlbumID VARCHAR(255) PRIMARY KEY,
    AlbumName VARCHAR(255),
    ArtistID VARCHAR(255),
    ReleaseDate DATE,
    TotalTracks INT
);

CREATE TABLE SpotifyPlaylists (
    PlaylistID VARCHAR(255) PRIMARY KEY,
    PlaylistName VARCHAR(255),
    Description TEXT,
    TotalTracks INT,
    Followers INT
);
INSERT INTO SpotifyTracks (TrackID, TrackName, ArtistID, AlbumID, DurationMS, Popularity, Explicit, ReleaseDate)
VALUES 
('1', 'Track 1', 'A1', 'B1', 210000, 85, FALSE, '2023-01-01'),
('2', 'Track 2', 'A2', 'B2', 180000, 90, TRUE, '2023-02-01');


INSERT INTO SpotifyArtists (ArtistID, ArtistName, Followers, Popularity, Genre)
VALUES 
('A1', 'Artist 1', 500000, 95, 'Pop'),
('A2', 'Artist 2', 300000, 85, 'Rock');


INSERT INTO SpotifyAlbums (AlbumID, AlbumName, ArtistID, ReleaseDate, TotalTracks)
VALUES 
('B1', 'Album 1', 'A1', '2022-12-01', 12),
('B2', 'Album 2', 'A2', '2023-01-15', 10);

INSERT INTO SpotifyPlaylists (PlaylistID, PlaylistName, Description, TotalTracks, Followers)
VALUES 
('P1', 'Top Hits', 'A collection of top hits.', 50, 200000),
('P2', 'Rock Classics', 'Classic rock songs from the 70s and 80s.', 40, 150000);

SELECT TrackName, Popularity 
FROM SpotifyTracks
ORDER BY Popularity DESC
LIMIT 1;


SELECT TrackName 
FROM SpotifyTracks
WHERE ArtistID = 'A1';


SELECT AVG(Popularity) AS AveragePopularity 
FROM SpotifyTracks
WHERE AlbumID = 'B1';


SELECT SUM(Followers) AS TotalFollowers
FROM SpotifyArtists
WHERE Genre = 'Pop';


SELECT PlaylistName, Followers
FROM SpotifyPlaylists
WHERE Followers > 100000;

SELECT 
    t.TrackName, 
    a.ArtistName, 
    al.AlbumName, 
    t.Popularity
FROM 
    SpotifyTracks t
JOIN 
    SpotifyArtists a ON t.ArtistID = a.ArtistID
JOIN 
    SpotifyAlbums al ON t.AlbumID = al.AlbumID
ORDER BY 
    t.Popularity DESC
LIMIT 1;

SELECT 
    a.ArtistName, 
    COUNT(t.TrackID) AS NumberOfTracks
FROM 
    SpotifyArtists a
JOIN 
    SpotifyTracks t ON a.ArtistID = t.ArtistID
GROUP BY 
    a.ArtistName
ORDER BY 
    NumberOfTracks DESC;