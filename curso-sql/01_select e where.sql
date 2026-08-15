--                  SELECT COMUM
SELECT idCliente,
       qtdePontos,
       DtAtualizacao 
FROM clientes;
--------------------------------------
--                  LIMIT 
SELECT * FROM clientes
LIMIT 10;
--------------------------------------
--                  WHERE
SELECT * 
FROM produtos
WHERE DescCategoriaProduto = 'rpg';

--Selecione todos os clientes com email cadastrado 

SELECT * FROM clientes
WHERE flEmail = 1;

--Selecione todas as transacoes de 50 pontos(exatos)

SELECT * FROM transacoes
WHERE qtdePontos  = 50;

--Selecione todos os clientes com mais de 500 pontos

SELECT idCliente, qtdePontos FROM clientes
WHERE qtdePontos >= 500;

--Selecione produtos que tem 'aumentam' no nome 
SELECT * 
FROM produtos
WHERE DescDescricaoProduto LIKE '%aumentam%'; -- 

