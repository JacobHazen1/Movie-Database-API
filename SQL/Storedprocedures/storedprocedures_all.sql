USE `movieapi`;

-- -------------------------------
-- Rank endpoint stored procedure
-- -------------------------------
DROP procedure IF EXISTS `rank_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `rank_endpoint`(count INT)
BEGIN
    PREPARE statement FROM
        'SELECT
            M.Movie_ID,
            M.Overall_rating,
            M.Title,
            M.Description
        FROM
            Movie AS M
        ORDER BY
            M.Overall_rating DESC
        LIMIT
            ?';	
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
        'SELECT DISTINCT M.Movie_ID, M.Title,
                MG.Genre, M.Description
        FROM 	movie AS M, movie_genre AS MG, 
                shows AS S, theater AS T
        WHERE	M.Movie_ID = MG.Movie_ID 
                AND M.Movie_ID = S.Movie_ID
                AND S.Theater_ID = T.Theater_ID
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
        'SELECT
            M.Movie_ID,
            M.Title,
            T.Name AS Theater_name,
            MSI.Start_time,
            MSI.End_time,
            M.Description,
            MSI.Room_no AS Theater_room_no
        FROM
            Movie AS M,
            MOVIE_SHOWING_INSTANCE AS MSI,
            THEATER AS T
        WHERE
            M.Movie_ID = MSI.Movie_ID
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
        'SELECT
            M.Movie_ID,
            M.Title,
            T.Name AS Theater_name,
            MSI.Start_time,
            MSI.End_time,
            M.Description,
            MSI.Room_no AS Theater_room_no
        FROM
            Movie AS M,
            MOVIE_SHOWING_INSTANCE AS MSI,
            THEATER AS T
        WHERE
            M.Movie_ID = MSI.Movie_ID
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
        'SELECT
            DISTINCT M.Movie_ID,
            M.Title,
            M.MPAA_rating,
            M.Description
        FROM
            Movie AS M
        WHERE
            M.Movie_ID
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
        'SELECT
            MG.genre
        FROM
            Movie AS M,
            MOVIE_GENRE AS MG
        WHERE
            M.Movie_ID = MG.Movie_ID
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `language_endpoint`(`language` VARCHAR(50))
BEGIN
    PREPARE statement FROM
        'SELECT
            DISTINCT M.Movie_ID,
            M.Title,
            M.Overall_rating,
            M.Release,
            M.Length,
            M.Description,
            M.Gross
        FROM
            Movie AS M,
            MOVIE_LANGUAGE AS ML
        WHERE
            M.Movie_ID = ML.Movie_ID
            AND ML.Language = ?';
    SET @language = `language`;
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
        'SELECT
            M.Movie_ID,
            M.Title,
            M.Overall_rating,
            M.Length,
            M.Description,
            M.Release
        FROM
            Movie AS M
        WHERE
            M.Release > CURDATE()';
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Add movie endpoint
-- -------------------------
DROP procedure IF EXISTS `add_movie_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE`add_movie_endpoint`
                                            (title VARCHAR(50),
                                             release_date DATE,
                                             movie_length INT,
                                             description_text TEXT,
                                             mpaa_rating VARCHAR(10))
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            Movie (
                `Description`,
                `Length`,
                MPAA_rating,
                Title,
                `Release`
            )
        VALUES
            (?, ?, ?, ?, ?)';
    SET @title = title;
    SET @release_date = release_date;
    SET @movie_length = movie_length;
    SET @description_text = description_text;
    SET @mpaa_rating = mpaa_rating;
    EXECUTE statement USING @description_text, @movie_length, @mpaa_rating, @title, @release_date;
    DEALLOCATE PREPARE statement;
    PREPARE statement FROM
    'SELECT LAST_INSERT_ID()';
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Add film worker endpoint
-- -------------------------
DROP procedure IF EXISTS `add_film_worker`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_film_worker`
                                            (First_name VARCHAR(60),
                                             Middle_name VARCHAR(60),
                                             Last_name VARCHAR(60),
                                             Director_flag BINARY,
                                             Performer_flag BINARY)
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            FILM_WORKER (
                First_name,
                Middle_name,
                Last_name,
                Director_flag,
                Performer_flag
            )
        VALUES
            (?, ?, ?, ?, ?)';
    SET @First_name = First_name;
    SET @Middle_name = Middle_name;
    SET @Last_name = Last_name;
    SET @Director_flag = Director_flag;
    SET @Performer_flag = Performer_flag;
    EXECUTE statement USING @First_name, @Middle_name, @Last_name, @Director_flag, @Performer_flag;
    DEALLOCATE PREPARE statement;
    PREPARE statement FROM
    'SELECT LAST_INSERT_ID()';
    EXECUTE statement;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Add genre for movie procedure
-- -------------------------
DROP procedure IF EXISTS `add_genre`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_genre`(Movie_ID INT, Genre VARCHAR(50))
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            MOVIE_GENRE (Movie_ID, Genre)
        VALUES
            (?, ?)';
    SET @Movie_ID = Movie_ID;
    SET @Genre = Genre;
    EXECUTE statement USING @Movie_ID, @Genre;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Add performer to movie procedure
