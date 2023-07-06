USE sakila;
## Buscar first_name, last_name e endereço

SELECT first_name, last_name, address
FROM customer
JOIN address
ON customer.address_id = address.address_id;


## INNER JOIN: Traz em comun entres as duas tabelas

## EX: Titulo do filme e o idioma do filme
SELECT title, name 
FROM film
RIGHT JOIN language
ON film.language_id =  language.language_id;

SELECT f.title, c.name, l.name
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id 
JOIN category AS c ON c.category_id = fc.film_id  
JOIN language AS l ON f.language_id = l.language_id; 

SELECT f.title, c.name, l.name, a.first_name, a.last_name
FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id 
JOIN category AS c ON c.category_id = fc.film_id  
JOIN language AS l ON f.language_id = l.language_id
JOIN film_actor AS fa ON f.film_id = fa.film_id
JOIN actor AS a ON a.actor_id =fa.film_id 
WHERE a.last_name = 'WEST';




-- Quantidade de cidades por pais

SELECT COUNT(city), country.country AS QUANTIDADE
FROM city
JOIN country ON city.country_id = country.country_id
GROUP BY (country);
	
    
SELECT first_name, title
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id;


SELECT first_name, title
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON ;


use sakila;

SELECT c.first_name, a.address 
FROM customer AS c
JOIN address AS a ON c.address_id = a.address_id;

SELECT c.first_name, p.amount, p.payment_date
FROM customer AS c
JOIN payment AS p
ON p.customer_id = c.customer_id;

SELECT c.first_name











