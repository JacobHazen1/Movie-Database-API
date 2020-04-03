CREATE TABLE movieapi.FILM_WORKER( 
    Worker_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(60),
    Middle_name VARCHAR(60),
    Last_name VARCHAR(60),
    Age INT,
    bDate DATE,
    Director_flag BINARY,
    Performer_flag BINARY,
    Added_by_admin INT,
    FOREIGN KEY (Added_by_admin) REFERENCES `Admin`(Admin_ID)
);