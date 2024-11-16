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