--  9 - Exiba os dados de todas as contas com saldo superior a R$ 9.000, ordenados do maior para o menor saldo.
SELECT * FROM conta
WHERE saldo > 9000
ORDER BY saldo DESC;

-- 10 - Liste os clientes que moram em Nova Iguaçu ou que tenham "Silva" no nome.
SELECT * FROM clientes
WHERE cidade = 'Nova Iguaçu' OR nome LIKE '%Silva%';

-- 11 - Exiba o saldo das contas com arredondamento para o inteiro mais próximo.
SELECT ROUND(saldo) AS saldo_arredondado FROM conta;

-- 12 - Exiba o nome de todos os clientes em letras maiúsculas.
SELECT UPPER(nome) AS nome_maiusculo FROM clientes;

-- 13 - Exiba os nomes dos clientes que não são das cidades de Teresópolis nem Campos dos Goytacazes.
SELECT nome FROM clientes
WHERE cidade NOT IN ('Teresópolis', 'Campos dos Goytacazes');
