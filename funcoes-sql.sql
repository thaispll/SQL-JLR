/*COUNT, SUM, AVG, MIN E MAX*/
/* COUNT: CONTA QUANTOS EXISTEM*/
SELECT COUNT(*) AS total_cliente FROM cliente;

/*AVG: AVERAGE - Média*/
/* Média dos valores dos aluguéis carros alugados */

SELECT AVG(valor) AS media_valor_carros FROM carro;

/*MIN: Mínimo*/
/* Menor valor de aluguel de carro disponível */
SELECT MIN(valor) AS menor_valor_carro FROM carro;

/*MAX: Máximo*/
/* maior valor de aluguel de carro disponível */
SELECT MAX(valor) AS maior_valor_carro FROM carro;
