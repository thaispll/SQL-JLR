/*1. Conte quantos clientes existem na tabela cliente.*/
SELECT COUNT(*) AS total_clientes FROM cliente;

/*2. Liste o nome dos clientes e a quantidade total de aluguéis 
que cada um fez. */
SELECT cliente.nome, COUNT(aluguel.codaluguel) AS total_alugueis
FROM cliente
LEFT JOIN aluguel ON cliente.codcliente = aluguel.codcliente
GROUP BY cliente.nome;


/*3.Mostre o total gasto por cada cliente, considerando o valor 
dos carros alugados. */
/* cliente e */
SELECT cliente.nome, SUM(carro.valor) AS total_valor
FROM cliente
JOIN aluguel ON cliente.codcliente = aluguel.codcliente
JOIN carro ON aluguel.codcarro = carro.codcarro
GROUP BY cliente.nome;

/*4.Exiba a média do valor dos carros disponíveis na tabela carro. */
SELECT AVG(valor) AS media_valor_aluguel FROM carro;

/*5.Encontre o menor e o maior valor dos carros cadastrados. */
SELECT 
	MIN(valor) AS minimo_valor,
    MAX(valor) AS maior_valor
FROM Carro;


