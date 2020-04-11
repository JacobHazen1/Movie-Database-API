CREATE TABLE movieapi.BANS(
    Admin_ID INT,
    `User_ID` INT,
    FOREIGN KEY (Admin_ID) REFERENCES `ADMIN`(Admin_ID),
    FOREIGN KEY (`User_ID`) REFERENCES User(`User_ID`),
    PRIMARY KEY (Admin_ID, `User_ID`)
);