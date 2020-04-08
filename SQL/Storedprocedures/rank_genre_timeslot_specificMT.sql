USE `movieapi`;

-- -------------------------------
-- Rank endpoint stored procedure
-- -------------------------------
DROP procedure IF EXISTS `rank_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `rank_endpoint`(count INT)
BEGIN
	PREPARE statement FROM
		'SELECT 	M.Movie_ID, M.Overall_rating,
					M.Title, M.Description
		FROM		movie AS M
		ORDER BY 	M.Overall_rating DESC
		LIMIT		?';	
	SET @count = count;
    EXECUTE statement USING @count;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- ----------------------------------
-- Genre Endpoint stored procedure
-- ---------------------------------
DROP procedure IF EXISTS `genre_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `genre_endpoint`(genre VARCHAR(20))
BEGIN
	PREPARE statement FROM
		'SELECT M.Movie_ID, M.Title,
				MG.Genre, M.Description
		FROM 	movie AS M, movie_genre AS MG
		WHERE	M.Movie_ID = MG.Movie_ID 
				AND MG.Genre = ?';
	SET @genre = genre;
	EXECUTE statement USING @genre;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- ------------------------------------------
-- TimeSlot Endpoint Stored Procedure
-- ------------------------------------------
DROP procedure IF EXISTS `timeslot_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `timeslot_endpoint`(theater_name VARCHAR(60), 
									  time_start DATETIME, time_end DATETIME)
BEGIN
	PREPARE statement FROM
		'SELECT M.Movie_ID, M.Title, T.Name AS Theater_name,
				MSI.Start_time, MSI.End_time, 
				M.Description, MSI.Room_no AS Theater_room_no
		FROM	movie AS M, movie_showing_instance AS MSI,
				theater AS T
		WHERE	M.Movie_ID = MSI.Movie_ID 
				AND T.Theater_ID = MSI.Theater_ID
				AND T.Name = ?
				AND MSI.Start_time >= ?
				AND MSI.End_time <= ?';
	SET @theater_name = theater_name;
    SET @time_start = time_start;
    SET @time_end = time_end;
    EXECUTE statement USING @theater_name, @time_start, @time_end;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Specific Movie Theatre
-- -------------------------
DROP procedure IF EXISTS `specific_movie_theatre_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `specific_movie_theater_endpoint`(theater_name VARCHAR(60), d_date DATE)
BEGIN
	PREPARE statement FROM
	'SELECT M.Movie_ID, M.Title, T.Name AS Theater_name,
			MSI.Start_time, MSI.End_time, 
            M.Description, MSI.Room_no AS Theater_room_no
	FROM	movie AS M, movie_showing_instance AS MSI,
			theater AS T
	WHERE	M.Movie_ID = MSI.Movie_ID 
			AND T.Theater_ID = MSI.Theater_ID
            AND T.Name = ?
            AND MSI.Start_time >= ?
			AND MSI.End_time <= DATE_ADD(?, INTERVAL 24 HOUR)';
	SET @theater_name = theater_name;
    SET @d_date = d_date;
    EXECUTE statement USING @theater_name, @d_date, @d_date;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;