-- -------------------------
DROP procedure IF EXISTS `add_performer_to_movie`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_performer_to_movie`(Movie_ID INT, Performer_ID INT)
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            PERFORMS_IN (Performer_ID, Movie_ID)
        VALUES
            (?, ?)';
    SET @Movie_ID = Movie_ID;
    SET @Performer_ID = Performer_ID;
    EXECUTE statement USING @Performer_ID, @Movie_ID;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Add director to movie procedure
-- -------------------------
DROP procedure IF EXISTS `add_director_to_movie`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_director_to_movie`(Movie_ID INT, Director_ID INT)
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            DIRECTS (Director_ID, Movie_ID)
        VALUES
            (?, ?)';
    SET @Movie_ID = Movie_ID;
    SET @Director_ID = Director_ID;
    EXECUTE statement USING @Director_ID, @Movie_ID;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -------------------------
-- Add language to movie procedure
-- -------------------------
DROP procedure IF EXISTS `add_language`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_language`(Movie_ID INT, `language` VARCHAR(50))
BEGIN
    PREPARE statement FROM
        'INSERT INTO
            MOVIE_LANGUAGE (Movie_ID, Language)
        VALUES
            (?, ?)';
    SET @Movie_ID = Movie_ID;
    SET @language = `language`;
    EXECUTE statement USING @Movie_ID, @language;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- ----------------------------------
-- Search Performer Stored Procedure
-- ----------------------------------
DROP procedure IF EXISTS `search_performer_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_performer_endpoint`(f_name VARCHAR(60), l_name VARCHAR(60))
BEGIN
    PREPARE statement FROM
        'SELECT
            M.Movie_ID,
            M.Overall_rating,
            M.Title,
            M.Description
        FROM
            Movie AS M,
            PERFORMS_IN AS P,
            FILM_WORKER AS F
        WHERE
            M.Movie_ID = P.Movie_ID
            AND P.Performer_ID = F.Worker_ID
            AND ? = F.First_name
            AND ? = F.Last_name';
    SET @performer_name = performer_name;
    EXECUTE statement USING @performer_name;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -----------------------------
-- Give Rating Stored Procedure
-- -----------------------------
DROP procedure IF EXISTS `give_rating_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `give_rating_endpoint`(movie_title VARCHAR(50), username VARCHAR(15),
                                                                        rating INT, r_description TEXT)
BEGIN
        PREPARE statement FROM
            'INSERT INTO
                review
            VALUES (
                (SELECT Movie_ID FROM movie WHERE Title = ?),
                (SELECT User_ID FROM user WHERE Username = ?),
                (SELECT MAX(Review_ID) FROM review) + 1, ?, ?)';
        SET @movie_title = movie_title;
        SET @username = username;
        SET @rating = rating;
        SET @r_description = r_description;
        EXECUTE statement USING @movie_title, @username, @rating, @r_description;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -----------------------------
-- New Movies Stored Procedure
-- -----------------------------
DROP procedure IF EXISTS `new_movies_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_movies_endpoint`(r_date DATE)
BEGIN
        PREPARE statement FROM
            'SELECT
                M.Movie_ID,
                M.Overall_rating,
                M.Title,
                M.Description
            FROM
                Movie AS M
            WHERE
                M.Release >= ?
            ORDER BY
                M.Release DESC';
        SET @r_date = r_date;
        EXECUTE statement USING @r_date;
    DEALLOCATE PREPARE statement;
END$$
DELIMITER ;

-- -----------------------------
-- Top Gross Stored Procedure
-- -----------------------------
DROP procedure IF EXISTS `top_gross_endpoint`;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `top_gross_endpoint`(in_theatres BOOL, count INT)
BEGIN
    PREPARE statement FROM
        'SELECT
            DISTINCT M.Movie_ID,
            M.Overall_rating,
            M.Title,
            M.Description,
            M.gross
        FROM
            Movie AS M
            LEFT JOIN SHOWS AS s ON M.Movie_ID = S.Movie_ID
        WHERE
            (
                CASE
                    WHEN ? = TRUE THEN (M.Movie_ID = S.Movie_ID)
                    ELSE (
                        S.Movie_ID IS NULL
                        AND M.Movie_ID IS NOT NULL
                    )
                )
                ORDER BY
                    M.Gross DESC
                LIMIT
                    ?';
    SET @in_theatres = in_theatres;
    SET @count = count;
    EXECUTE statement USING @in_theatres, @count;
DEALLOCATE PREPARE statement;
END$$
DELIMITER ;