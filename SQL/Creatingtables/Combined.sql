CREATE DATABASE movieapi;

CREATE TABLE movieapi.ADMIN( 
    Admin_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(15) NOT NULL,
    `Password` VARCHAR(15) NOT NULL
);

CREATE TABLE movieapi.THEATER( 
    Theater_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Phone_Number VARCHAR(15),
    Zip_code VARCHAR(5),
    `Address` VARCHAR(255),
    City VARCHAR(30), 
    `Name` VARCHAR(60),
    Opening_time DATETIME,
    Closing_time DATETIME, 
    Registered_by_admin INT,
    FOREIGN KEY (Registered_by_admin) REFERENCES `Admin`(Admin_ID)
);

CREATE TABLE movieapi.MOVIE_CREATOR( 
    Movie_Creator_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(60),
    `Description` TEXT,
    Creator_type VARCHAR(15),
    Added_by_admin INT,
    FOREIGN KEY (Added_by_admin) REFERENCES `Admin`(Admin_ID)
);


CREATE TABLE movieapi.Showing_Room ( 
    Room_no INT NOT NULL PRIMARY KEY,
    Theater_ID INT,
    FOREIGN KEY (Theater_ID) REFERENCES Theater(Theater_ID) 
);

CREATE TABLE movieapi.MOVIE_SHOWING_INSTANCE( 
    Theater_ID INT NOT NULL,
    Room_no INT NOT NULL,
    Movie_ID INT NOT NULL,
    Showing_ID INT NOT NULL,
    Start_time DATETIME,
    End_time DATETIME, 
    PRIMARY KEY (Theater_ID, Room_no, Movie_ID, Showing_ID),
    FOREIGN KEY (Theater_ID) REFERENCES Theater(Theater_ID),
    FOREIGN KEY (Room_no) REFERENCES Showing_room(Room_no) 
);


CREATE TABLE movieapi.Movie( 
    Movie_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Description` TEXT,
    Overall_rating FLOAT,
    `Length` INT,
    MPAA_rating VARCHAR(10),
    Title VARCHAR(50),
    `Release` DATE,
    Movie_Creator_ID INT,
    FOREIGN KEY (Movie_Creator_ID) REFERENCES Movie_creator(Movie_Creator_ID)
);

CREATE TABLE movieapi.MOVIE_LANGUAGE( 
    Movie_ID INT PRIMARY KEY,
    `Language` VARCHAR(50),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);

CREATE TABLE movieapi.MOVIE_GENRE( 
    Movie_ID INT PRIMARY KEY,
    Genre VARCHAR(50),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);

CREATE TABLE movieapi.SHOWS(
    Theater_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Theater_ID) REFERENCES Theater(Theater_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Theater_ID, Movie_ID)
);


CREATE TABLE movieapi.User( 
    `User_ID` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(15) NOT NULL,
    `Password` VARCHAR(15) NOT NULL
);


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


CREATE TABLE movieapi.UPDATES( 
    Admin_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Admin_ID) REFERENCES `Admin`(Admin_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Admin_ID, Movie_ID)
);



CREATE TABLE movieapi.BANS( 
    Admin_ID INT,
    `User_ID` INT,
    FOREIGN KEY (Admin_ID) REFERENCES `Admin`(Admin_ID),
    FOREIGN KEY (`User_ID`) REFERENCES User(`User_ID`),
    PRIMARY KEY (Admin_ID, `User_ID`)
);


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

CREATE TABLE movieapi.DIRECTS( 
    Director_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Director_ID) REFERENCES FILM_WORKER(Worker_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Director_ID, Movie_ID)
);

CREATE TABLE movieapi.PERFORMS_IN( 
    Performer_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Performer_ID) REFERENCES FILM_WORKER(Worker_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Performer_ID, Movie_ID)
);

CREATE TABLE movieapi.`CHARACTER`( 
    Performer_ID INT,
    Movie_ID INT,
    Character_name VARCHAR(100),
    FOREIGN KEY (Performer_ID) REFERENCES FILM_WORKER(Worker_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID),
    PRIMARY KEY (Performer_ID, Movie_ID)
);