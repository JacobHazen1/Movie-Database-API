USE `movieapi`;

-- ---------------------
-- Rank endpoint stored procedure
-- ---------------------
DROP procedure IF EXISTS `rank_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `rank_endpoint`(count INT)
BEGIN
	SELECT 		M.Movie_ID, M.Overall_rating,
				M.Title, M.Description
	FROM		movie AS M
    ORDER BY 	M.Overall_rating DESC
    LIMIT		count;	
END$$
DELIMITER ;

-- ---------------------
-- Genre Endpoint
-- ---------------------
DROP procedure IF EXISTS `genre_endpoint`;
DELIMITER $$
CREATE PROCEDURE genre_endpoint (genre VARCHAR(20))
BEGIN
	SELECT 	M.Movie_ID, M.Title,
			MG.Genre, M.Description
	FROM 	movie AS M, movie_genre AS MG
    WHERE	M.Movie_ID = MG.Movie_ID 
			AND MG.Genre = genre;
END$$
DELIMITER ;

-- -----------------------
-- TimeSlot Endpoint
-- ------------------------
DROP procedure IF EXISTS `timeslot_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `timeslot_endpoint`(theater_name VARCHAR(60), 
									  time_start DATETIME, time_end DATETIME)
BEGIN
	SELECT 	M.Movie_ID, M.Title, T.Name,
			MSI.Start_time, MSI.End_time, 
            M.Description, MSI.Room_no
	FROM	movie AS M, movie_showing_instance AS MSI,
			theater AS T
	WHERE	M.Movie_ID = MSI.Movie_ID 
			AND T.Theater_ID = MSI.Theater_ID
            AND T.Name = theater_name
            AND MSI.Start_time >= time_start
			AND MSI.End_time <= time_end;
END$$
DELIMITER ;

-- -------------------------
-- Specific Movie Theatre
-- -------------------------
DROP procedure IF EXISTS `specific_movie_theatre_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `specific_movie_theatre_endpoint`(theater_name VARCHAR(60), d_date DATE)
BEGIN
	SELECT 	M.Movie_ID, M.Title, T.Name,
			MSI.Start_time, MSI.End_time, 
            M.Description, MSI.Room_no
	FROM	movie AS M, movie_showing_instance AS MSI,
			theater AS T
	WHERE	M.Movie_ID = MSI.Movie_ID 
			AND T.Theater_ID = MSI.Theater_ID
            AND T.Name = theater_name
            AND MSI.Start_time >= d_date
			AND MSI.End_time <= DATE_ADD(d_date, INTERVAL 24 HOUR);
END$$
DELIMITER ;



