CREATE TABLE movieapi.SHOWS(
    Theater_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Theater_ID) REFERENCES THEATER(Theater_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Theater_ID, Movie_ID)
);