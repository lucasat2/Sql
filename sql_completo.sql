--                  SELECT, WHERE E LIMIT 


--SELECT COMUM
SELECT idCliente,
       qtdePontos,
       DtAtualizacao 
FROM clientes;

--LIMIT 
SELECT * FROM clientes
LIMIT 10;

--WHERE
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






--                 CRIANDO NOVAS COLUNAS

SELECT * FROM clientes

--CRIAR NOVAS COLUNAS COM SELECT ( nao altera o banco ) 

SELECT idCliente,
        QtdePontos,
        QtdePontos + 10 AS QtdePontosPlus10,
        QtdePontos + 2 AS QtdePontosDouble,
        DtCriacao

FROM clientes



--                 DATAS

--CONVERTENDO STRING PARA DATA
SELECT  idCliente,
        DtCriacao,
        datetime(substr(DtCriacao, 1, 19)) AS dtCriacaoNova -- FATIAR A STRING E CONVERTER PRA DATA
FROM clientes

--PEGANDO O DIA DA SEMANA - O DOMINGO COMEÇA DO 0
SELECT  idCliente,
        DtCriacao,
        substr(DtCriacao, 1, 19) AS dtSubString,
        datetime(substr(DtCriacao, 1, 19)) AS dtCriacaoNova,
        strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaSemana 
FROM clientes


--                EXERCICIOS 1

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




--                     ORDER BY


--ORDERNAR DO QUE TEM MAIS 

SELECT * 
FROM clientes
ORDER BY QtdePontos DESC
LIMIT 10

-- ORDENANDO 2 COLUNAS DIFERENTES

SELECT * 
FROM clientes
WHERE flTwitch = 1 
ORDER BY DtCriacao ASC, QtdePontos DESC




--                    CASE WHEN 


-- O CASE WHEN É O IF DO SQL, O RESULTADO DO CASE GERA UMA NOVA COLUNA

SELECT idCliente,
       QtdePontos,
       CASE
           WHEN QtdePontos <= 500 THEN 'Ponei'
           WHEN QtdePontos > 500 AND QtdePontos <= 1000 THEN 'Ponei Premium'
           WHEN QtdePontos <= 5000 THEN 'Mago Aprendiz'
           WHEN QtdePontos <= 10000 THEN 'Mago Mestre'
           ELSE 'Mago Supremo'
       END AS NomeGrupo

FROM clientes

ORDER BY QtdePontos DESC




--                   COUNT

-- Tras a quantidade de linhas da tabela

SELECT count(*)
FROM clientes


--                   DISTINCT

-- Pega só os valores diferentes de uma linha e tira os valores repetidos.

SELECT
count(*),
count(DISTINCT IdTransacao),
count(DISTINCT IdCliente)

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

ORDER BY DtCriacao DESC;


--                  MEDIA AVG 

SELECT ROUND(AVG(QtdePontos),2) AS mediaPontos,
min(QtdePontos) AS menorCarteira,
max(QtdePontos) AS maiorCarteira
FROM clientes











