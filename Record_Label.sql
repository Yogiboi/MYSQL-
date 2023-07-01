CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE albums (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
release_year INT,
band_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (band_id) REFERENCES bands(id)
);

-- how to insert data into columns
INSERT INTO bands (name)
VALUES ('Iron Maiden');

INSERT INTO bands (name)
VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');

-- to be able to select everything from table 

SELECT * FROM bands;

-- selecting a certain amount of rows from a table
SELECT * FROM bands LIMIT 2;

-- to just get one column without the id column
SELECT name FROM bands;

-- to rename the columns
SELECT id AS 'ID' , name AS 'Band Name'
FROM bands;

-- Order the 
SELECT * FROM bands ORDER BY name;

SELECT * FROM bands ORDER BY name DESC; 

INSERT INTO albums (name, release_year, band_id)
VALUES ('The Number of the Beasts', 1985, 1),
		('Power Slave', 1984, 1),
        ('Nightmare', 2018, 2),
        ('Nightmare', 2010, 3),
        ('Test Album', NULL, 3);
SELECT * FROM albums;

SELECT DISTINCT name FROM albums;

-- Change data
UPDATE albums
SET release_year = 1982
WHERE id = 1;

SELECT * FROM albums
WHERE release_year < 2000;

-- LIKE String
SELECT * FROM albums 
WHERE name LIKE '%er%' OR band_id = 2;

SELECT * FROM albums 
WHERE release_year =1984 AND band_id = 1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 AND 2018;

-- NULL
SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums WHERE id = 5;

SELECT * FROM albums;

-- Join two different tables together 
-- Will typically use INNER and LEFT JOIN
SELECT * FROM bands
JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id;

-- Aggregate Functions
SELECT AVG(release_year) FROM albums;
SELECT SUM(release_year) FROM albums;

-- Count the amount of unique bands 
SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;

-- can shorten table names by their first letter then dot column name 
SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;

-- filter to have a band with one single album
SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name = 'Avenged Sevenfold'
GROUP BY b.id
HAVING num_albums = 1;


