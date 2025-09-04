CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

CREATE TABLE IF NOT EXISTS Veiculos(
	placa VARCHAR(7) PRIMARY KEY NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL
);

INSERT INTO Veiculos(placa,marca,modelo,ano_fabricacao)
VALUES
	('LRH2G72', 'Ford', 'Fiesta', 2009),
    ('ABC0001', 'Volkswagen', 'Nivus', 2025),
	('BDM5C09', 'Fiat', 'Fastback', 2025);

UPDATE Veiculos SET modelo= 'KA' WHERE placa = 'LRH2G72';
SELECT * FROM Veiculos;

DELETE FROM Veiculos WHERE placa= 'LRH2G72';

CREATE VIEW Veiculos_recentes AS
SELECT placa, marca, modelo, ano_fabricacao
FROM Veiculos
WHERE ano_fabricacao >=2000;

SELECT * FROM Veiculos_recentes;

ALTER TABLE Veiculos
ADD COLUMN tabela_fipe FLOAT(10) after ano_fabricacao;

SET SQL_SAFE_UPDATES=0;
/* Mais de uma linha*/
UPDATE Veiculos 
SET tabela_fipe = CASE placa
	WHEN 'ABC0001' THEN 171990
    WHEN 'BDM5C09' THEN 113259
END;

SELECT * FROM Veiculos;