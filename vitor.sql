CREATE TABLE produto (
	codigo INTEGER PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL,
	preco NUMERIC(5,2)
);

SELECT * FROM produto;

ALTER TABLE produto DROP COLUMN descricao;
ALTER TABLE produto ADD COLUMN tipo VARCHAR(20);

DROP TABLE produto;

CREATE TABLE funcionarios (
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	salario DOUBLE PRECISION,
	departamento VARCHAR(30)
);

SELECT * FROM funcionarios
WHERE departamento = 'tecnologia';

SELECT nome, departamento FROM funcionarios
WHERE departamento IN ('tecnologia', 'compras');

SELECT nome, salario FROM funcionarios
WHERE salario > 2100

SELECT departamento FROM funcionarios
WHERE salario >= 2000
AND salario <= 3000;

SELECT departamento FROM funcionarios
WHERE salario BETWEEN 2000 AND 3000;

SELECT nome, salario FROM funcionarios
WHERE salario BETWEEN 1000 AND 2000;

SELECT * FROM funcionarios
WHERE salario <= 2000 OR departamento = 'tecnologia';

SELECT * FROM funcionarios
WHERE salario > 2000 AND departamento = 'compras';

SELECT * FROM funcionarios
WHERE nome LIKE 'p%';

SELECT * FROM funcionarios
WHERE nome LIKE 'p%'
OR nome LIKE '%o';

SELECT * FROM funcionarios
WHERE departamento IN ('tecnologia', 'compras')
AND salario BETWEEN 1600 AND 2800
AND nome LIKE '%a'
AND codigo > 8;

ALTER TABLE funcionarios DROP COLUMN salario
ALTER TABLE funcionarios ADD COLUMN salario NUMERIC(10,2);

INSERT INTO funcionarios(codigo, nome, salario, departamento)
VALUES (1393, 'vitor', 15.000, 'desenvolvimento')

INSERT INTO funcionarios(codigo, nome, salario, departamento)
VALUES (0001, 'elon musk', 10000000, 'CEO')

INSERT INTO funcionarios(codigo, nome, salario, departamento)
VALUES (666, 'funcionario fantasma', 0, 'sei lá')

INSERT INTO funcionarios(codigo, nome, salario, departamento)
VALUES (1212, 'fulano', 0, 'compras')

UPDATE funcionarios
SET salario = 15000
where codigo = 1393

DELETE FROM funcionarios
WHERE codigo = 1212

CREATE TABLE cidade (
	id INTEGER Generated Always as Identity,
	descricao VARCHAR(150),
	CONSTRAINT pk_cidade PRIMARY KEY (id));

CREATE TABLE pessoa(
	id INTEGER Generated Always as Identity,
	nome VARCHAR(50),
	idade INTEGER,
	cidadeid INTEGER NOT NULL,
	CONSTRAINT pk_pessoa PRIMARY KEY (id),
	CONSTRAINT fk_pessoa_cidade FOREIGN KEY (cidadeid) REFERENCES cidade(id)
)

SELECT * FROM pessoa
SELECT * FROM cidade

INSERT INTO cidade (descricao)
VALUES ('indaial')

INSERT INTO pessoa (nome, idade, cidadeId)
VALUES ('anderson', 25, 1);

SELECT p.nome, p.idade, c.descricao
FROM pessoa p JOIN cidade c 
ON p.cidadeId = c.id;




CREATE TABLE escolaridade (
	id INTEGER Generated Always as Identity,
	descricao VARCHAR(150),
	CONSTRAINT pk_escolaridade PRIMARY KEY (id));

CREATE TABLE alunos (
	id INTEGER Generated Always as Identity,
	nome VARCHAR(50),
	idade INTEGER,
	escolaridadeid INTEGER NOT NULL,
	CONSTRAINT pk_alunos PRIMARY KEY (id),
	CONSTRAINT fk_alunos_escolaridade FOREIGN KEY (escolaridadeid) REFERENCES escolaridade(id)
)

INSERT INTO escolaridade (descricao)
VALUES ('superior')

INSERT INTO alunos (nome, idade, escolaridadeid)
VALUES ('fulaninho', 10, 4)

INSERT INTO alunos (nome, idade, escolaridadeid)
VALUES ('siclaninho', 10, 4)

DROP TABLE pessoa
SELECT * FROM escolaridade
SELECT * FROM alunos

// relação com where (jeito errado)
SELECT *
FROM pessoa, cidade, escolaridade
WHERE pessoa.cidadeId = cidade.id
AND pessoa.escolaridadeid = escolaridade.id

// jeito certo (join/inner join)
SELECT *
FROM pessoa p
JOIN cidade c ON p.cidadeid = c.id
JOIN escolaridade e ON p.escolaridadeid = e.id

ALTER TABLE pessoa
ADD COLUMN escolaridadeid INTEGER

ALTER TABLE pessoa
ADD CONSTRAINT fk_pessoa_escolaridade FOREIGN KEY (escolaridadeid) REFERENCES escolaridade(id);

INSERT INTO pessoa (nome, idade, cidadeId, escolaridadeid)
VALUES ('juliana', 26, 3, 3);

SELECT p.nome, c.descricao AS cidade, e.descricao AS escolaridade
FROM pessoa p 
JOIN cidade c ON p.cidadeid = c.id
JOIN escolaridade e ON p.escolaridadeid = e.id
WHERE c.descricao = 'blumenau' AND e.descricao = 'superior';
//        ^ podia ser id e numero de id ^

INSERT INTO cidade (descricao)
VALUES ('são paulo');

SELECT COUNT(*) AS paulistanos_com_técnico
FROM pessoa p
JOIN cidade c ON p.cidadeid = c.id
JOIN escolaridade e ON p.escolaridadeid = e.id
WHERE c.descricao = 'são paulo' AND e.descricao = 'técnico';


CREATE TABLE genero (
	id INTEGER Generated Always AS IDENTITY PRIMARY KEY,
	genero VARCHAR(30) NOT NULL
)

CREATE TABLE livro (
	id INTEGER Generated Always AS IDENTITY PRIMARY KEY,
	titulo VARCHAR(200) NOT NULL,
	autor VARCHAR(80),
	ano INTEGER,
	preco DECIMAL(10, 2),
	quantidade_estoque INTEGER,
	generoid INTEGER NOT NULL,
	CONSTRAINT fk_livro_genero FOREIGN KEY (generoid) REFERENCES genero(id) 
)

SELECT * FROM livro;
DROP TABLE genero;
