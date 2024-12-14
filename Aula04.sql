-- Aula 04
CREATE TABLE estudante (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	nome VARCHAR(40),
	idade INTEGER,
	sexo_id INTEGER,
	Email VARCHAR(50),
	Telefone VARCHAR(15),
	CONSTRAINT pk_estudante PRIMARY KEY (id),
	CONSTRAINT fk_sexo FOREIGN KEY (sexo_id) REFERENCES sexo (id)
)

CREATE TABLE curso (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	descricao VARCHAR(30),
	carga_horaria NUMERIC(6,2),
	turno_id INTEGER,
	CONSTRAINT pk_curso PRIMARY KEY (id),
	CONSTRAINT fk_turno FOREIGN KEY (turno_id) REFERENCES turno (id)
)

CREATE TABLE turma (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	estudante_id INTEGER NOT NULL,
	curso_id INTEGER NOT NULL,
	CONSTRAINT pk_estudante_curso PRIMARY KEY (id),
	CONSTRAINT fk_estudante FOREIGN KEY (estudante_id) REFERENCES estudante (id),
	CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES curso (id)
)

CREATE TABLE turno (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	descricao VARCHAR(15),
	CONSTRAINT pk_turno PRIMARY KEY (id)
)

CREATE TABLE sexo (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	descricao VARCHAR(15),
	CONSTRAINT pk_sexo PRIMARY KEY (id)
)

SELECT * FROM estudante;
SELECT * FROM curso;
SELECT * FROM turma;
SELECT * FROM sexo;
SELECT * FROM turno;
DROP TABLE sexo;
DROP TABLE turno;
DROP TABLE estudante;
DROP TABLE curso;
DROP TABLE turma;

=======================================================================
-- Aula 04 Atividades necessario

DROP TABLE departamento;
DROP TABLE funcionario;

SELECT * FROM departamento;
SELECT * FROM funcionario;

CREATE TABLE funcionario (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	nome VARCHAR(60),
	data_nascimento VARCHAR(12),
	salario_anual NUMERIC(7,2),
	departamento_id INTEGER NOT NULL,
	CONSTRAINT pk_funcionario PRIMARY KEY (id),
	CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES departamento (id)
);

CREATE TABLE departamento (
	id INTEGER GENERATED ALWAYS AS IDENTITY,
	descricao VARCHAR(60),
	CONSTRAINT pk_departamento PRIMARY KEY (id)
);

-- Inserção de 10 registros na tabela 'departamento'
INSERT INTO departamento (descricao) VALUES
    ('Desenvolvimento de Software'),
    ('Infraestrutura de TI'),
    ('Suporte Técnico'),
    ('Design e UX'),
    ('Pesquisa e Desenvolvimento'),
    ('Gerenciamento de Projetos'),
    ('Qualidade de Software'),
    ('Vendas e Marketing'),
    ('Recursos Humanos'),
    ('Finanças e Contabilidade');


