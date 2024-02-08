-- Name: Haris Mahmood
-- ID: 40135271

-- MySQL was utilized for the creation of this Local Database Assignment

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
