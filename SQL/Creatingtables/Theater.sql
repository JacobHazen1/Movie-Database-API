CREATE TABLE movieapi.THEATER( 
    Theater_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Phone_Number VARCHAR(15),
    Zip_code VARCHAR(5),
    `Address` VARCHAR(255),
    City VARCHAR(30), 
    `Name` VARCHAR(60),
    Opening_time TIME,
    Closing_time TIME, 
    Registered_by_admin INT,
    FOREIGN KEY (Registered_by_admin) REFERENCES `Admin`(Admin_ID)
);