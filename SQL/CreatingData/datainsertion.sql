-- Admin table
INSERT INTO `movieapi`.`admin` (`Username`, `Password`) VALUES ('bobo', 'bobo');
INSERT INTO `movieapi`.`admin` (`Username`, `Password`) VALUES ('jacob', 'jacob');
INSERT INTO `movieapi`.`admin` (`Username`, `Password`) VALUES ('everest', 'everest');
INSERT INTO `movieapi`.`admin` (`Username`, `Password`) VALUES ('albert', 'albert');
INSERT INTO `movieapi`.`admin` (`Username`, `Password`) VALUES ('sarhan', 'sarhan');
INSERT INTO `movieapi`.`admin` (`Username`, `Password`) VALUES ('tanuja', 'tanuja');


-- Movie creator table
INSERT INTO `movieapi`.`movie_creator` (`Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('Albert Studios', 'Albert Studios is a mid-size movie publisher in Calgary', ' studio', '1');
INSERT INTO `movieapi`.`movie_creator` (`Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('Bobo Studios', 'Bobo Studios is a mid-size movie publisher in Calgary', ' studio', '2');
INSERT INTO `movieapi`.`movie_creator` (`Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('Jacob Studios', 'Jacob Studios is a mid-size movie publisher in Calgary', 'studio', '3');
INSERT INTO `movieapi`.`movie_creator` (`Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('Everest & co.', 'Everest Studios is a mid-size movie publisher in Calgary', 'independent', '4');
INSERT INTO `movieapi`.`movie_creator` (`Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('Sarhan & co.', 'Sarhan Studios is a mid-size movie publisher in Calgary', 'independent', '5');
INSERT INTO `movieapi`.`movie_creator` (`Name`, `Description`, `Creator_type`, `Added_by_admin`) VALUES ('Tanuja & co.', 'T Studios is a mid-size movie publisher in Calgary', 'independent', '6');

--Movies Table
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('An aging hitman recalls his time with the mob and the intersecting events with his friend, Jimmy Hoffa, through the 1950-70s.', '7.9', '209', 'R', 'The Irishman', '4');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('A poor family, the Kims, con their way into becoming the servants of a rich family, the Parks. But their easy life gets complicated when their deception is threatened with exposure.', '8.6', '132', 'R', 'Parasite', '4');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('In early 18th century England, a frail Queen Anne occupies the throne and her close friend, Lady Sarah, governs the country in her stead. When a new servant, Abigail, arrives, her charm endears her to Sarah.', '7.6', '119', 'R', 'The Favourite', '5');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('A Chinese family discovers their grandmother has only a short while left to live and decide to keep her in the dark, scheduling a wedding to gather before she dies.', '7.6', '100', 'PG', 'The Farewell I', '5');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('A family of small-time crooks take in a child they find outside in the cold.', '8.0', '121', 'R', 'Shoplifters', '6');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('Jo March (Saoirse Ronan) reflects back and forth on her life, telling the beloved story of the March sisters - four young women each determined to live life on her own terms.', '7.9', '135', 'PG', ' Little Women', '6');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.', '8.4', '181', 'PG-13', 'Avengers: Endgame', '7');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('After the death of her grandmother, Teresa comes home to her matriarchal village in a near-future Brazil to find a succession of sinister events that mobilizes all of its residents.', '7.7', '131', 'R', 'Bacurau', '7');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('April 6th, 1917. As a regiment assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.', '8.4', '119', 'R', '1917', '8');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('Kept apart by a terrible lie and a conservative society, two sisters born in Rio de Janeiro make their way through life each believing the other is living out her dreams half a world away.', '8.0', '139', 'R', 'Invisible Life', '8');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('Noah Baumbach\'s incisive and compassionate look at a marriage breaking up and a family staying together.', '8.0', '137', 'R', 'Marriage Story', '9');
INSERT INTO `movieapi`.`movie` (`Description`, `Overall_rating`, `Length`, `MPAA_rating`, `Title`, `Movie_Creator_ID`) VALUES ('On the eve of their high school graduation, two academic superstars and best friends realize they should have worked less and played more. Determined not to fall short of their peers, the girls try to cram four years of fun into one night.', '7.2', '102', 'R', 'Booksmart', '9');
