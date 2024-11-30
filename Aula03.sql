CREATE TABLE funcionario (
	codigo INTEGER  PRIMARY KEY GENERATED ALWAYS AS IDENTITY ,
	nome VARCHAR(50) NOT NULL,
	salario NUMERIC(10,2),
	departamento VARCHAR(30)
);

-- DROP TABLE funcionario

UPDATE funcionario
SET salario = salario + 150
where departamento = 'Compras'

UPDATE funcionario
SET salario = salario + 100
where departamento = 'Vendas'

UPDATE funcionario
SET salario = salario + 250
where departamento = 'Recursos Humanos'

UPDATE funcionario
SET salario = salario + 200
where departamento = 'Tecnologia'

======================================================================
INSERT INTO funcionario (nome, salario, departamento) 
VALUES	
-- 		('luiz', 1500, 'Compras'),
-- 		('Bruno', 1800, 'Vendas'),
-- 		('Camila', 1550, 'Compras'),
-- 		('João', 2500, 'Recursos Humanos'),
-- 		('Ana', 3800, 'Tecnologia'),
-- 		('Katia', 2750, 'Compras'),
-- 		('Marcelo', 1950, 'Vendas'),
-- 		('Geovana', 2650, 'Tecnologia'),
-- 		('Patrícia', 3000, 'Tecnologia'),
-- 		('Pedro', 2450, 'Vendas');
		
		
SELECT * FROM funcionario;
=======================================================================
INSERT INTO funcionario (nome, salario, departamento) 
VALUES	('alehandro', 400000, 'Compras');

DELETE FROM funcionario WHERE codigo = 12;

SELECT * FROM funcionario;
=======================================================================
SELECT * FROM funcionario WHERE departamento = 'Tecnologia';
=======================================================================
SELECT nome, departamento FROM funcionario WHERE (departamento = 'Tecnologia') OR (departamento = 'Compras');
=======================================================================
SELECT nome, salario FROM funcionario WHERE salario > 2100;
=======================================================================
SELECT departamento FROM funcionario WHERE (salario > 2000) AND (salario < 3000)
=======================================================================
SELECT nome, salario FROM funcionario WHERE salario BETWEEN 1000 AND 2000
=======================================================================
SELECT * FROM funcionario WHERE salario < 2000 OR departamento = 'Tecnologia'
=======================================================================
SELECT * FROM funcionario WHERE salario > 2000 AND departamento = 'Compras'
=======================================================================
SELECT nome FROM funcionario WHERE nome LIKE 'P%'
=======================================================================
SELECT nome FROM funcionario WHERE nome LIKE 'P%' OR nome Like '%o'
=======================================================================
SELECT * FROM funcionario 
WHERE departamento IN ('Tecnologias', 'Compras')
AND salario BETWEEN 1600 AND 2800 
AND nome LIKE '%a' 
AND codigo > 8;
=======================================================================
-- Syntaxe
-- D.Definition.L.
-- CREATE TABLE tableExemplo (campoExemplo INTEGER PRIMARY KEY)
-- ALTER TABLE tabelaExemplo DROP COLUMN colunaExemplo
-- ALTER TABLE tabelaExemplo ADD COLUMN colunaExemplo VARCHAR(20)
-- DROP TABLE tableExemplo

-- D.Manipulation.L.
-- INSERT INTO tabelaExemplo (campo1, campo2) VALUES (valor1, valor2)
-- UPDATE tabelaExemplo SET campoExemplo = valorExemplo WHERE condiçãoExemplo
-- DELETE FROM tabelaExemplo WHERE condiçãoExemplo

-- D.Query.L.
-- SELECT campoExemplo FROM tabelaExemplo WHERE condiçãoExemplo
=======================================================================
CREATE TABLE escolaridade(
	id INTEGER,
	descricao varchar(60),
	CONSTRAINT pk_escolaridade PRIMARY KEY(id)
);

CREATE TABLE cidade(
	id INTEGER,
	descricao varchar(150),
	CONSTRAINT pk_cidade PRIMARY KEY (id)
);

