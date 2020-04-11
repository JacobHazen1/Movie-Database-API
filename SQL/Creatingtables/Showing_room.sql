CREATE TABLE movieapi.Showing_Room (
    Room_no INT,
    Theater_ID INT,
    PRIMARY KEY (Room_no, Theater_ID),
    FOREIGN KEY (Theater_ID) REFERENCES THEATER(Theater_ID)
);