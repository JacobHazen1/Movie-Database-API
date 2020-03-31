CREATE TABLE movieapi.Movie( 
    Movie_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Description` TEXT,
    Overall_rating FLOAT,
    `Length` TIME,
    MPAA_rating FLOAT,
    Title VARCHAR(50),
    `Release` DATE,
    Movie_Creator_ID INT,
    FOREIGN KEY (Movie_Creator_ID) REFERENCES Movie_creator(Movie_Creator_ID)
);