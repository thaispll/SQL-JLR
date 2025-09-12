CREATE DATABASE Empresa_aluguel_carros;
USE Empresa_aluguel_carros;
CREATE TABLE cliente(
codcliente INT PRIMARY KEY,
nome VARCHAR(50),
cidade VARCHAR(50),
sexo CHAR(1),
estado CHAR(2),
estadocivil CHAR(1)
);


CREATE TABLE marca(
codmarca INT PRIMARY KEY,
marca VARCHAR(30)
);

CREATE TABLE carro(
codcarro INT PRIMARY KEY,
codmarca INT,
modelo VARCHAR(30) NOT NULL,
valor FLOAT,
FOREIGN KEY (codmarca) REFERENCES marca (codmarca)
);

CREATE TABLE aluguel(
codaluguel INT PRIMARY KEY,
codcliente INT,
codcarro INT,
data_aluguel DATE,
FOREIGN KEY (codcliente) REFERENCES cliente (codcliente),
FOREIGN KEY (codcarro) REFERENCES carro (codcarro)
);

INSERT INTO cliente (codcliente, nome, cidade, sexo, estado, estadocivil)
VALUES
(1, 'Ana Silva', 'Duque de Caxias', 'F', 'RJ', 'C'),
(2, 'Bruna Pereira', 'Niterói', 'F', 'RJ', 'C'),
(3, 'Túlio Nascimento', 'Duque de Caxias', 'M', 'RJ', 'S'),
(4, 'Fernando Souza', 'Campinas', 'M', 'SP', 'S'),
(5, 'Lúcia Andrade', 'São Paulo', 'F', 'SP', 'C');

INSERT INTO marca (codmarca, marca) VALUES
(1, 'Ford'),
(2, 'Fiat'),
(3, 'Chevrolet'),
(4, 'Volkswagen'),
(5, 'Renault');

INSERT INTO carro (codcarro, modelo, codmarca, valor) VALUES
(1, 'Ka', 1, 100.00),
(2, 'Argo', 2, 150.00),
(3, 'Onix', 3, 170.00),
(4, 'Polo', 4, 150.00),
(5, 'Kwid', 5, 120.00);

INSERT INTO aluguel (codaluguel, codcliente, codcarro, data_aluguel)VALUES
(1, 3, 2, '2023-04-01'),
(2, 2, 1, '2023-04-02'),
(3, 2, 1, '2023-04-03'),
(4, 2, 3, '2023-04-04'),
(5, 1, 4, '2023-04-05'),
(6, 1, 4, '2023-04-13'),
(7, 1, 1, '2023-04-15'),
(8, 5, 2, '2023-04-19'),
(9, 5, 2, '2023-04-21'),
(10,3, 1, '2023-04-25');

SELECT nome, cidade FROM cliente WHERE cidade='São Paulo';
/*Cláusula WHERE é usada para filtrar os registros retornados
por uma consulta SELECT, UPDATE, ou DELETE. Ela define 
condições que os dados devem satisfazer para serem incluídos
no resultado. */

/*SELECT coluna1, coluna, ....
FROM nome_da_tabela
WHERE condição;*/
/* liste todos os clientes do estado do RJ*/
SELECT nome, cidade FROM cliente WHERE estado='RJ';


/*Exiba os carros com valor superior a 120 reais.*/
SELECT modelo, valor FROM carro
WHERE valor > 120;

/* mostre os clientes do sexo feminino */

SELECT nome, sexo FROM cliente
WHERE sexo='F';

/* Liste as marcas com código 3 */
SELECT marca, codmarca FROM marca
WHERE codmarca=3;

/* Mostre todos os clientes que moram em Duque 
de Caxias */
SELECT nome, cidade FROM cliente
WHERE cidade = 'Duque de Caxias';

/* Exiba os códigos de aluguéis realizados no dia 
'2023-04-02'*/
SELECT codaluguel, data_aluguel FROM aluguel;

/* Mostre os clientes cujo estado civil é solteiro (S)*/
SELECT nome, estadocivil FROM cliente
WHERE estadocivil='S';


/*Liste os carros cujo valor é igual a 150 reais. */
SELECT modelo, valor FROM carro
WHERE valor = 150;

/*  Exiba os aluguéis feitos pelo cliente de código 1.*/
 SELECT codcliente, codaluguel FROM aluguel
 WHERE codcliente= 1;
 
/* Mostre todos os carros que não são do modelo 'Ka'. */
SELECT modelo FROM carro 
WHERE modelo <> 'Ka';

/*WHERE X HAVING*/
/*WHERE: filtrar linhas individuais antes da agregação
 HAVING: filtra grupos após a agregação*/
 /*agregação: uso de funções para cálculos em um conjunto
 de valores de uma coluna, retornando um único valor resumido.*/
 
/*NOME_TABELA AS APELIDO_TABELA*/ 
/* Mostrar clientes que fizeram mais de 2 aluguéis*/
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS total_alugueis
FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome
HAVING COUNT(aluguel.codaluguel) >2;

/* JOIN: junta as tabelas
GROUP BY: agrupa os resultados por uma ou mais tabelas*/

/* Mostrar marcas que possuem 1 carro cadastrado*/

SELECT marca.marca, COUNT(carro.codcarro) AS total_carros
FROM marca
JOIN carro ON marca.codmarca = carro.codmarca
GROUP BY marca.marca
HAVING COUNT(carro.codcarro) =1 ;

 /*Mostre o total gasto por cada cliente, considerando o valor dos carros alugados.*/
 SELECT cliente.nome, SUM(carro.valor) AS total_gasto
 FROM cliente
 JOIN aluguel ON cliente.codcliente = aluguel.codcliente
 JOIN carro ON aluguel.codcarro = carro.codcarro
 GROUP BY cliente.nome;
 
 