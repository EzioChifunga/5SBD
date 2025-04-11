-- 1 - Exiba o nome de cada cliente junto com o número de sua conta (sintaxe proprietária Oracle).
SELECT c.nome, co.numero_conta
FROM cliente c, conta co
WHERE c.codigo = co.codigo_cliente;

-- 2 - Mostre todas as combinações possíveis de clientes e agências (produto cartesiano).
SELECT * 
FROM cliente c, agencia a;

-- 3 - Usando aliases de tabela, exiba o nome dos clientes e a cidade da agência onde mantêm conta.
SELECT c.nome, a.cidade
FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente
JOIN agencia a ON co.codigo_agencia = a.codigo;
