SELECT clientes.nome, pedidos.id
FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.cliente_id;


SELECT produtos.nome, produtos.preco,pedidos.quantidade
FROM produtos
INNER JOIN pedidos
ON produtos.id = pedidos.produto_id;



SELECT
clientes.nome AS cliente,
produtos.nome AS produto,
pedidos.quantidade
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
INNER JOIN produtos ON pedidos.produto_id = produtos.id;

