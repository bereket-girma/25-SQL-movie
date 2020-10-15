-- question 1 --
SELECT *
FROM movies;
-- question 2 --
SELECT id,
    title
FROM movies
LIMIT 10;
-- question 3 --
SELECT *
FROM movies
WHERE id = 485;
-- QUESTION 4 --
SELECT *
FROM movies
WHERE title = 'Made in America (1993)';
-- QUESTION 5 --
SELECT *
FROM movies
ORDER BY title
limit 10;
-- QUESTION 6 --
SELECT *
FROM movies
WHERE title LIKE '%2002%';
-- QUESTION 7 --
SELECT *
FROM movies
WHERE title LIKE '%Godfather, the%';
-- QUESTION 8 --
SELECT *
FROM movies
WHERE genres LIKE '%Comedy%';
-- QUESTION 9 --
SELECT *
FROM movies
WHERE genres LIKE '%Comedy%'
    AND title LIKE '%2000%';
-- QUESTION 10--
SELECT *
FROM movies
WHERE genres LIKE '%Comedy%'
    AND title LIKE '%death%';
-- QUESTION 11--
SELECT *
FROM movies
WHERE (
        title LIKE '%2002%'
        OR title LIKE '%2001%'
    )
    AND title LIKE '%super%';
--Find all the ratings for the movie Godfather, show just the title and the rating--
SELECT ratings.rating,
    movies.title
FROM ratings
    INNER JOIN movies ON ratings.movie_id = movies.id
WHERE movies.title LIKE "%Godfather, The%";
--Order the previous objective by newest to oldest--
--??--
SELECT ratings.rating,
    movies.title
FROM ratings
    INNER JOIN movies ON ratings.movie_id = movies.id
WHERE movies.title LIKE "%Godfather, The%"
ORDER BY title ASC;
;

-- Order the previous objective by newest to oldest --
SELECT title,
   rating
FROM movies
   LEFT JOIN ratings ON ratings.movie_id = movies.id
WHERE movies.title LIKE "%Godfather%"
ORDER BY movies.title DESC;

-- Find the comedies from 2005 and get the title and imdbid from the links table --
SELECT title,
   imdb_Id
FROM movies m
   LEFT JOIN links ON links.movie_id = m.id
WHERE title LIKE "%(2005)%"
   AND genres LIKE "%Comedy%";

----- AGGREGATION OBJECTIVES --
-- Get the average rating for a movie --
SELECT AVG(rating)
FROM movies m
   LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 339;

-- Get the total ratings for a movie --
SELECT COUNT(rating)
FROM movies m
   LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 339 

--  Get the total movies for a genre --
SELECT COUNT(title)
FROM movies m
WHERE genres LIKE "%Comedy%" 

--  Get the average rating for a user --
SELECT AVG(rating)
FROM movies m
   LEFT JOIN ratings r ON r.user_id = m.id
WHERE m.id = 4 

--  Find the user with the most ratings --
SELECT MAX(rating)
FROM movies m
   LEFT JOIN ratings r ON r.user_id = m.id 

--  Find the user with the highest average rating --
SELECT AVG(rating) h,
   user_id
FROM ratings
GROUP BY user_id
ORDER BY h DESC
LIMIT 1 

--  Find the user with the highest average rating with more than 50 reviews --
SELECT AVG(rating) h,
   user_id,
   COUNT(rating) r
FROM ratings
GROUP BY user_id
HAVING r > 50
ORDER BY h DESC
LIMIT 1 







