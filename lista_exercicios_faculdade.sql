CREATE database lista_04;
use lista_04;

################ QUESTÃO 01 ###############

CREATE TABLE Clientes(
 id INTEGER PRIMARY KEY AUTO_INCREMENT,
 nome varchar(100),
 email varchar(100)
);

INSERT INTO Clientes (nome, email) VALUES 
("Eduardo de Souza","eduardo@gmail.com"),
("Maria Lima","marialima@gmail.com"),
("Cleide Silva","cleideilva@gmail.com"),
("Maria Lurde","marialurdes@gmail.com"),
("José Silva","josesilva@gmail.com");

INSERT INTO Clientes (nome, email) VALUES ("João","joao@exemple.com");

UPDATE Clientes
SET email = "joao@gmail.com"
WHERE email = "joao@exemple.com";

DELETE FROM Clientes
WHERE email = "joao@gmail.com";

SELECT * FROM Clientes;




################ QUESTÃO 02 ###############

CREATE TABLE categorias (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO categorias (nome)
VALUES 	("Casual"),
		("Junino"),
		("Grife");
        
SELECT * FROM categorias;



################ QUESTÃO 03 ###############

CREATE TABLE produtos(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
preco decimal(10,2) NOT NULL,
idCategoria INTEGER,
FOREIGN KEY (idCategoria) REFERENCES categorias(id)
);


INSERT INTO produtos (nome, preco, idCategoria)
VALUES 	("Camisa branca" ,  25.99, 1),
		("Camisa da Nike" ,  110.99, 3),
        ("Jaquete junina" ,  55.99, 2),
        ("Camisa da Lacoste" ,  550.99, 3),
        ("Camisa lisa azul" ,  25.99, 1);

SELECT AVG(preco) AS media_preco FROM produtos;

SELECT MIN(preco) AS preco_minimo, MAX(preco) AS preco_maximo FROM PRODUTOS;

SELECT COALESCE(preco, 0) AS preco_atualizado FROM produtos;

SELECT * FROM produtos;




################ QUESTÃO 04 ###############
CREATE TABLE departamentos(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL
);

INSERT INTO departamentos (nome)
VALUES 	("Vendas"),
		("Financeiro"),
		("RH");

SELECT * FROM departamentos;



################ QUESTÃO 05 ###############
CREATE TABLE cargos (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL
);

INSERT INTO cargos (nome)
VALUES	("Vendedor"),
		("Gerente"),
        ("Gestor de Pessoa"),
        ("Contador");
        
SELECT * FROM cargos;



################ QUESTÃO 06 ###############

CREATE TABLE funcionarios(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
idDepartamento INTEGER,
idCargo INTEGER,
FOREIGN KEY (idDepartamento) REFERENCES departamentos(id),
FOREIGN KEY (idCargo) REFERENCES cargos(id)
);

INSERT INTO funcionarios (nome, idDepartamento, idCargo)
VALUES	("Maria", 1, 1),
		("João", 1, 2),
        ("Ana", 2, 4);

SELECT * FROM funcionarios;



################ QUESTÃO 07 ###############

CREATE TABLE Pedidos(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
quantidade INTEGER DEFAULT 0,
id_cliente INTEGER,
id_produto INTEGER,
id_funcionario INTEGER,
FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
FOREIGN KEY (id_produto) REFERENCES produtos(id),
FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

INSERT INTO pedidos(quantidade, id_cliente, id_produto, id_funcionario)
VALUES	(5, 2, 1, 1),
		(3, 4, 2, 1),
        (1, 5, 3, 2),
        (3, 6, 4, 2),
        (5, 3, 5, 3);

INSERT INTO pedidos (quantidade, id_cliente, id_produto, id_funcionario)
VALUES ("2", "2", "1", "1");

UPDATE pedidos
SET quantidade = 3
WHERE id = 1;

DELETE FROM pedidos
WHERE id = 1;


SELECT  * 
FROM pedidos
JOIN Clientes ON pedidos.id = Clientes.id;

SELECT * FROM Pedidos;


################ QUESTÃO 08 ###############

SELECT Clientes.Nome AS NomeCliente, COUNT(Pedidos.ID) AS TotalPedidos
FROM Clientes
JOIN Pedidos ON Clientes.ID = Pedidos.id_cliente
GROUP BY Clientes.ID, Clientes.Nome;



################ QUESTÃO 09 ###############

SELECT Produtos.Nome AS NomeProduto, Pedidos.Quantidade, Clientes.Nome AS NomeCliente
FROM Pedidos
JOIN Produtos ON Pedidos.id_produto = Produtos.id
JOIN Clientes ON Pedidos.id_cliente = Clientes.id;


################ QUESTÃO 10 ###############
SELECT Funcionarios.Nome AS NomeFuncionario, Departamentos.Nome AS NomeDepartamento
FROM Funcionarios
JOIN Departamentos ON Funcionarios.idDepartamento = Departamentos.id;



################ QUESTÃO 11 ###############
SELECT Produtos.Nome AS NomeProduto, SUM(Pedidos.Quantidade) AS QuantidadeVendida
FROM Pedidos
JOIN Produtos ON Pedidos.id_produto = Produtos.id
GROUP BY Produtos.id, Produtos.Nome;


################ QUESTÃO 12 ###############
SELECT Clientes.Nome AS NomeCliente, Produtos.Nome AS NomeProduto, Pedidos.Quantidade
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.ID
JOIN Produtos ON Pedidos.id_produto = Produtos.ID;


################ QUESTÃO 13 ###############
SELECT Funcionarios.Nome AS NomeFuncionario, Departamentos.Nome AS NomeDepartamento, Funcionarios.idCargo
FROM Funcionarios
JOIN Departamentos ON Funcionarios.idDepartamento = Departamentos.ID;


################ QUESTÃO 14 ###############

SELECT Clientes.Nome AS NomeCliente, Produtos.Nome AS NomeProduto, Pedidos.Quantidade * Produtos.Preco AS TotalGasto
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.ID
JOIN Produtos ON Pedidos.id_produto = Produtos.ID;

################ QUESTÃO 15 ###############
SELECT Clientes.Nome AS NomeCliente, Produtos.Nome AS NomeProduto, AVG(Pedidos.Quantidade) AS MediaQuantidade
FROM Pedidos
JOIN Clientes ON Pedidos.id_cliente = Clientes.ID
JOIN Produtos ON Pedidos.id_produto = Produtos.ID
GROUP BY Clientes.ID, Produtos.ID;

################ QUESTÃO 16 ###############

SELECT Funcionarios.Nome AS NomeFuncionario, Departamentos.Nome AS NomeDepartamento, COUNT(*) AS QuantidadeFuncionarios
FROM Funcionarios
JOIN Departamentos ON Funcionarios.idDepartamento = Departamentos.ID
GROUP BY Departamentos.ID, Departamentos.Nome;

################ QUESTÃO 17 ###############

SELECT Produtos.Nome AS NomeProduto, Categorias.Nome AS NomeCategoria, SUM(Pedidos.Quantidade) AS TotalVendas
FROM Pedidos
JOIN Produtos ON Pedidos.id_produto = Produtos.ID
JOIN Categorias ON Produtos.idCategoria = Categorias.ID
GROUP BY Produtos.ID, Produtos.Nome, Categorias.ID, Categorias.Nome;




############## BANCO 02: ESCOLA ##############


################ QUESTÃO 18 ###############
CREATE TABLE Alunos (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(50)
);

INSERT INTO Alunos (id, nome) VALUES
(1, 'Maria'),
(2, 'João'),
(3, 'Ana');

################ QUESTÃO 19 ###############

CREATE TABLE Disciplinas (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(50)
);

INSERT INTO Disciplinas (id, nome) VALUES
(1, 'História'),
(2, 'Matemática'),
(3, 'Banco de Dados');


################ QUESTÃO 20 ###############

CREATE TABLE Notas (
  id INT PRIMARY KEY,
  idAluno INT,
  idDisciplina INT,
  nota DECIMAL(4, 2)
);

INSERT INTO Notas (id, idAluno, idDisciplina, nota) VALUES
(1, 1, 2, 7.5),
(2, 1, 1, 8.6),
(3, 2, 3, 8.0),
(4, 2, 3, 6.0),
(5, 3, 3, 5.0),
(6, 1, 2, 8.5),
(7, 3, 1, 7.8);

################ QUESTÃO 21 ###############
SELECT Alunos.nome AS NomeAluno, Disciplinas.nome AS NomeDisciplina, Notas.nota AS Nota
FROM Notas
JOIN Alunos ON Notas.idAluno = Alunos.id
JOIN Disciplinas ON Notas.idDisciplina = Disciplinas.id;


################ QUESTÃO 22 ###############

SELECT Alunos.nome AS NomeAluno, Disciplinas.nome AS NomeDisciplina, Notas.nota AS Nota
FROM Notas
JOIN Alunos ON Notas.idAluno = Alunos.id
JOIN Disciplinas ON Notas.idDisciplina = Disciplinas.id;



################ QUESTÃO 23 ###############

SELECT Alunos.nome AS NomeAluno, Disciplinas.nome AS NomeDisciplina, AVG(Notas.nota) AS MediaNotas
FROM Notas
JOIN Alunos ON Notas.idAluno = Alunos.id
JOIN Disciplinas ON Notas.idDisciplina = Disciplinas.id
GROUP BY Alunos.nome, Disciplinas.nome;


################ QUESTÃO 24 ###############

SELECT Alunos.nome AS NomeAluno, Disciplinas.nome AS NomeDisciplina, MAX(Notas.nota) AS MaiorNota
FROM Notas
JOIN Alunos ON Notas.idAluno = Alunos.id
JOIN Disciplinas ON Notas.idDisciplina = Disciplinas.id
GROUP BY Alunos.nome, Disciplinas.nome;



















