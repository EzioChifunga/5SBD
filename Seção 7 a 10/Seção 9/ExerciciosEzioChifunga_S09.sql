-- 9 - Exiba a média de saldo por cidade dos clientes.
SELECT cl.cidade, AVG(co.saldo) AS media_saldo
FROM cliente cl
JOIN conta co ON cl.codigo = co.codigo_cliente
GROUP BY cl.cidade;

-- 10 - Liste apenas as cidades com mais de 3 contas associadas a seus moradores.
SELECT cl.cidade, COUNT(co.numero_conta) AS total_contas
FROM cliente cl
JOIN conta co ON cl.codigo = co.codigo_cliente
GROUP BY cl.cidade
HAVING COUNT(co.numero_conta) > 3;

-- 11 - Utilize a cláusula ROLLUP para exibir o total de saldos por cidade da agência e o total geral.
SELECT a.cidade, SUM(c.saldo) AS total_saldo
FROM agencia a
JOIN conta c ON a.codigo = c.codigo_agencia
GROUP BY ROLLUP(a.cidade);

-- 12 - Consulta com UNION: cidades dos clientes e das agências, sem repetições.
SELECT cidade FROM cliente
UNION
SELECT cidade FROM agencia;
