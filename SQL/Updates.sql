CREATE TABLE movieapi.UPDATES( 
    Admin_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Admin_ID) REFERENCES `Admin`(Admin_ID)
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
    PRIMARY KEY (Admin_ID, Movie_ID)
);