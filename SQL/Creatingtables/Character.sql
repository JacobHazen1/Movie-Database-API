CREATE TABLE movieapi.`CHARACTER`(
    Performer_ID INT,
    Movie_ID INT,
    Character_name VARCHAR(100),
    FOREIGN KEY (Performer_ID) REFERENCES FILM_WORKER(Worker_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Performer_ID, Movie_ID)
);