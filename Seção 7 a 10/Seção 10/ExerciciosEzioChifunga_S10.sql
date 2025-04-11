-- 1 - Clientes com saldo acima da média geral.
SELECT nome FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente
WHERE co.saldo > (SELECT AVG(saldo) FROM conta);

-- 2 - Clientes com saldo igual ao maior saldo.
SELECT nome FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente
WHERE co.saldo = (SELECT MAX(saldo) FROM conta);

-- 3 - Cidades com mais clientes que a média.
SELECT cidade FROM cliente
GROUP BY cidade
HAVING COUNT(*) > (SELECT AVG(qtd) FROM (SELECT COUNT(*) AS qtd FROM cliente GROUP BY cidade));
-- 4 - Clientes com saldo entre os 10 maiores.
SELECT nome FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente
WHERE co.saldo IN (
  SELECT saldo FROM conta ORDER BY saldo DESC FETCH FIRST 10 ROWS ONLY
);

-- 5 - Clientes com saldo menor que todos os de Niterói.
SELECT nome FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente
WHERE co.saldo < ALL (
  SELECT co2.saldo
  FROM conta co2
  JOIN cliente c2 ON co2.codigo_cliente = c2.codigo
  WHERE c2.cidade = 'Niterói'
);

-- 6 - Clientes com saldo entre os saldos de Volta Redonda.
SELECT nome FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente
WHERE co.saldo BETWEEN
  (SELECT MIN(co2.saldo) FROM conta co2 JOIN cliente c2 ON co2.codigo_cliente = c2.codigo WHERE c2.cidade = 'Volta Redonda')
  AND
  (SELECT MAX(co2.saldo) FROM conta co2 JOIN cliente c2 ON co2.codigo_cliente = c2.codigo WHERE c2.cidade = 'Volta Redonda');
-- 7 - Clientes com saldo acima da média da agência.
SELECT c.nome FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente
WHERE co.saldo > (
  SELECT AVG(c2.saldo)
  FROM conta c2
  WHERE c2.codigo_agencia = co.codigo_agencia
);

-- 8 - Clientes com saldo abaixo da média da própria cidade.
SELECT c.nome, c.cidade FROM cliente c
JOIN conta co ON c.codigo = co.codigo_cliente
WHERE co.saldo < (
  SELECT AVG(co2.saldo)
  FROM conta co2
  JOIN cliente c2 ON co2.codigo_cliente = c2.codigo
  WHERE c2.cidade = c.cidade
);
-- 9 - Clientes que possuem pelo menos uma conta.
SELECT nome FROM cliente c
WHERE EXISTS (
  SELECT 1 FROM conta co WHERE co.codigo_cliente = c.codigo
);

-- 10 - Clientes que não possuem conta.
SELECT nome FROM cliente c
WHERE NOT EXISTS (
  SELECT 1 FROM conta co WHERE co.codigo_cliente = c.codigo
);
-- 11 - Clientes com saldo acima da média da cidade (usando WITH).
WITH media_por_cidade AS (
  SELECT cl.cidade, AVG(co.saldo) AS media
  FROM cliente cl
  JOIN conta co ON cl.codigo = co.codigo_cliente
  GROUP BY cl.cidade
)
SELECT cl.nome, cl.cidade, co.saldo
FROM cliente cl
JOIN conta co ON cl.codigo = co.codigo_cliente
JOIN media_por_cidade mpc ON cl.cidade = mpc.cidade
WHERE co.saldo > mpc.media;
