CREATE DATABASE CARRO;
USE CARRO;

/*Criar tabela com colunas*/

CREATE TABLE CARRO(
	placa VARCHAR(7) PRIMARY KEY NOT NULL, 
    /*chave primária: indicador de exclusividade: id*/
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anofab INT NOT NULL
);

/* Inserir dados */
INSERT INTO Carro (placa,marca, modelo, anofab) VALUES
	('DAE6534', 'Ford', 'Fiesta', 1999),
	('DKL4598', 'volksvagen', 'Gol', 2001),
	('DKL7878', 'Ford', 'Fiesta', 2001),
	('JDM8776', 'volksvagen', 'Santana', 2002),
	('JJM3692', 'Chevrolet', 'Corsa', 1999);

SELECT * FROM Carro;

/* UPDATE: atualizar algum campo*/
UPDATE Carro SET modelo = 'Fiesta' WHERE placa = 'DAE6534';
SELECT * FROM Carro;
/* DELETE: deletar algum campo*/

DELETE FROM Carro WHERE placa='DKL4598';
SELECT * FROM Carro;

/*Create view: tabela virtual*/
CREATE VIEW View_Carros_dois AS 
SELECT marca, modelo, anofab
FROM Carro WHERE anofab >=2000;

SELECT * FROM View_Carros_dois;
SELECT * FROM Carro;

/*ADD COLUMN: adiciona coluna */
ALTER TABLE Carro 
ADD COLUMN tabela_fipe FLOAT(10) AFTER modelo;
SELECT * FROM Carro;

UPDATE Carro SET tabela_fipe = 15000 WHERE placa = 'DAE6534';

SET SQL_SAFE_UPDATES=0;
/* Mais de uma linha*/
UPDATE Carro 
SET tabela_fipe = CASE
	WHEN placa = 'JDM8776' THEN 8000
	WHEN placa = 'JJM3692' THEN 12000
    WHEN placa = 'DKL7878' THEN 15000
END;



SELECT * FROM Carro;


