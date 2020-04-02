CREATE TABLE movieapi.DIRECTS( 
    Director_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Director_ID) REFERENCES FILM_WORKER(Worker_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Director_ID, Movie_ID)
);