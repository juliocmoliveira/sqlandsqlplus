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

SELECT * FROM funcionarios;

ALTER TABLE funcionarios DROP COLUMN salario
ALTER TABLE funcionarios ADD COLUMN salario NUMERIC(10,2);

INSERT INTO funcionarios(codigo, nome, salario, departamento)
VALUES (1393, 'vitor', 15.000, 'desenvolvimento')

INSERT INTO funcionarios(codigo, nome, salario, departamento)
VALUES (8574, 'pedro', 2.450, 'vendas')

UPDATE funcionarios
SET salario = 5000
where codigo = 2167

DELETE FROM funcionarios
WHERE codigo = 2943