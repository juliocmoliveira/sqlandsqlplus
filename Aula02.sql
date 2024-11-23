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

DELETE FROM funcionario WHERE nome = 'alehandro';

SELECT * FROM funcionario;







