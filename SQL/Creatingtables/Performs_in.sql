CREATE TABLE movieapi.PERFORMS_IN(
    Performer_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Performer_ID) REFERENCES FILM_WORKER(Worker_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Performer_ID, Movie_ID)
);