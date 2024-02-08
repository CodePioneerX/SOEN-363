-- Name: Haris Mahmood
-- ID: 40135271

-- MySQL was utilized for the creation of this Local Database Assignment

CREATE DATABASE MOVIE;
USE MOVIE;

-- PART 1: DDL QUERIES FOR CREATING THE DATABASE

CREATE TABLE CONTENTRATING(
	contentRating_id INT AUTO_INCREMENT PRIMARY KEY,
	rating_name VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE MOVIE (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    imdb_id VARCHAR(20) UNIQUE NOT NULL,
    title VARCHAR(255) NOT NULL,
    plot TEXT,
    rating DECIMAL(3, 1),
    content_rating_id INT,
    runtime INT,
    num_reviews INT,
    release_year INT,
    akas TEXT,
    FOREIGN KEY (content_rating_id) REFERENCES CONTENTRATING(contentRating_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE GENRES (
	genres_id INT AUTO_INCREMENT PRIMARY KEY,
	genre_name VARCHAR(255) NOT NULL,
	movie_id INT,
	FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE COUNTRY (
	country_id INT AUTO_INCREMENT PRIMARY KEY,
	country_name VARCHAR(255) NOT NULL,
	country_code CHAR(2) NOT NULL,
	movie_id INT,
	FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MovieLanguage (
	language_id INT AUTO_INCREMENT PRIMARY KEY,
	language_name VARCHAR(255) NOT NULL,
	movie_id INT,
	FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE KEYWORDS (
	keywords_id INT AUTO_INCREMENT PRIMARY KEY,
	keyword_name VARCHAR(255) NOT NULL,
	movie_id INT,
	FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PERSON (
	person_id INT AUTO_INCREMENT PRIMARY KEY,
	imdb_id VARCHAR(20) UNIQUE NOT NULL,
	person_name VARCHAR(255) NOT NULL
);

CREATE TABLE ACTOR (
	actor_id INT AUTO_INCREMENT PRIMARY KEY,
	person_id INT,
	movie_id INT,
	character_name VARCHAR(255) NOT NULL,
	FOREIGN KEY (person_id) REFERENCES PERSON(person_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE DIRECTOR (
	director_id INT AUTO_INCREMENT PRIMARY KEY,
	person_id INT,
	movie_id INT,
	FOREIGN KEY (person_id) REFERENCES PERSON(person_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CREATOR (
	creator_id INT AUTO_INCREMENT PRIMARY KEY,
	person_id INT,
	movie_id INT,
	FOREIGN KEY (person_id) REFERENCES PERSON(person_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (movie_id) REFERENCES MOVIE(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- PART 2: DML Queries For Populating data in the database
INSERT INTO CONTENTRATING (rating_name)
VALUES ('PG-13'), ('R'), ('G'), ('PG');

INSERT INTO MOVIE (imdb_id, title, plot, rating, runtime, num_reviews, release_year, akas, content_rating_id)
VALUES 	('tt123456', 'The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 9.3, 25720, 142, 1994, 'Shawshank Redemption', 1),
		('tt123457', 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 9.2, 13610, 175, 1972, 'Godfather', 2),
		('tt123458', 'Pulp Fiction', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 8.9, 19480, 154, 1994, 'Pulp Fiction Movie', 3),
		('tt123459', 'The Dark Knight', 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 9.0, 14960, 152, 2008, 'Dark Knight Movie', 4),
		('tt123460', 'The Matrix', 'A computer programmer discovers that reality as he knows it is a simulation created by machines to subjugate humanity.', 8.7, 16190, 136, 1999, 'Matrix', 2),
		('tt123461', 'Forrest Gump', 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75.', 8.8, 18940, 142, 1994, 'Forrest Gump Movie', 1),
		('tt123462', 'Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', 8.8, 19810, 148, 2010, 'Inception Movie', 4),
		('tt123463', 'The Empire Strikes Back', 'After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda while his friends are pursued across the galaxy by Darth Vader and bounty hunter Boba Fett.', 8.7, 12860, 124, 1980, 'Empire Strikes Back', 3),
		('tt123464', 'Gladiator', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', 8.5, 13420, 155, 2000, 'Gladiator Movie', 2),
		('tt123465', 'The Shawshank Redemption', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 8.9, 17410, 154, 1994, 'Pulp Fiction Movie', 1),
		('tt123466', 'The Lord of the Rings: The Return of the King', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 8.9, 15780, 201, 2003, 'Return of the King', 4),
		('tt123467', 'Schindler List', 'In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', 8.9, 10930, 195, 1993, 'Schindler\'s List Movie', 3),
		('tt123469', 'The Dark Knight Rises', 'Eight years after the Joker reign of anarchy, Batman, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City from the brutal guerrilla terrorist Bane.', 8.4, 13250, 165, 2012, 'Dark Knight Rises', 2),
		('tt123470', 'The Silence of the Lambs', 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', 8.6, 13960, 118, 1991, 'Silence of the Lambs', 3),
		('tt123471', 'Saving Private Ryan', 'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.', 8.6, 14490, 169, 1998, 'Saving Private Ryan Movie', 4),
		('tt123472', 'The Green Mile', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 8.6, 12930, 189, 1999, 'Green Mile Movie', 1),
		('tt123474', 'Fight Club', 'An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.', 8.8, 17920, 139, 1999, 'Fight Club Movie', 3),
        ('tt123475', 'The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the One Ring and the Dark Lord Sauron.', 8.8, 18150, 178, 2001, 'Fellowship of the Ring', 1),
		('tt123476', 'The Godfather: Part II', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 9.0, 9870, 202, 1974, 'Godfather Part II', 2),
        ('tt123477', 'The Lord of the Rings: The Two Towers', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron\'s new ally, Saruman, and his hordes of Isengard.', 8.7, 13540, 179, 2002, 'Two Towers', 3),
        ('tt123480', 'Avatar', 'A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', 7.8, 15560, 162, 2009, 'Avatar Movie', 2),
        ('tt123486', 'The Lion King', 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.', 8.5, 13820, 172, 1994, 'The Lion King', 1),
		('tt123487', 'Aladdin', 'A kind-hearted street urchin and a power-hungry Grand Vizier vie for a magic lamp that has the power to make their deepest wishes come true.', 8.0, 11930, 128, 1992, 'Aladdin', 1),
		('tt123488', 'Beauty and the Beast', 'A prince cursed to spend his days as a hideous monster sets out to regain his humanity by earning a young woman\'s love.', 8.0, 12680, 146, 1991, 'Beauty and the Beast', 1),
		('tt123489', 'Frozen', 'When the newly crowned Queen Elsa accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister Anna teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.', 7.4, 14750, 102, 2013, 'Frozen', 1),
		('tt123490', 'Moana', 'In Ancient Polynesia, when a terrible curse incurred by the Demigod Maui reaches Moana\'s island, she answers the Ocean\'s call to seek out the Demigod to set things right.', 7.6, 16540, 107, 2016, 'Moana', 1),
		('tt123491', 'Zootopia', 'In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox must work together to uncover a conspiracy.', 8.0, 14730, 109, 2016, 'Zootopia', 1),
		('tt123492', 'Toy Story', 'A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy\'s room.', 8.3, 14050, 81, 1995, 'Toy Story', 1),
		('tt123493', 'The Little Mermaid', 'A mermaid princess makes a Faustian bargain in an attempt to become human and win a prince\'s love.', 7.6, 11790, 133, 1989, 'The Little Mermaid', 1),
		('tt123494', 'Cinderella', 'When her father unexpectedly dies, young Ella finds herself at the mercy of her cruel stepmother and her scheming stepsisters.', 7.3, 11960, 117, 2015, 'Cinderella', 1),
		('tt123495', 'Mulan', 'To save her father from death in the army, a young maiden secretly goes in his place and becomes one of China\'s greatest heroines in the process.', 7.6, 14520, 113, 1998, 'Mulan', 1),
		('tt123496', 'Finding Nemo', 'After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.', 8.1, 12450, 120, 2003, 'Finding Nemo', 1),
        ('tt123497', 'Toy Story 2', 'When Woody is stolen by a toy collector, Buzz and his friends set out on a rescue mission to save Woody before he becomes a museum toy property with his roundup gang Jessie, Prospector, and Bullseye.', 7.9, 10760, 97, 1999, 'Toy Story 2', 1),
		('tt123498', 'The Incredibles', 'A family of undercover superheroes, while trying to live the quiet suburban life, is forced into action to save the world.', 8.0, 14030, 135, 2004, 'The Incredibles', 1),
		('tt123499', 'Ratatouille', 'A rat who can cook makes an unusual alliance with a young kitchen worker at a famous restaurant.', 8.0, 12640, 141, 2007, 'Ratatouille', 1),
		('tt123500', 'Up', 'Seventy-eight year old Carl Fredricksen travels to Paradise Falls in his home equipped with balloons, inadvertently taking a young stowaway.', 8.2, 11870, 125, 2009, 'Up', 1),
		('tt123501', 'Cars', 'A hot-shot race-car named Lightning McQueen gets waylaid in Radiator Springs, where he finds the true meaning of friendship and family.', 7.1, 10930, 101, 2006, 'Cars', 1),
		('tt123502', 'Tangled', 'The magically long-haired Rapunzel has spent her entire life in a tower, but now that a runaway thief has stumbled upon her, she is about to discover the world for the first time and who she really is.', 7.7, 13470, 126, 2010, 'Tangled', 1),
		('tt123503', 'Frozen II', 'Anna, Elsa, Kristoff, Olaf, and Sven leave Arendelle to travel to an ancient, autumn-bound forest of an enchanted land. They set out to find the origin of Elsa\'s powers in order to save their kingdom.', 6.9, 9850, 104, 2019, 'Frozen II', 1),
		('tt123504', 'Coco', 'Aspiring musician Miguel, confronted with his family\'s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.', 8.4, 11530, 151, 2017, 'Coco', 1),
        ('tt123506', 'Iron Man', 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', 7.9, 16250, 126, 2008, 'Iron Man', 4),
		('tt123507', 'The Avengers', 'Earth\'s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.', 8.0, 18470, 143, 2012, 'The Avengers', 4),
		('tt123508', 'Guardians of the Galaxy', 'A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.', 8.0, 15560, 121, 2014, 'Guardians of the Galaxy', 4),
		('tt123509', 'Spider-Man: Homecoming', 'Peter Parker tries to balance his life as an ordinary high school student in Queens with his superhero alter-ego Spider-Man and must confront a new menace prowling the skies of New York City.', 7.4, 14190, 133, 2017, 'Spider-Man: Homecoming', 4),
		('tt123510', 'Black Panther', 'T\'Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country\'s past.', 7.3, 13920, 135, 2018, 'Black Panther', 4),
		('tt123511', 'Doctor Strange', 'While on a journey of physical and spiritual healing, a brilliant neurosurgeon is drawn into the world of the mystic arts.', 7.5, 13180, 115, 2016, 'Doctor Strange', 4),
		('tt123512', 'Thor: Ragnarok', 'Imprisoned on the planet Sakaar, Thor must race against time to return to Asgard and stop Ragnarök, the destruction of his world, at the hands of the powerful and ruthless Hela.', 7.9, 13630, 130, 2017, 'Thor: Ragnarok', 4),
		('tt123513', 'Ant-Man', 'Armed with a super-suit with the astonishing ability to shrink in scale but increase in strength, cat burglar Scott Lang must embrace his inner hero and help his mentor, Dr. Hank Pym, plan and pull off a heist that will save the world.', 7.3, 11850, 118, 2015, 'Ant-Man', 4),
		('tt123514', 'Captain America: The Winter Soldier', 'As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat from history: an assassin known as the Winter Soldier.', 7.7, 12470, 136, 2014, 'Captain America: The Winter Soldier', 4),
		('tt123515', 'The Falcon and the Winter Soldier', 'Following the events of "Avengers: Endgame", the Falcon and the Winter Soldier team up in a global adventure that tests their abilities and their patience.', 7.4, 11290, 98, 2021, 'The Falcon and the Winter Soldier', 4),
		('tt123516', 'Spider-Man: Into the Spider-Verse', 'Teen Miles Morales becomes Spider-Man of his reality, crossing his path with five counterparts from other dimensions to stop a threat for all realities.', 8.4, 10520, 117, 2018, 'Spider-Man: Into the Spider-Verse', 4);	

INSERT INTO GENRES (genre_name, movie_id) 
VALUES  ('Drama', 1),
		('Crime', 2),
		('Drama', 2),
		('Crime', 3),
		('Thriller', 3),
		('Action', 4),
		('Crime', 4),
		('Drama', 5),
		('Sci-Fi', 5),
		('Action', 5),
		('Comedy', 6),
		('Drama', 6),
		('Romance', 6),
		('Action', 7),
		('Adventure', 7),
		('Sci-Fi', 7),
		('Action', 8),
		('Adventure', 8),
		('Fantasy', 8),
		('Action', 9),
		('Adventure', 9),
		('Drama', 9),
		('Biography', 9),
		('Action', 10),
		('Adventure', 10),
		('Sci-Fi', 10),
		('Crime', 11),
		('Drama', 11),
		('Biography', 11),
		('Action', 12),
		('Crime', 12),
		('Drama', 12),
		('War', 12),
		('Crime', 13),
		('Drama', 13),
		('Thriller', 13),
		('Action', 14),
		('Adventure', 14),
		('Fantasy', 14),
		('Drama', 15),
		('Fantasy', 15),
		('Adventure', 15),
		('Action', 16),
		('Adventure', 16),
		('Drama', 16),
		('Action', 17),
		('Crime', 17),
		('Drama', 17),
		('Mystery', 17),
		('Adventure', 18),
		('Fantasy', 18),
		('Drama', 18),
		('Action', 19),
		('Crime', 19),
		('Thriller', 19),
		('Animation', 20),
		('Adventure', 20),
		('Action', 21),
		('Adventure', 21),
		('Drama', 21),
		('Animation', 22),
		('Adventure', 22),
		('Comedy', 22),
		('Action', 23),
		('Adventure', 23),
		('Fantasy', 23),
		('Action', 24),
		('Adventure', 24),
		('Sci-Fi', 24),
		('Adventure', 25),
		('Drama', 25),
		('Family', 25),
		('Animation', 26),
		('Adventure', 26),
		('Comedy', 26),
		('Adventure', 27),
		('Animation', 27),
		('Comedy', 27),
		('Animation', 28),
		('Adventure', 28),
		('Comedy', 28),
		('Animation', 29),
		('Drama', 29),
		('Family', 29),
		('Animation', 30),
		('Family', 30),
		('Fantasy', 30),
		('Animation', 31),
		('Drama', 31),
		('Family', 31),
		('Animation', 32),
		('Adventure', 32),
		('Comedy', 32),
		('Animation', 33),
		('Adventure', 33),
		('Drama', 33),
		('Animation', 34),
		('Family', 34),
		('Fantasy', 34),
		('Animation', 35),
		('Adventure', 35),
		('Comedy', 35),
		('Animation', 36),
		('Adventure', 36),
		('Comedy', 36),
		('Animation', 37),
		('Adventure', 37),
		('Comedy', 37),
		('Animation', 38),
		('Adventure', 38),
		('Comedy', 38),
		('Action', 39),
		('Adventure', 39),
		('Comedy', 39),
		('Action', 40),
		('Adventure', 40),
		('Comedy', 40),
		('Action', 41),
		('Adventure', 41),
		('Sci-Fi', 41),
		('Action', 42),
		('Adventure', 42),
		('Comedy', 42),
		('Action', 43),
		('Adventure', 43),
		('Comedy', 43),
		('Action', 44),
		('Adventure', 44),
		('Sci-Fi', 44),
		('Action', 45),
		('Adventure', 45),
		('Fantasy', 45),
		('Action', 46),
		('Adventure', 46),
		('Sci-Fi', 46),
		('Action', 47),
		('Adventure', 47),
		('Comedy', 47),
		('Action', 48),
		('Adventure', 48),
		('Fantasy', 48),
		('Action', 49),
		('Adventure', 49),
		('Sci-Fi', 49),
		('Action', 50),
		('Adventure', 50),
		('Comedy', 50),
		('Action', 51),
		('Adventure', 51),
		('Comedy', 51);
    
INSERT INTO COUNTRY (country_name, country_code, movie_id) 
VALUES  ('USA', 'US', 1),
		('Canada', 'CA', 1),
		('UK', 'GB', 1),
		('USA', 'US', 2),
		('Italy', 'IT', 2),
		('France', 'FR', 2),
		('USA', 'US', 3),
		('USA', 'US', 4),
		('Canada', 'CA', 4),
		('USA', 'US', 5),
		('USA', 'US', 6),
		('Japan', 'JP', 6),
		('USA', 'US', 7),
		('USA', 'US', 8),
		('UK', 'GB', 8),
		('France', 'FR', 8),
		('Germany', 'DE', 8),
		('India', 'IN', 9),
		('USA', 'US', 10),
		('Canada', 'CA', 10),
		('USA', 'US', 11),
		('USA', 'US', 12),
		('Japan', 'JP', 12),
		('USA', 'US', 13),
		('USA', 'US', 14),
		('UK', 'GB', 14),
		('France', 'FR', 14),
		('Germany', 'DE', 14),
		('Japan', 'JP', 14),
		('India', 'IN', 14),
		('South Korea', 'KR', 14),
		('USA', 'US', 15),
		('China', 'CN', 15),
		('Russia', 'RU', 15),
		('USA', 'US', 16),
		('Brazil', 'BR', 16),
		('USA', 'US', 17),
		('Canada', 'CA', 17),
		('UK', 'GB', 17),
		('Germany', 'DE', 17),
		('France', 'FR', 17),
		('Italy', 'IT', 17),
		('USA', 'US', 18),
		('USA', 'US', 19),
		('Canada', 'CA', 19),
		('USA', 'US', 20),
		('USA', 'US', 21),
		('Japan', 'JP', 21),
		('USA', 'US', 22),
		('USA', 'US', 23),
		('UK', 'GB', 23),
		('France', 'FR', 23),
		('Germany', 'DE', 23),
		('USA', 'US', 24),
		('India', 'IN', 24),
		('USA', 'US', 25),
		('Canada', 'CA', 25),
		('USA', 'US', 26),
		('USA', 'US', 27),
		('Japan', 'JP', 27),
		('USA', 'US', 28),
		('USA', 'US', 29),
		('UK', 'GB', 29),
		('France', 'FR', 29),
		('Germany', 'DE', 29),
		('USA', 'US', 30),
		('Japan', 'JP', 30),
		('India', 'IN', 30),
		('South Korea', 'KR', 30),
		('USA', 'US', 31),
		('China', 'CN', 31),
		('Russia', 'RU', 31),
		('USA', 'US', 32),
		('Brazil', 'BR', 32),
		('USA', 'US', 33),
		('Canada', 'CA', 33),
		('UK', 'GB', 33),
		('Germany', 'DE', 33),
		('France', 'FR', 33),
		('Italy', 'IT', 33),
		('USA', 'US', 34),
		('USA', 'US', 35),
		 ('USA', 'US', 35),
		('Canada', 'CA', 35),
		('USA', 'US', 36),
		('Canada', 'CA', 36),
		('USA', 'US', 37),
		('UK', 'GB', 37),
		('USA', 'US', 38),
		('USA', 'US', 39),
		('Canada', 'CA', 39),
		('USA', 'US', 40),
		('USA', 'US', 41),
		('Japan', 'JP', 41),
		('USA', 'US', 42),
		('USA', 'US', 43),
		('UK', 'GB', 43),
		('France', 'FR', 43),
		('Germany', 'DE', 43),
		('USA', 'US', 44),
		('India', 'IN', 44),
		('USA', 'US', 45),
		('Canada', 'CA', 45),
		('USA', 'US', 46),
		('USA', 'US', 47),
		('Japan', 'JP', 47),
		('USA', 'US', 48),
		('USA', 'US', 49),
		('UK', 'GB', 49),
		('France', 'FR', 49),
		('Germany', 'DE', 49),
		('USA', 'US', 50),
		('Japan', 'JP', 50),
		('India', 'IN', 50),
		('South Korea', 'KR', 50),
		('China', 'CN', 51),
		('Russia', 'RU', 51);
    
INSERT INTO MovieLanguage (language_name, movie_id) 
VALUES  ('English', 1),
		('Italian', 2),
		('English', 2),
		('French', 2),
		('English', 3),
		('English', 4),
		('French', 4),
		('English', 5),
		('English', 6),
		('English', 7),
		('English', 8),
		('French', 8),
		('German', 8),
		('Hindi', 9),
		('English', 10),
		('English', 11),
		('Japanese', 11),
		('English', 12),
		('English', 13),
		('English', 14),
		('French', 14),
		('German', 14),
		('Japanese', 14),
		('Hindi', 14),
		('Korean', 14),
		('English', 15),
		('Chinese', 15),
		('Russian', 15),
		('English', 16),
		('Portuguese', 16),
		('English', 17),
		('French', 17),
		('Italian', 17),
		('German', 17),
		('English', 18),
		('English', 19),
		('French', 19),
		('English', 20),
		('English', 21),
		('Japanese', 21),
		('English', 22),
		('English', 23),
		('French', 23),
		('German', 23),
		('English', 24),
		('Hindi', 24),
		('English', 25),
		('English', 26),
		('Japanese', 26),
		('English', 27),
		('English', 28),
		('English', 29),
		('French', 29),
		('German', 29),
		('Japanese', 29),
		('Hindi', 29),
		('Korean', 29),
		('English', 30),
		('Japanese', 30),
		('Hindi', 30),
		('Korean', 30),
		('English', 31),
		('Chinese', 31),
		('Russian', 31),
		('English', 32),
		('Portuguese', 32),
		('English', 33),
		('French', 33),
		('Italian', 33),
		('German', 33),
		('English', 34),
		('French', 35),
		('English', 36),
		('English', 37),
		('French', 37),
		('English', 38),
		('English', 39),
		('French Canadian', 39),
		('English', 40),
		('English', 41),
		('Japanese', 41),
		('English', 42),
		('English', 43),
		('French', 43),
		('German', 43),
		('English', 44),
		('Hindi', 44),
		('English', 45),
		('Japanese', 46),
		('English', 47),
		('English', 48),
		('English', 49),
		('French Canadian', 49),
		('German', 49),
		('English', 50),
		('Japanese', 50),
		('Hindi', 50),
		('Korean', 50),
		('Chinese', 51),
		('Russian', 51);
    
INSERT INTO KEYWORDS (keyword_name, movie_id)
VALUES  ('Prison', 1),
		('Friendship', 1),
		('Redemption', 1),
        ('Crime', 1),
        ('Mafia', 1),
        ('Family', 1),
		('Crime', 2),
		('Mafia', 2),
		('Family', 2),
		('Violence', 3),
		('Redemption', 3),
		('Crime', 3),
		('Superhero', 4),
		('Crime', 4),
		('Action', 4),
		('Science Fiction', 5),
		('Virtual Reality', 5),
		('Action', 5),
		('Adventure', 6),
		('Comedy', 6),
		('Drama', 6),
		('Superhero', 7),
		('Dreams', 7),
        ('Adventure', 8),
		('Action', 8),
		('Science Fiction', 8),
		('Fantasy', 8),
        ('Revenge', 9),
		('Gladiator', 9),
		('Action', 9),
		('Drama', 9),
		('Boxing', 10),
		('Friendship', 11),
		('Adventure', 11),
		('Fantasy', 11),
		('War', 12),
		('Holocaust', 12),
		('Drama', 12),
        ('Superhero', 13),
		('Action', 13),
		('Thriller', 13),
        ('Crime', 14),
		('Serial Killer', 14),
		('Thriller', 14),
		('Investigation', 14),
        ('War', 15),
		('World War II', 15),
		('Drama', 15),
		('Action', 15),
        ('Drama', 16),
		('Death Row', 16),
		('Supernatural', 16),
        ('Drama', 17),
		('Psychological Thriller', 17),
		('Anarchy', 17),
        ('Fantasy', 18),
		('Adventure', 18),
		('Epic', 18),
        ('Crime', 19),
		('Mafia', 19),
		('Family', 19),
        ('Fantasy', 20),
		('Adventure', 20),
		('Epic', 20),
        ('Science Fiction', 21),
		('Adventure', 21),
		('Fantasy', 21),
        ('Animation', 22),
		('Family', 22),
		('Music', 22),
        ('Animation', 23),
		('Adventure', 23),
		('Fantasy', 23),
        ('Animation', 24),
		('Fantasy', 24),
		('Romance', 24),
		('Animation', 25),
		('Adventure', 25),
		('Music', 25),
        ('Animation', 26),
		('Adventure', 26),
		('Family', 26),
        ('Animation', 27),
		('Adventure', 27),
		('Comedy', 27),
        ('Animation', 28),
		('Adventure', 28),
		('Comedy', 28),
        ('Animation', 29),
		('Fantasy', 29),
		('Romance', 29),
        ('Animation', 30),
		('Family', 30),
		('Romance', 30),
		('Animation', 31),
		('Adventure', 31),
		('Family', 31),
		('War', 31),
		('Heroine', 31),
        ('Animation', 32),
		('Adventure', 32),
		('Family', 32),
		('Comedy', 32),
		('Underwater', 32),
        ('Animation', 33),
		('Adventure', 33),
		('Family', 33),
		('Comedy', 33),
		('Toys', 33),
        ('Animation', 34),
		('Adventure', 34),
		('Family', 34),
		('Superhero', 34),
		('Action', 34),
        ('Animation', 35),
		('Comedy', 35),
		('Family', 35),
		('Culinary', 35),
		('Rats', 35),
        ('Animation', 36),
		('Adventure', 36),
		('Family', 36),
		('Comedy', 36),
		('Balloons', 36),
        ('Animation', 37),
		('Adventure', 37),
		('Family', 37),
		('Comedy', 37),
		('Racing', 37),
        ('Animation', 38),
		('Adventure', 38),
		('Family', 38),
		('Fantasy', 38),
		('Rapunzel', 38),
		('Animation', 39),
		('Adventure', 39),
		('Family', 39),
		('Fantasy', 39),
		('Magic', 39),
        ('Animation', 40),
		('Adventure', 40),
		('Family', 40),
		('Music', 40),
		('Day of the Dead', 40),
        ('Superhero', 41),
		('Action', 41),
		('Adventure', 41),
		('Science Fiction', 41),
		('Technology', 41),
        ('Superhero', 42),
		('Action', 42),
		('Adventure', 42),
		('Science Fiction', 42),
		('Team', 42),
		('Superhero', 43),
		('Action', 43),
		('Adventure', 43),
		('Science Fiction', 43),
		('Space', 43),
		('Superhero', 44),
		('Action', 44),
		('Adventure', 44),
		('Science Fiction', 44),
		('High School', 44),
        ('Superhero', 45),
		('Action', 45),
		('Adventure', 45),
		('Science Fiction', 45),
		('Wakanda', 45),
		('Superhero', 46),
		('Action', 46),
		('Adventure', 46),
		('Magic', 46),
		('Mystic Arts', 46),
        ('Superhero', 47),
		('Action', 47),
		('Adventure', 47),
		('Science Fiction', 47),
		('Asgard', 47),
		('Superhero', 48),
		('Action', 48),
		('Adventure', 48),
		('Science Fiction', 48),
		('Shrinking', 48),
		('Superhero', 49),
		('Action', 49),
		('Adventure', 49),
		('Espionage', 49),
		('Winter Soldier', 49),
        ('Superhero', 50),
		('Action', 50),
		('Adventure', 50),
		('Science Fiction', 50),
		('Team-up', 50),
		('Superhero', 51),
		('Animation', 51),
		('Adventure', 51),
		('Science Fiction', 51),
		('Multiverse', 51),
        ('Amazing', 51);
        
INSERT INTO PERSON (imdb_id, person_name) 
VALUES  ('tt123517', 'Tim Robbins'),
		('tt123518', 'Marlon Brando'),
		('tt123519', 'Quentin Tarantino'),
		('tt123520', 'Christian Bale'),
		('tt123521', 'Keanu Reeves'),
		('tt123522', 'Tom Hanks'),
		('tt123523', 'Leonardo DiCaprio'),
		('tt123524', 'Mark Hamill'),
		('tt123525', 'Russell Crowe'),
		('tt123526', 'Morgan Freeman'),
		('tt123527', 'Tommy'),
		('tt123528', 'Liam Neeson'),
		('tt123529', 'Christian Bale'),
		('tt123530', 'Jodie Foster'),
		('tt123531', 'THanks Jr'),
		('tt123532', 'Tom Sr'),
		('tt123533', 'Edward Norton'),
		('tt123534', 'Elijah Wood'),
		('tt123535', 'Al Pacino'),
		('tt123536', 'Elijah Wood'),
		('tt123537', 'Sam Worthington'),
		('tt123538', 'Matthew Broderick'),
		('tt123539', 'Scott Weinger'),
		('tt123540', 'Robby Benson'),
		('tt123541', 'Kristen Bell'),
		('tt123542', 'Auli Cravalho'),
		('tt123543', 'Dwayne Johnson'),
		('tt123544', 'Jason Bateman'),
		('tt123545', 'Timmothy Hanks'),
		('tt123546', 'Jodie Benson'),
		('tt123547', 'Lily James'),
		('tt123548', 'Ming-Na Wen'),
		('tt123549', 'Albert Brooks'),
		('tt123550', 'Tina Scarlet'),
		('tt123551', 'Craig T. Nelson'),
		('tt123552', 'Patton Oswalt'),
		('tt123553', 'Ed Asner'),
		('tt123554', 'Owen Wilson'),
		('tt123555', 'Mandy Moore'),
		('tt123556', 'Anthony Gonzalez'),
		('tt123557', 'Robert Downey Jr.'),
		('tt123558', 'Chris Evans'),
		('tt123559', 'Chris Pratt'),
		('tt123560', 'Tom Holland'),
		('tt123561', 'Chadwick Boseman'),
		('tt123562', 'Benedict Cumberbatch'),
		('tt123563', 'Chris Hemsworth'),
		('tt123564', 'Paul Rudd'),
		('tt123565', 'Chris Evans'),
		('tt123566', 'Sebastian Stan'),
		('tt123567', 'Shameik Moore');


INSERT INTO ACTOR (person_id, movie_id, character_name)
VALUES
    (1, 1, 'Andy Dufresne'),
    (2, 2, 'Don Vito Corleone'),
    (2, 3, 'Something'),
    (4, 4, 'Bruce Wayne / Batman'),
    (4, 5, 'Bob the builder'),
    (6, 6, 'Forrest Gump'),
	(6, 7, 'Hello'),
    (8, 8, 'Luke Skywalker'),
    (8, 9, 'Yolo'),
    (10, 10, 'Ellis Boyd "Red" Redding'),
    (12, 11, 'Oskar Schindler'),
    (12, 12, 'Oscar'),
    (12, 13, 'Carlo'),
    (14, 14, 'Clarice Starling'),
    (14, 15, 'Tree'),
    (14, 16, 'Invisible'),
    (17, 17, 'The Narrator'),
    (17, 18, 'Picolo'),
    (19, 19, 'Michael Corleone'),
    (19, 20, 'Papa Pia'),
    (21, 21, 'Jake Sully'),
    (21, 22, 'Clapped'),
    (23, 23, 'Aladdin'),
    (25, 24, 'Beast (voice)'),
	(25, 25, 'Radio'),
    (25, 26, 'Dina'),
    (27, 27, 'Maui (voice)'),
    (27, 28, 'Genshin'),
    (30, 29, 'Ariel (voice)'),
	(30, 30, 'Smt'),
    (32, 31, 'Captain Li Shang (voice)'),
	(32, 32, 'Li)'),
    (32, 33, 'Lelo)'),
    (32, 34, 'coco)'),
    (35, 35, 'Bob'),
    (37, 36, 'Carl Fredricksen (voice)'),
    (37, 37, 'Billy'),
    (39, 38, 'Rapunzel (voice)'),
    (39, 39, 'RaRa'),
	(39, 40, 'YAYA'),
    (41, 41, 'Tony Stark / Iron Man'),
    (41, 42, 'Tony'),
    (43, 43, 'Peter Quill / Star-Lord'),
    (41, 44, 'Peter qu'),
    (45, 45, 'T\'Challa / Black Panther'),
    (45, 46, 'T Man'),
    (47, 47, 'Dr. Stephen Strange'),
	(47, 48, 'L man'),
    (49, 49, 'Scott Lang / Ant-Man'),
    (49, 50, 'U man'),
    (51, 51, 'Miles Morales / Spider-Man');

INSERT INTO DIRECTOR (person_id, movie_id)
VALUES
    (2,1),
	(3,1),
    (2,2),
    (2,3), 
    (3,3),
    (5,4),
    (5,5),
    (7,6),
    (7,7), 
    (9,8),
    (9,9), 
    (11,10),
    (11,11),
    (11,12),
    (13,13), 
    (13,14),
    (15,15),
    (15,16),
    (15,17),
    (18,18), 
	(18,19), 
    (20,20),
    (20,21), 
    (22,22),
    (22,23), 
    (24,24), 
    (22,25), 
    (26,26),
    (26,27), 
    (28,28),
    (28,29),
    (28,30), 
    (31,31),
    (31,32),
    (33,33),
	(33,34),
	(33,35),
    (36,36),
	(33,37),
    (38,38),
    (38,39), 
    (40,40),
	(40,41), 
    (42,42),
    (42,43), 
    (44,44),
    (44,45), 
    (46,46),
    (46,47), 
    (48,48),
	(48,49),
    (50,50),
	(50,51); 

INSERT INTO CREATOR (person_id, movie_id)
VALUES
	(2,1),
	(16,1),
    (16,2),
    (16,3), 
    (16,4),
    (29,5),
    (29,6),
    (29,7), 
    (29,8),
    (34,9), 
    (34,10),
    (34,11),
    (34,12),
    (34,13), 
    (16,14),
    (16,15),
    (16,16),
    (16,17),
    (16,18), 
	(29,19), 
    (29,20),
    (29,21), 
    (29,22),
    (29,23), 
    (29,24), 
    (34,25), 
    (34,26),
    (34,27), 
    (34,28),
    (34,29),
    (34,30), 
    (34,31),
    (34,32),
    (34,33),
	(34,34),
	(34,35),
    (34,36),
	(34,37),
    (34,38),
    (34,39), 
    (34,40),
	(34,41), 
    (34,42),
    (34,43), 
    (34,44),
    (34,45), 
    (34,46),
    (34,47), 
    (34,48),
	(34,49),
    (34,50),
	(34,51);
  
-- Part 3
CREATE VIEW movieSummary AS
SELECT
    M.imdb_id,
    M.title,
    M.plot AS description,
    M.rating,
    CR.rating_name AS content_rating,
    M.runtime,
    (
        SELECT COUNT(*)
        FROM KEYWORDS K
        WHERE K.movie_id = M.movie_id
    ) AS number_of_keywords,
    (
        SELECT COUNT(*)
        FROM COUNTRY C
        WHERE C.movie_id = M.movie_id
    ) AS number_of_countries
FROM
    MOVIE AS M
LEFT JOIN CONTENTRATING AS CR ON M.content_rating_id = CR.contentRating_id;

CREATE VIEW peopleSummary AS
SELECT
    P.imdb_id AS imdb_key,
    P.person_name AS name,
    CASE WHEN A.person_id IS NOT NULL THEN 'Yes' ELSE 'No' END AS is_actor,
    CASE WHEN D.person_id IS NOT NULL THEN 'Yes' ELSE 'No' END AS is_director,
    CASE WHEN C.person_id IS NOT NULL THEN 'Yes' ELSE 'No' END AS is_creator,
    (
        SELECT COUNT(MC.movie_id)
        FROM MOVIE AS MC
        WHERE MC.movie_id IN (
            SELECT MA.movie_id
            FROM ACTOR AS MA
            WHERE MA.person_id = P.person_id
            UNION
            SELECT MD.movie_id
            FROM DIRECTOR AS MD
            WHERE MD.person_id = P.person_id
            UNION
            SELECT MC.movie_id
            FROM CREATOR AS MC
            WHERE MC.person_id = P.person_id
        )
    ) AS total_number_of_movies
FROM
    PERSON AS P
LEFT JOIN ACTOR AS A ON P.person_id = A.person_id
LEFT JOIN DIRECTOR AS D ON P.person_id = D.person_id
LEFT JOIN CREATOR AS C ON P.person_id = C.person_id
GROUP BY imdb_key;

-- Part 4 
USE MOVIE;

-- A) Find the total number of movies in the database:
SELECT COUNT(*) AS total_movies
FROM MOVIE;

-- B) Pick an actor and find all movies by that actor released before 2010:
SELECT M.imdb_id, M.title, M.release_year
FROM MOVIE M
JOIN ACTOR A ON M.movie_id = A.movie_id
JOIN PERSON P ON A.person_id = P.person_id
WHERE P.person_name = 'Liam Neeson' AND M.release_year < 2010;

-- C) Find movies with the highest number of keywords:

-- without using views
SELECT imdb_id, title, number_of_keywords
FROM (
    SELECT m.imdb_id, m.title, COUNT(k.keywords_id) AS number_of_keywords
    FROM MOVIE m
    LEFT JOIN KEYWORDS k ON m.movie_id = k.movie_id
    GROUP BY m.movie_id, m.title
) AS movieSummary
WHERE number_of_keywords = (SELECT MAX(number_of_keywords) FROM (
    SELECT COUNT(keywords_id) AS number_of_keywords
    FROM MOVIE m
    LEFT JOIN KEYWORDS k ON m.movie_id = k.movie_id
    GROUP BY m.movie_id
) AS keywordSummary);

-- with using views
SELECT imdb_id, title, number_of_keywords
FROM movieSummary
WHERE number_of_keywords = (SELECT MAX(number_of_keywords) FROM movieSummary);

-- D) Find the number of movies in more than one language:
SELECT M.title, num_languages
FROM (
    SELECT MOVIE.movie_id, COUNT(MovieLanguage.language_id) AS num_languages
    FROM MOVIE
    JOIN MovieLanguage ON MOVIE.movie_id = MovieLanguage.movie_id
    GROUP BY MOVIE.movie_id
    HAVING COUNT(MovieLanguage.language_id) > 1
) AS Subquery
JOIN MOVIE M ON Subquery.movie_id = M.movie_id;

-- E) For each language list how many movies are there in the database. Order by highest rank: 
SELECT ML.language_name, COUNT(M.movie_id) AS num_movies
FROM MovieLanguage ML
LEFT JOIN MOVIE M ON ML.movie_id = M.movie_id
GROUP BY ML.language_name
ORDER BY num_movies DESC;

-- F) List all French Canadian movies:
SELECT M.title
FROM MOVIE M
JOIN MovieLanguage ML ON M.movie_id = ML.movie_id
WHERE ML.language_name = 'French Canadian';

-- G) List all non-English movies that are not made in Canada / USA:
SELECT DISTINCT M.title
FROM MOVIE M
WHERE M.movie_id NOT IN (
    SELECT DISTINCT M.movie_id
    FROM MOVIE M
    JOIN MovieLanguage ML ON M.movie_id = ML.movie_id
    WHERE ML.language_name = 'English'
    UNION
    SELECT DISTINCT M.movie_id
    FROM MOVIE M
    JOIN COUNTRY C ON M.movie_id = C.movie_id
    WHERE C.country_name IN ('Canada', 'USA')
);

-- H) List all movies that are directed by one of its actors:
SELECT M.imdb_id, M.title, P.person_name AS Director_Actor
FROM MOVIE M
JOIN DIRECTOR D ON M.movie_id = D.movie_id
JOIN PERSON P ON D.person_id = P.person_id
JOIN ACTOR A ON M.movie_id = A.movie_id
WHERE A.person_id = D.person_id;

-- I) Find top 3 movies (higher ratings). Sort by rating as well as number of reviews.
SELECT M.imdb_id, M.title, M.rating, M.num_reviews
FROM MOVIE M
ORDER BY M.rating DESC, M.num_reviews DESC
LIMIT 3;

-- J) Find top 3 movies that have at least 10 reviews.
SELECT M.imdb_id, M.title, M.rating, M.num_reviews
FROM MOVIE M
WHERE M.num_reviews >= 10
ORDER BY M.rating DESC
LIMIT 3;
