CREATE TABLE movieapi.MOVIE_CREATOR( 
    Movie_Creator_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(60),
    `Description` TEXT,
    Creator_type VARCHAR(15),
    Added_by_admin INT,
    FOREIGN KEY (Added_by_admin) REFERENCES `Admin`(Admin_ID)
);