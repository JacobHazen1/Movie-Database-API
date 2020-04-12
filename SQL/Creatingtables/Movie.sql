CREATE TABLE movieapi.Movie(
    Movie_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Description` TEXT,
    Overall_rating FLOAT,
    `Length` INT,
    MPAA_rating VARCHAR(10),
    Title VARCHAR(50),
    `Release` DATE,
    Movie_Creator_ID INT,
    Gross BIGINT,
    FOREIGN KEY (Movie_Creator_ID) REFERENCES MOVIE_CREATOR(Movie_Creator_ID)
);