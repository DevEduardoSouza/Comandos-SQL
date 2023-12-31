use sakila;

##########{Comandos DML}##########
##CREATE , UPDATE, DELETE COMO WHERE

##Usando o select para buscar duas colunas
SELECT actor_id, first_name FROM actor;

##Usando o select para buscar todas as colunas das tabelas
SELECT * FROM actor;

## usando WHERE
SELECT * FROM actor
WHERE last_name = 'WEST';

## usando WHERE com AND
SELECT * FROM actor
WHERE last_name = 'WEST' AND first_name = 'REESE';

SELECT * FROM payment
WHERE amount >= 10.00;

SELECT * FROM payment
WHERE amount >= 4.99 AND amount <= 7.99;

## <> diferente
SELECT * FROM payment
WHERE amount <> 4.99;

## Usando o UPDATE
#Sintax
UPDATE nometabel
SET coluna1 = valor1,
	coluna2 = valor2
WHERE condição;

SELECT * FROM actor;

UPDATE actor
SET first_name = 'Eduardo',
	last_name = 'Souza'
WHERE actor_id = 1;
 
## Usando o DELETE
#SINTAX
DELETE FROM nomeTabela
WHERE condição;

DELETE FROM actor
WHERE first_name = 'Eduardo';

use parte_dll;

select * from categorias;

INSERT INTO categorias (nome) VALUES
('Camisa Branca'),
('Camisa Azul'),
('Camisa Verde');

DELETE FROM categorias
WHERE nome = 'camisa Azul';


#############{Exercicios DML}#############

#EXER 01

SELECT * FROM customer;

UPDATE customer
SET last_name = "JOHNSON"
WHERE customer_id = 5;

SELECT * FROM film;

UPDATE film 
SET price = price * 1.1;

DELETE FROM film
WHERE length < 90;

UPDATE film
SET replacement_cost = 9.99
WHERE rating = 'PG';

#EXER 02
#Atualize o "length" de todos os filmes da tabela "film" para 120 minutos onde o "rating" seja igual a "R".
#Exclua todos os registros da tabela "payment" em que o valor do pagamento seja inferior a 5.
#Atualize a coluna "city" da tabela "address" para "New York" para todos os endereços localizados no país "United States".
#Exclua todos os registros da tabela "rental" que tenham uma data de retorno anterior a 2022-01-01.
#Atualize o "email" do cliente com "customer_id" igual a 10 para "novomail@example.com".
#Exclua todos os registros da tabela "inventory" que estejam associados a filmes que não estejam mais disponíveis na tabela "film".
SELECT * FROM film;
UPDATE film
SET  length = 120
WHERE rating = 'R';

SELECT * FROM payment;
DELETE FROM payment
WHERE amount < 1;

SELECT * FROM customer;

UPDATE customer
SET email = 'novomail@example.com'
WHERE customer_id = 10;

#EXER 03
#Atualize o "rating" dos filmes da tabela "film" para "G" onde o "length" seja menor ou igual a 60 minutos.
#Exclua todos os registros da tabela "payment" em que o valor do pagamento seja maior que 10 e a forma de pagamento seja "Cash".
#Atualize a coluna "phone" da tabela "customer" para "+1-XXX-XXX-XXXX" para todos os clientes que tenham "last_name" igual a "Smith".
#Exclua todos os registros da tabela "rental" que tenham uma data de aluguel anterior a 2022-01-01 e não tenham sido devolvidos até o momento.
#Atualize o "email" do cliente com "customer_id" igual a 15 para "novoemail@example.com".
#Exclua todos os registros da tabela "inventory" que estejam associados a filmes cuja categoria seja "Horror".
SELECT * FROM film;
UPDATE film
SET rating = "G"
WHERE length <= 60;

SELECT * FROM payment;



