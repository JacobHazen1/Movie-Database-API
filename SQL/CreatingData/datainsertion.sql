-- Admin table
INSERT INTO `movieapi`.`ADMIN` (`Username`, `Password`) VALUES ('bobo', 'bobo');
INSERT INTO `movieapi`.`ADMIN` (`Username`, `Password`) VALUES ('jacob', 'jacob');
INSERT INTO `movieapi`.`ADMIN` (`Username`, `Password`) VALUES ('everest', 'everest');
INSERT INTO `movieapi`.`ADMIN` (`Username`, `Password`) VALUES ('albert', 'albert');
INSERT INTO `movieapi`.`ADMIN` (`Username`, `Password`) VALUES ('sarhan', 'sarhan');
INSERT INTO `movieapi`.`ADMIN` (`Username`, `Password`) VALUES ('tanuja', 'tanuja');


-- Movie creator table
INSERT INTO `movieapi`.`MOVIE_CREATOR` (`Movie_Creator_ID`, `Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('1', 'Albert Studios', 'Albert Studios is a mid-size movie publisher in Calgary', ' studio', '1');
INSERT INTO `movieapi`.`MOVIE_CREATOR` (`Movie_Creator_ID`, `Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('2', 'Bobo Studios', 'Bobo Studios is a mid-size movie publisher in Calgary', ' studio', '2');
INSERT INTO `movieapi`.`MOVIE_CREATOR` (`Movie_Creator_ID`, `Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('3', 'Jacob Studios', 'Jacob Studios is a mid-size movie publisher in Calgary', 'studio', '3');
INSERT INTO `movieapi`.`MOVIE_CREATOR` (`Movie_Creator_ID`, `Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('4', 'Everest & co.', 'Everest Studios is a mid-size movie publisher in Calgary', 'independent', '4');
INSERT INTO `movieapi`.`MOVIE_CREATOR` (`Movie_Creator_ID`, `Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('5', 'Sarhan & co.', 'Sarhan Studios is a mid-size movie publisher in Calgary', 'independent', '5');
INSERT INTO `movieapi`.`MOVIE_CREATOR` (`Movie_Creator_ID`, `Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('6', 'Tanuja & co.', 'T Studios is a mid-size movie publisher in Calgary', 'independent', '6');

-- Movies Table
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('1', 'An aging hitman recalls his time with the mob and the intersecting events with his friend, Jimmy Hoffa, through the 1950-70s.', '7.9', '209', 'R', 'The Irishman', '1');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('2', 'A poor family, the Kims, con their way into becoming the servants of a rich family, the Parks. But their easy life gets complicated when their deception is threatened with exposure.', '8.6', '132', 'R', 'Parasite', '1');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('3', 'In early 18th century England, a frail Queen Anne occupies the throne and her close friend, Lady Sarah, governs the country in her stead. When a new servant, Abigail, arrives, her charm endears her to Sarah.', '7.6', '119', 'R', 'The Favourite', '2');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('4', 'A Chinese family discovers their grandmother has only a short while left to live and decide to keep her in the dark, scheduling a wedding to gather before she dies.', '7.6', '100', 'PG', 'The Farewell I', '2');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('5', 'A family of small-time crooks take in a child they find outside in the cold.', '8.0', '121', 'R', 'Shoplifters', '3');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('6', 'Jo March (Saoirse Ronan) reflects back and forth on her life, telling the beloved story of the March sisters - four young women each determined to live life on her own terms.', '7.9', '135', 'PG', ' Little Women', '3');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('7', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.', '8.4', '181', 'PG-13', 'Avengers: Endgame', '4');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('8', 'After the death of her grandmother, Teresa comes home to her matriarchal village in a near-future Brazil to find a succession of sinister events that mobilizes all of its residents.', '7.7', '131', 'R', 'Bacurau', '4');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('9', 'April 6th, 1917. As a regiment assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.', '8.4', '119', 'R', '1917', '5');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('10', 'Kept apart by a terrible lie and a conservative society, two sisters born in Rio de Janeiro make their way through life each believing the other is living out her dreams half a world away.', '8.0', '139', 'R', 'Invisible Life', '5');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('11', 'Noah Baumbach\'s incisive and compassionate look at a marriage breaking up and a family staying together.', '8.0', '137', 'R', 'Marriage Story', '6');
INSERT INTO `movieapi`.`Movie` (`Movie_ID`, `Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('12', 'On the eve of their high school graduation, two academic superstars and best friends realize they should have worked less and played more. Determined not to fall short of their peers, the girls try to cram four years of fun into one night.', '7.2', '102', 'R', 'Booksmart', '6');

UPDATE `movieapi`.`Movie` SET `Release` = '2019-11-27' WHERE (`Movie_ID` = '1');
UPDATE `movieapi`.`Movie` SET `Release` = '2019-11-08' WHERE (`Movie_ID` = '2');
UPDATE `movieapi`.`Movie` SET `Release` = '2018-12-21' WHERE (`Movie_ID` = '3');
UPDATE `movieapi`.`Movie` SET `Release` = '2019-08-09' WHERE (`Movie_ID` = '4');
UPDATE `movieapi`.`Movie` SET `Release` = '2018-11-23' WHERE (`Movie_ID` = '5');
UPDATE `movieapi`.`Movie` SET `Release` = '2019-12-05' WHERE (`Movie_ID` = '6');
UPDATE `movieapi`.`Movie` SET `Release` = '2019-04-26' WHERE (`Movie_ID` = '7');
UPDATE `movieapi`.`Movie` SET `Release` = '2020-03-19' WHERE (`Movie_ID` = '8');
UPDATE `movieapi`.`Movie` SET `Release` = '2020-10-01' WHERE (`Movie_ID` = '9');
UPDATE `movieapi`.`Movie` SET `Release` = '2020-04-03' WHERE (`Movie_ID` = '10');
UPDATE `movieapi`.`Movie` SET `Release` = '2019-12-06' WHERE (`Movie_ID` = '11');
UPDATE `movieapi`.`Movie` SET `Release` = '2019-05-24' WHERE (`Movie_ID` = '12');

INSERT INTO `movieapi`.`MOVIE_LANGUAGE` (`Movie_ID`, `Language`) VALUES ('1', 'English');
INSERT INTO `movieapi`.`MOVIE_LANGUAGE` (`Movie_ID`, `Language`) VALUES ('1', 'Spanish');


-- Movie_genre
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('1', 'biography');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('1', 'crime');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('1', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('2', 'comedy');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('2', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('2', 'thriller');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('3', 'biography');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('3', 'comedy');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('3', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('4', 'comedy');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('4', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('5', 'crime');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('5', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('6', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('6', 'romance');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('7', 'action');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('7', 'adventure');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('7', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('8', 'action');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('8', 'adventure');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('8', 'mystery');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('9', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('9', 'war');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('10', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('11', 'comedy');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('11', 'drama');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('11', 'romance');
INSERT INTO `movieapi`.`MOVIE_GENRE` (`Movie_ID`, `Genre`) VALUES ('12', 'comedy');


-- theater
INSERT INTO `movieapi`.`THEATER` (`Theater_ID`, `Phone_Number`, `Zip_code`, `Address`, `City`, `Name`, `Opening_time`, `Closing_time`, `Registered_by_admin`) VALUES ('1', '111-111-1111', 'ABC12', '1 Hutington Drive', 'Calgary', 'jacob theatres', '07:00:00', '01:00:00', '1');
INSERT INTO `movieapi`.`THEATER` (`Theater_ID`, `Phone_Number`, `Zip_code`, `Address`, `City`, `Name`, `Opening_time`, `Closing_time`, `Registered_by_admin`) VALUES ('2', '222-222-2222', 'BCD45', '2 Hutington Drive', 'Edmonton', 'sarhan theatres', '07:00:00', '01:00:00', '2');
INSERT INTO `movieapi`.`THEATER` (`Theater_ID`, `Phone_Number`, `Zip_code`, `Address`, `City`, `Name`, `Opening_time`, `Closing_time`, `Registered_by_admin`) VALUES ('3', '333-333-3333', 'EFG12', '3 Hutington Drive', 'Vancouver', 'bobo theatres', '07:00:00', '01:00:00', '3');
INSERT INTO `movieapi`.`THEATER` (`Theater_ID`, `Phone_Number`, `Zip_code`, `Address`, `City`, `Name`, `Opening_time`, `Closing_time`, `Registered_by_admin`) VALUES ('4', '444-444-4444', 'FGH12', '4 Hutington Drive', 'Saskatoon', 'everest theatres', '07:00:00', '01:00:00', '4');
INSERT INTO `movieapi`.`THEATER` (`Theater_ID`, `Phone_Number`, `Zip_code`, `Address`, `City`, `Name`, `Opening_time`, `Closing_time`, `Registered_by_admin`) VALUES ('5', '555-555-5555', 'T2MXZ', '5 Hutington Drive', 'Nova Scotia', 'albert theatres', '07:00:00', '01:00:00', '5');
INSERT INTO `movieapi`.`THEATER` (`Theater_ID`, `Phone_Number`, `Zip_code`, `Address`, `City`, `Name`, `Opening_time`, `Closing_time`, `Registered_by_admin`) VALUES ('6', '666-666-6666', 'HKL45', '6 Hutington Drive', 'Victoria', 'abc movies', '07:00:00', '01:00:00', '6');

-- Showing room
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('1', '1');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('2', '1');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('3', '1');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('4', '1');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('5', '1');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('1', '2');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('2', '2');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('3', '2');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('4', '2');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('5', '2');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('1', '3');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('2', '3');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('3', '3');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('4', '3');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('5', '3');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('1', '4');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('2', '4');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('3', '4');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('4', '4');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('5', '4');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('1', '5');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('2', '5');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('3', '5');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('4', '5');
INSERT INTO `movieapi`.`Showing_Room` (`Room_no`, `Theater_ID`) VALUES ('5', '5');

-- Movie_showing_instance
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('6', '1', '1', '1', '2020-04-04 09:00:00', '2020-04-04 12:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('6', '2', '2', '2', '2020-04-04 10:00:00', '2020-04-04 13:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('6', '3', '3', '3', '2020-04-04 11:00:00', '2020-04-04 14:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('6', '4', '4', '4', '2020-04-04 12:00:00', '2020-04-04 15:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('6', '5', '5', '5', '2020-04-04 13:00:00', '2020-04-04 16:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('1', '1', '6', '1', '2020-04-04 14:00:00', '2020-04-04 17:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('1', '2', '7', '2', '2020-04-04 15:00:00', '2020-04-04 18:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('1', '3', '8', '3', '2020-04-04 16:00:00', '2020-04-04 19:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('2', '1', '9', '4', '2020-04-04 17:00:00', '2020-04-04 20:00:00');
INSERT INTO `movieapi`.`MOVIE_SHOWING_INSTANCE` (`Theater_ID`, `Room_no`, `Movie_ID`, `Showing_ID`, `Start_time`, `End_time`) VALUES ('3', '1', '10', '5', '2020-04-04 18:00:00', '2020-04-04 21:00:00');

-- Shows
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '1');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '2');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '3');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '4');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '5');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '6');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '7');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '8');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '9');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '10');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '11');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('1', '12');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '1');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '2');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '3');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '4');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '5');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '6');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '7');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '8');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '9');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '10');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '11');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('2', '12');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '1');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '2');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '3');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '4');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '5');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '6');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '7');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '8');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '9');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '10');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '11');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('3', '12');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '1');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '2');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '3');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '4');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '5');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '6');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '7');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '8');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '9');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '10');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '11');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('4', '12');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '1');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '2');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '3');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '4');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '5');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '6');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '7');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '8');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '9');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '10');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '11');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('5', '12');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '1');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '2');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '3');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '4');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '5');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '6');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '7');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '8');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '9');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '10');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '11');
INSERT INTO `movieapi`.`SHOWS` (`Theater_ID`, `Movie_ID`) VALUES ('6', '12');

