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
		FROM		Movie AS M
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
		FROM 	Movie AS M, MOVIE_GENRE AS MG
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
		FROM	Movie AS M, MOVIE_SHOWING_INSTANCE AS MSI,
				THEATER AS T
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
DROP procedure IF EXISTS `specific_movie_theater_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `specific_movie_theater_endpoint`(theater_name VARCHAR(60), d_date DATE)
BEGIN
	PREPARE statement FROM
	'SELECT M.Movie_ID, M.Title, T.Name AS Theater_name,
			MSI.Start_time, MSI.End_time, 
            M.Description, MSI.Room_no AS Theater_room_no
	FROM	Movie AS M, MOVIE_SHOWING_INSTANCE AS MSI,
			THEATER AS T
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

-- -------------------------
-- MPAA Rating endpoint
-- -------------------------
DROP procedure IF EXISTS `mpaa_rating_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mpaa_rating_endpoint`(mpaa_rating VARCHAR(10))
BEGIN
	PREPARE statement FROM
	'SELECT Distinct M.Movie_ID, M.Title, M.MPAA_rating, M.Description
	FROM	Movie AS M
	WHERE	M.Movie_ID
            AND M.MPAA_rating = ?';
	SET @mpaa_rating = mpaa_rating;
    EXECUTE statement USING @mpaa_rating;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Helper query for getting all genres for a movie
-- -------------------------
DROP procedure IF EXISTS `all_genre_for_movie`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_genre_for_movie`(Movie_ID INT)
BEGIN
	PREPARE statement FROM
	'SELECT MG.genre
	FROM	Movie AS M, MOVIE_GENRE AS MG
	WHERE	M.Movie_ID = MG.Movie_ID 
            AND M.Movie_ID = ?';
	SET @Movie_ID = Movie_ID;
    EXECUTE statement USING @Movie_ID;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Language endpoint
-- -------------------------
DROP procedure IF EXISTS `language_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `language_endpoint`(language VARCHAR(50))
BEGIN
	PREPARE statement FROM
	'SELECT Distinct M.Movie_ID, M.Title, M.Overall_rating, M.Release, M.Length, M.Description
	FROM	Movie AS M, MOVIE_LANGUAGE AS ML
	WHERE	M.Movie_ID = ML.Movie_ID
            AND ML.Language = ?';
	SET @language = language;
    EXECUTE statement USING @language;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Upcoming movie endpoint
-- -------------------------
DROP procedure IF EXISTS `upcoming_movies`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `upcoming_movies`()
BEGIN
	PREPARE statement FROM
	'SELECT M.Movie_ID, M.Title, M.Overall_rating, M.Length, M.Description, M.Release
	FROM	Movie AS M
	WHERE	M.Release > CURDATE()';
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;


-- -------------------------
-- Add movie endpoint
-- -------------------------
DROP procedure IF EXISTS `add_movie_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_movie_endpoint`(title VARCHAR(50),
																 year INT,
																 language VARCHAR(50),
																 genre,
																 description,
																 mpaa_rating)
BEGIN
	PREPARE statement FROM
	'';
	SET @language = language;
    EXECUTE statement USING @language;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;
