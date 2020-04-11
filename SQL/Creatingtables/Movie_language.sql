CREATE TABLE movieapi.MOVIE_LANGUAGE(
    Movie_ID INT,
    `Language` VARCHAR(50),
    PRIMARY KEY (Movie_ID, Language),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);