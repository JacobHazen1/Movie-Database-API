CREATE TABLE movieapi.MOVIE_GENRE( 
    Movie_ID INT,
    Genre VARCHAR(50),
    PRIMARY KEY (Movie_ID, Genre),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);