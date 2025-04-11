- 11 - Apresente o saldo de cada conta formatado como moeda local.
SELECT TO_CHAR(saldo, 'L999G999D99') AS saldo_formatado FROM conta;

-- 12 - Converta a data de abertura da conta para o formato 'dd/mm/yyyy'.
SELECT TO_CHAR(data_abertura, 'dd/mm/yyyy') AS data_formatada FROM conta;

-- 13 - Exiba o saldo da conta e substitua valores nulos por 0.
SELECT NVL(saldo, 0) AS saldo_tratado FROM conta;

-- 14 - Exiba os nomes dos clientes e substitua valores nulos na cidade por 'Sem cidade'.
SELECT nome, NVL(cidade, 'Sem cidade') AS cidade_tratada FROM cliente;

-- 15 - Classifique os clientes em grupos com base em sua cidade.
SELECT nome,
  CASE 
    WHEN cidade = 'Niterói' THEN 'Região Metropolitana'
    WHEN cidade = 'Resende' THEN 'Interior'
    ELSE 'Outra Região'
  END AS regiao
FROM cliente;