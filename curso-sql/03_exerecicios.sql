-- Lista de transações com apenas 1 ponto;

SELECT IdTransacao,QtdePontos
FROM transacoes
WHERE QtdePontos = 1;


-- Lista de pedidos realizados no fim de semana;

SELECT IdTransacao,
       DtCriacao,
       
strftime('%w', datetime(substr(DtCriacao,1,19))) AS diaSemana

FROM transacoes
WHERE diaSemana IN ('6','0');


-- Lista de clientes com 100 a 200 pontos

SELECT IdCliente,
       QtdePontos
FROM clientes
WHERE QtdePontos >= 100 AND QtdePontos <=200;


-- Lista de produtos que o nome começa com ''Venda de'';

SELECT * 
FROM produtos 
WHERE DescDescricaoProduto LIKE 'Venda de%'

--Produtos que terminam com ''Lover'';

SELECT *
FROM produtos
WHERE DescDescricaoProduto LIKE '%Lover'

-- Produtos que são chapéu 

SELECT *
FROM produtos 
WHERE DescDescricaoProduto LIKE '%Chapéu%'


-- Lista de transações com o produto ''Resgatar Ponei'' 

SELECT *
FROM transacao_produto
WHERE IdProduto = 'Resgatar Ponei'


