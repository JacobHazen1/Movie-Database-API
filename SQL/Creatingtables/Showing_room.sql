CREATE TABLE movieapi.Showing_Room ( 
    Room_no INT NOT NULL PRIMARY KEY,
    Theater_ID INT,
    FOREIGN KEY (Theater_ID) REFERENCES Theater(Theater_ID) 
);