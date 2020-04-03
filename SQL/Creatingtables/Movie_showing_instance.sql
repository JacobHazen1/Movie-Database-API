CREATE TABLE movieapi.MOVIE_SHOWING_INSTANCE( 
    Theater_ID INT NOT NULL,
    Room_no INT NOT NULL,
    Movie_ID INT NOT NULL,
    Showing_ID INT NOT NULL,
    Start_time DATETIME,
    End_time DATETIME, 
    PRIMARY KEY (Theater_ID, Room_no, Movie_ID, Showing_ID),
    FOREIGN KEY (Theater_ID) REFERENCES Theater(Theater_ID),
    FOREIGN KEY (Room_no) REFERENCES Showing_room(Room_no) 
);