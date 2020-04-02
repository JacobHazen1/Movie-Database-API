CREATE TABLE movieapi.REVIEW( 
    Movie_ID INT,
    Reviewer_ID INT,
    Review_ID INT,
    Rating INT,
    `Description` TEXT,
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    FOREIGN KEY (Reviewer_ID) REFERENCES User(`User_ID`),
    PRIMARY KEY (Movie_ID, Reviewer_ID, Review_ID)
);
