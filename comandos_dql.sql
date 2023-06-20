SELECT CONCAT( first_name, " ",last_name) AS nome FROM actor;

SELECT city.city FROM City;

SELECT * FROM film;
SELECT AVG(length) FROM film;

SELECT COUNT(film_id) FROM film;

SELECT MAX(length) FROM film;

SELECT MIN(length) FROM film;

SELECT SUM(length) FROM film;

SELECT SUM(length) AS SOMA_TOTAL FROM film;

SELECT SUM(length) AS SOMA_DURACAO_G FROM film
WHERE rating = 'G';

SELECT * FROM film
ORDER BY title DESC;

##Entre
SELECT * FROM film
WHERE length BETWEEN 50 AND 55;

SELECT * FROM film
WHERE length NOT BETWEEN 50 AND 55;

##Ou
SELECT * FROM film
WHERE rating IN('G', 'R');

##

SELECT * FROM film
WHERE title LIKE  'a%';

##
SELECT rating, SUM(rental_rate) AS SOMA FROM film
GROUP BY  rating;

##
SELECT rating, SUM(rental_rate) AS SOMA FROM film
GROUP BY rating
HAVING SUM(rental_rate) > 600;

#INNER JOIN


SELECT * FROM film;
SELECT * FROM language;

SELECT film.title , language.name, language.last_update 
FROM film  INNER JOIN language
ON language.language_id = film.language_id;

SELECT f.title , l.name, l.last_update 
FROM film AS f  INNER JOIN language as l
ON  l.language_id = f.language_id;





