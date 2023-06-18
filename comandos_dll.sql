CREATE DATABASE parte_DLL;
use parte_DLL;

CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE,
    idade INT
);
#######{Usando o ADD para adicionar uma nova coluna na minha tabela}#######
ALTER TABLE clientes
ADD telefone VARCHAR(20); 

#######{Usando o DROP COLUMN para remover uma nova coluna na minha tabela}#######
ALTER TABLE clientes
DROP COLUMN  telefone;

#######{Usando o MODIFY para alterar o tipo de dado }#######
ALTER TABLE clientes
MODIFY idade DATE;

#######{Usando o CHANGE para alterar o nome da coluna}#######
ALTER TABLE clientes
CHANGE idade data_nascimento DATE;

ALTER TABLE clientes
MODIFY data_nascimento DECIMAL;

#######{Usando o TRUNCATE nome da tabela,  para excluir os dados da tabela}#######
TRUNCATE clientes;

#######{Usando o DROP TABLE para excluir a tabela}#######
DROP TABLE clientes;

SELECT * FROM clientes;

##########{Exercícios de DLL}##########

##01

CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE
);

CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50)  NOT NULL,
    preco DECIMAL(10,2)
);

CREATE TABLE pedidos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME,
    cliente_id INT,
    produto_id INT,
    quantidade INT DEFAULT 0,
    status_pedido VARCHAR(55) NOT NULL,
    FOREIGN KEY(cliente_id) REFERENCES clientes(id),
    FOREIGN KEY(produto_id) REFERENCES produtos(id)
);

ALTER TABLE pedidos
ADD valor_total DECIMAL(10, 2);

ALTER TABLE pedidos
MODIFY status_pedido VARCHAR(50);

DROP TABLE pedidos;

SELECT * FROM pedidos;



##02
CREATE TABLE departamentos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE funcionarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    salario DECIMAL(10,2),
    departemento_id INT,
    FOREIGN KEY (departemento_id) REFERENCES departamentos(id)
);

ALTER TABLE funcionarios
ADD data_contratacao DATE;

ALTER TABLE funcionarios
CHANGE salario salario_mensal DECIMAL(10,2);

CREATE TABLE projetos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
)

SELECT * FROM funcionarios;



##03
CREATE TABLE categorias(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE produtos_exer03(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

ALTER TABLE produtos_exer03
ADD descricao TEXT;

ALTER TABLE produtos_exer03
CHANGE preco preco_unitario DECIMAL(10,2);

CREATE TABLE pedidos_exer03(
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE,
    quantidade INT DEFAULT 0,
    status_pedido VARCHAR(50),
    produto_id INT,
    FOREIGN KEY (produto_id) REFERENCES produtos_exer03(id)
)

SELECT * FROM pedidos_exer03;

##04
CREATE TABLE livros_exer04(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT NOT NULL,
    disponivel BOOLEAN
);

CREATE TABLE clientes_exer04(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(100) ,
    livro_id INT,
    FOREIGN KEY (livro_id) REFERENCES livros_exer04(id)
);


ALTER TABLE livros_exer04
ADD data_emprestimo DATE;

ALTER TABLE clientes_exer04 
DROP COLUMN telefone;

DROP TABLE clientes_exer04;

SELECT * FROM clientes_exer04;









