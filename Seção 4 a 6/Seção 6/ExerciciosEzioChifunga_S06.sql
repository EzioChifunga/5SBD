-- 16 - Exiba o nome de cada cliente, o número da conta e o saldo correspondente.
SELECT c.nome, co.numero_conta, co.saldo
FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente;

-- 17 - Liste os nomes dos clientes e os nomes das agências onde mantêm conta.
SELECT cl.nome AS cliente, ag.nome_agencia AS agencia
FROM cliente cl
JOIN conta co ON cl.codigo = co.codigo_cliente
JOIN agencia ag ON co.codigo_agencia = ag.codigo;

-- 18 - Mostre todas as agências, mesmo aquelas que não possuem clientes vinculados (junção externa esquerda).
SELECT ag.nome_agencia, cl.nome AS cliente
FROM agencia ag
LEFT JOIN conta co ON ag.codigo = co.codigo_agencia
LEFT JOIN cliente cl ON co.codigo_cliente = cl.codigo;