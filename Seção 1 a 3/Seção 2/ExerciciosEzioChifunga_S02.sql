--  4 - Liste os nomes dos clientes da cidade de Macaé.
SELECT nome FROM clientes
WHERE cidade = 'Macaé';

--  5 - Exiba o código e o nome de todos os clientes com código entre 5 e 15.
SELECT codigo, nome FROM clientes
WHERE codigo BETWEEN 5 AND 15;

--  6 - Exiba os clientes que moram em Niterói, Volta Redonda ou Itaboraí.
SELECT * FROM clientes
WHERE cidade IN ('Niterói', 'Volta Redonda', 'Itaboraí');

--  7 - Exiba os nomes dos clientes que começam com a letra "F".
SELECT nome FROM clientes
WHERE nome LIKE 'F%';

--  8 - Exiba uma frase com a seguinte estrutura para todos os clientes:
-- Exemplo: João Santos mora em Nova Iguaçu.
SELECT nome || ' mora em ' || cidade AS Frase
FROM clientes;