CREATE TABLE  pessoa(
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	nome VARCHAR(50),
	idade INTEGER,
	cidadeId INTEGER NOT null,
	escolaridadeId INTEGER NOT null,
	CONSTRAINT pk_pessoa PRIMARY KEY(id),
	CONSTRAINT fk_pessoa_cidade FOREIGN KEY (cidadeId) REFERENCES cidade (id),
	CONSTRAINT fk_pessoa_escolaridade FOREIGN KEY (escolaridadeId) REFERENCES escolaridade (id)
); 
=======================================================================

DROP TABLE pessoa
DROP TABLE escolaridade
DROP TABLE cidade

INSERT INTO cidade (id, descricao)
VALUES 	(1, 'Blumenau'),
		(2, 'Recife'),
		(3, 'São Paulo')
		
INSERT INTO escolaridade (id, descricao)
VALUES 	(1, 'Fundamental'),
		(2, 'Médio'),
		(3, 'Técnico'),
		(4, 'Superior')
		
SELECT * FROM escolaridade 
SELECT * FROM cidade
SELECT * FROM pessoa

INSERT INTO pessoa (nome, idade, cidadeId, escolaridadeId)
VALUES ('Marcos', 18, 1, 4)

INSERT INTO pessoa (nome, idade, cidadeId, escolaridadeId)
VALUES ('pedrinho', 9, 3, 3)

SELECT p.nome, p.idade, c.descricao, t.descricao FROM pessoa p 
JOIN escolaridade t ON t.id = p.escolaridadeId
JOIN cidade c ON c.id = p.cidadeId
=======================================================================
-- Aula 03

-- p.id, p.nome, p.idade, c.descricao, e.descricao
SELECT * FROM pessoa p, cidade c, escolaridade e
WHERE p.cidadeId = c.id 
AND p.escolaridadeId = e.id

SELECT * FROM pessoa p
JOIN cidade c ON p.cidadeid = c.id
JOIN escolaridade e ON p.escolaridadeId = e.id

=======================================================================

SELECT p.nome, c.descricao AS descricao_cidade, e.descricao AS descricao_escolaridade FROM pessoa p
JOIN cidade c ON p.cidadeid = c.id
JOIN escolaridade e ON p.escolaridadeId = e.id 
WHERE c.id = 1 AND e.id = 4

=======================================================================

SELECT COUNT(*) FROM pessoa p
JOIN cidade c ON p.cidadeid = c.id
JOIN escolaridade e ON p.escolaridadeid = e.id
WHERE c.id = 3 AND e.id = 3

=======================================================================
DROP TABLE genero
DROP TABLE livro

CREATE TABLE genero (
	id INTEGER,
	descricao varchar(20),
	CONSTRAINT pk_genero PRIMARY KEY (id)
)

CREATE TABLE livro (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	titulo VARCHAR(50),
	autor VARCHAR(40),
	ano_publicado INTEGER,
	preco NUMERIC(6,2),
	quantidade_estoque INTEGER,
	generoid INTEGER NOT NULL,
	CONSTRAINT pk_livro PRIMARY KEY (id),
	CONSTRAINT fk_genero FOREIGN KEY (generoid) REFERENCES genero (id)
)

SELECT * FROM genero
SELECT * FROM livro

INSERT INTO genero (id, descricao)
VALUES 	(1, 'Fantasia'),
		(2, 'Distopia'),
		(3, 'Romance'),
		(4, 'Infantil'),
		(5, 'Historia')

-- Inserindo livros na tabela 'livro'
INSERT INTO livro (titulo, autor, ano_publicado, preco, quantidade_estoque, generoid) 
VALUES 	('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 59.90, 10, 1),  -- Exemplo de Livro de Fantasia (assumindo generoid = 1)
		('1984', 'George Orwell', 1949, 39.90, 15, 2),                  -- Exemplo de Livro de Distopia (assumindo generoid = 2)
		('Dom Casmurro', 'Machado de Assis', 1899, 29.90, 20, 3),        -- Exemplo de Livro de Romance (assumindo generoid = 3)
		('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 49.90, 30, 1),  -- Exemplo de Livro de Fantasia (assumindo generoid = 1)
		('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 19.90, 25, 4); -- Exemplo de Livro Infantil (assumindo generoid = 4)
