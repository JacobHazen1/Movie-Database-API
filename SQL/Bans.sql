CREATE TABLE movieapi.UPDATES( 
    Admin_ID INT,
    `User_ID` INT,
    FOREIGN KEY (Admin_ID) REFERENCES `Admin`(Admin_ID)
    FOREIGN KEY (Movie_ID) REFERENCES User(`User_ID`)
    PRIMARY KEY (Admin_ID, `User_ID`)
);