-- Inserção de 70 registros na tabela 'funcionario'
INSERT INTO funcionario (nome, data_nascimento, salario_anual, departamento_id)
VALUES
    ('João Silva', '1985-03-15', 60000.00, 1),
    ('Maria Oliveira', '1990-05-22', 55000.00, 2),
    ('Pedro Santos', '1988-12-10', 62000.00, 3),
    ('Ana Pereira', '1995-08-03', 50000.00, 4),
    ('Carlos Almeida', '1982-11-28', 58000.00, 7),
    ('Juliana Costa', '1993-04-07', 53000.00, 1),
    ('Fernando Rocha', '1987-09-18', 60000.00, 7),
    ('Mariana Lima', '1991-07-12', 55000.00, 8),
    ('Ricardo Oliveira', '1984-02-25', 62000.00, 3),
    ('Patrícia Silva', '1994-06-30', 50000.00, 3),
    ('Laura Ferreira', '1989-09-05', 54000.00, 1),
    ('Eduardo Martins', '1992-12-20', 61000.00, 2),
    ('Aline Souza', '1986-06-15', 58000.00, 3),
    ('Rodrigo Costa', '1997-03-08', 52000.00, 1),
    ('Gabriela Lima', '1983-04-25', 59000.00, 5),
    ('Lucas Oliveira', '1990-11-12', 55000.00, 6),
    ('Julia Santos', '1984-07-28', 60000.00, 7),
    ('Daniel Pereira', '1993-02-10', 53000.00, 8),
    ('Carolina Alves', '1987-08-22', 62000.00, 3),
    ('Vinícius Rocha', '1994-05-03', 50000.00, 3),
    ('André Oliveira', '1988-10-18', 57000.00, 1),
    ('Camila Pereira', '1991-06-02', 61000.00, 2),
    ('Hugo Silva', '1985-02-15', 59000.00, 3),
    ('Isabela Costa', '1996-04-12', 52000.00, 4),
    ('Roberto Santos', '1982-07-25', 58000.00, 5),
    ('Vanessa Lima', '1993-11-30', 54000.00, 1),
    ('Luciano Almeida', '1987-09-05', 60000.00, 7),
    ('Renata Souza', '1992-01-20', 53000.00, 8),
    ('Fábio Martins', '1984-08-22', 62000.00, 3),
    ('Tatiane Rocha', '1990-05-03', 50000.00, 3),
    ('Evelyn Costa', '1989-12-18', 56000.00, 1),
    ('Bruno Alves', '1992-06-02', 61000.00, 2),
    ('Larissa Santos', '1986-02-15', 58000.00, 3),
    ('Felipe Oliveira', '1997-04-12', 53000.00, 4),
    ('Amanda Lima', '1983-07-25', 59000.00, 7),
    ('Marcelo Rocha', '1994-11-30', 54000.00, 1),
    ('Fernanda Pereira', '1988-09-05', 60000.00, 7),
    ('Alexandre Silva', '1993-01-20', 55000.00, 8),
    ('Natalia Souza', '1987-08-22', 62000.00, 3),
    ('Gustavo Martins', '1990-05-03', 50000.00, 10),
    ('Rafaela Lima', '1988-11-18', 55000.00, 1),
    ('Guilherme Almeida', '1992-07-02', 61000.00, 2),
    ('Priscila Santos', '1986-03-15', 57000.00, 3),
    ('Eduardo Oliveira', '1997-05-22', 52000.00, 4),
    ('Thais Costa', '1984-08-28', 59000.00, 5),
    ('Vinicius Rocha', '1994-12-01', 54000.00, 6),
    ('Cristiane Souza', '1988-10-05', 60000.00, 7),
    ('Leonardo Martins', '1993-02-20', 53000.00, 8),
    ('Vanessa Oliveira', '1987-09-15', 61000.00, 3),
    ('Roberto Pereira', '1990-06-03', 50000.00, 10),
    ('Isaac Oliveira', '1991-04-15', 58000.00, 3),
    ('Larissa Martins', '1985-10-22', 55000.00, 7),
    ('Anderson Silva', '1989-12-10', 62000.00, 1),
    ('Viviane Costa', '1996-08-03', 50000.00, 3),
    ('Lucas Almeida', '1982-07-28', 56000.00, 9),
    ('Patricia Lima', '1993-02-17', 53000.00, 2),
    ('Gabriel Pereira', '1987-09-18', 61000.00, 1),
    ('Carla Souza', '1991-07-12', 54000.00, 8),
    ('Fernando Oliveira', '1984-01-25', 60000.00, 5),
    ('Juliana Silva', '1994-06-30', 51000.00, 10),
    ('Marcelo Costa', '1988-08-22', 59000.00, 1),
    ('Nathalia Rocha', '1993-01-20', 52000.00, 2),
    ('Rafael Pereira', '1987-11-05', 61000.00, 3),
    ('Adriana Lima', '1990-05-03', 50000.00, 7),
    ('Vinicius Almeida', '1992-12-18', 56000.00, 9),
    ('Fernanda Santos', '1986-06-02', 59000.00, 1),
    ('Eduardo Rocha', '1997-04-12', 52000.00, 5),
    ('Thais Oliveira', '1983-07-25', 57000.00, 6),
    ('Ricardo Costa', '1994-11-30', 54000.00, 8),
    ('Amanda Rocha', '1988-09-05', 60000.00, 10);
	
=======================================================================
-- Aula 04 Atividade
=======================================================================
SELECT COUNT(*) FROM funcionario
=======================================================================
SELECT AVG(salario_anual) FROM funcionario 
=======================================================================
SELECT MIN(salario_anual),MAX(salario_anual) FROM funcionario
=======================================================================
SELECT COUNT(departamento_id) FROM funcionario 
=======================================================================



