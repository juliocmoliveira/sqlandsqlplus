CREATE TABLE produto (
	codigo INTEGER PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL,
	preco NUMERIC(5,2)
);

SELECT * FROM produto;

ALTER TABLE produto 
DROP COLUMN descricao;

ALTER TABLE produto
ADD COLUMN tipo VARCHAR(20);

DROP TABLE produto;

UPDATE produto
SET descricao = 'smartphone2'
WHERE descricao = 'smartphone';

DELETE FROM produto
WHERE codigo = 1

CREATE TABLE funcionario (
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	salario NUMERIC(10,2),
	departamento VARCHAR(30)
);

SELECT * FROM funcionario;

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (1, 'Luiz', 1500.00, 'Compras');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (2, 'Bruno', 1800.00, 'Vendas');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (3, 'Camila', 1550.00, 'Compras');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (4, 'João', 2500.00, 'Recursos Humanos');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (5, 'Ana', 3800.00, 'Tecnologia');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (6, 'Katia', 2750.00, 'Compras');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (7, 'Marcelo', 1950.00, 'Vendas');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (8, 'Geovana', 2650.00, 'Tecnologia');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (9, 'Patrícia', 3000.00, 'Tecnologia');

INSERT INTO  funcionario(codigo, nome, salario, departamento) 
VALUES (10, 'Pedro', 2450.00, 'Vendas');

SELECT * 
FROM funcionario 
WHERE departamento = 'Tecnologia';

SELECT *
FROM funcionario
WHERE departamento = 'Tecnologia'
AND salario > 3700;

SELECT nome, departamento
FROM funcionario
WHERE departamento 
IN ('Tecnologia', 'Compras', 'Recursos Humanos');

SELECT *
FROM funcionario
WHERE salario > 2000
AND salario < 3000;

SELECT nome, salario
FROM funcionario
WHERE salario 
BETWEEN 1000 AND 2000;

SELECT *
FROM funcionario
WHERE salario < 2000
OR departamento = 'Tecnologia';

SELECT * 
FROM funcionario
WHERE departamento = 'Compras'
AND salario > 2000

SELECT * 
FROM funcionario
WHERE nome LIKE '____a'

SELECT *
FROM funcionario
WHERE nome LIKE 'P%'
OR nome LIKE '%o'

SELECT *
FROM funcionario
WHERE departamento IN ('Tecnologia', 'Compras')
AND salario BETWEEN 1600 AND 2800
AND nome LIKE '%a'
AND codigo > 1

CREATE TABLE cidade(
	id INTEGER Generated Always as Identity,
	descricao VARCHAR(150),
	CONSTRAINT pk_cidade PRIMARY KEY (id)
);

CREATE TABLE pessoa(
	id INTEGER Generated Always as Identity,
	nome VARCHAR(50),
	idade INTEGER,
	cidadeId INTEGER NOT NULL,
	CONSTRAINT pk_pessoa PRIMARY KEY (id),
	CONSTRAINT fk_cidade FOREIGN KEY (cidadeId) REFERENCES cidade(id)
);

INSERT INTO cidade 
(descricao) 
VALUES ('Recife');

INSERT INTO pessoa
(nome, idade, cidadeId)
VALUES ('Júlio', 35, 1);


SELECT p.nome, p.idade, c.descricao 
FROM pessoa p, cidade c 
WHERE p.cidadeId = c.id

SELECT p.nome, p.idade, c.descricao 
FROM pessoa p
JOIN cidade c ON p.cidadeId = c.id
WHERE c.descricao = 'Recife'

CREATE TABLE escolaridade(
	id INTEGER Generated Always as Identity,
	descricao VARCHAR(50),
	CONSTRAINT pk_escolaridade PRIMARY KEY (id)
);

INSERT INTO escolaridade(descricao)
VALUES ('Fundamental'),('Médio'), ('Superior');

drop table pessoa;

CREATE TABLE pessoa(
	id INTEGER Generated Always as Identity,
	nome VARCHAR(50),
	idade INTEGER,
	cidadeId INTEGER NOT NULL,
	escolaridadeId INTEGER NOT NULL,
	CONSTRAINT pk_pessoa PRIMARY KEY (id),
	CONSTRAINT fk_cidade FOREIGN KEY (cidadeId) REFERENCES cidade(id),
	CONSTRAINT fk_escolaridade FOREIGN KEY (escolaridadeId) REFERENCES escolaridade(id)
);

INSERT INTO pessoa(nome, idade, cidadeId, escolaridadeId)
VALUES ('Teste', 35, 1, 1);

select * from pessoa;