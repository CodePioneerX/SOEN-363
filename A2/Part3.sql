-- Name: Haris Mahmood
-- ID: 40135271

-- MySQL was utilized for the creation of this Local Database Assignment

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