-- Estrutura básica
SELECT coluna, função
FROM tabela
GROUP BY coluna
HAVING condição;

-- Exemplo 1: Clientes com 1 pedido
SELECT cliente_id, COUNT(*) AS total
FROM pedidos
GROUP BY cliente_id
HAVING COUNT(*) = 1;

-- Exemplo 2: Produtos vendidos mais de 5 vezes
SELECT produto_id, SUM(quantidade) AS total
FROM pedidos
GROUP BY produto_id
HAVING SUM(quantidade) > 5;

-- Exemplo 3: Clientes que compraram muito
SELECT cliente_id, SUM(quantidade) AS total_itens
FROM pedidos
GROUP BY cliente_id
HAVING SUM(quantidade) > 3;

-- Exemplo correto (HAVING com COUNT > 1)
SELECT cliente_id, COUNT(*)
FROM pedidos
GROUP BY cliente_id
HAVING COUNT(*) > 1;

-- HAVING + ORDER BY (Ranking de clientes)
SELECT cliente_id, COUNT(*) AS total
FROM pedidos
GROUP BY cliente_id
HAVING COUNT(*) > 1
ORDER BY total DESC;

-- Exemplo completo
SELECT produto_id,
SUM(quantidade) AS total_vendido
FROM pedidos
GROUP BY produto_id
HAVING SUM(quantidade) > 2
ORDER BY total_vendido DESC;

-- Passo a passo: Produtos mais vendidos
SELECT produto_id, SUM(quantidade)
FROM pedidos
GROUP BY produto_id
HAVING SUM(quantidade) > 2;
