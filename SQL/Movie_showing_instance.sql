CREATE TABLE movieapi.MOVIE_SHOWING_INSTANCE( 
    Showing_ID INT NOT NULL,
    `Name` VARCHAR(60),
    `Description` TEXT,
    Creator_type VARCHAR(15),
    Added_by_admin INT,
    FOREIGN KEY (Added_by_admin) REFERENCES `Admin`(Admin_ID)
);