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
D.Definition.L.
CREATE TABLE tableExemplo (campoExemplo INTEGER PRIMARY KEY)
ALTER TABLE tabelaExemplo DROP COLUMN colunaExemplo
ALTER TABLE tabelaExemplo ADD COLUMN colunaExemplo VARCHAR(20)
DROP TABLE tableExemplo

D.Manipulation.L.
INSERT INTO tabelaExemplo (campo1, campo2) VALUES (valor1, valor2)
UPDATE tabelaExemplo SET campoExemplo = valorExemplo WHERE condiçãoExemplo
DELETE FROM tabelaExemplo WHERE condiçãoExemplo

D.Query.L.
SELECT campoExemplo FROM tabelaExemplo WHERE condiçãoExemplo
=======================================================================

CREATE TABLE cidade(
	id INTEGER GENERATED ALWAYS AS IDENTITY,
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

CREATE TABLE escolaridade(
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	descricao varchar(60),
	CONSTRAINT pk_escolaridade PRIMARY KEY(id)
)

INSERT INTO escolaridade (descricao)
VALUES 	('Fundamental'),
		('Médio'),
		('Técnico'),
		('Superior')
SELECT * FROM escolaridade 
SELECT * FROM cidade
SELECT * FROM pessoa

INSERT INTO pessoa (nome, idade, cidadeId, escolaridadeId)
VALUES ('Marcos', 18, 2, 2)

SELECT p.nome, p.idade, c.descricao, t.descricao FROM pessoa p 
JOIN escolaridade t ON t.id = p.escolaridadeId
JOIN cidade c ON c.id = p.cidadeId



