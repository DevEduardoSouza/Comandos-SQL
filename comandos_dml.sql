use sakila;

##########{Comandos DML}##########

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




