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




--                  GROUP BY

-- Agrupa por uma característica e conta

SELECT IdProduto,
       count(*)
FROM transacao_produto
GROUP BY IdProduto

-- Qual cliente mais juntou pontos em julho

SELECT idCliente,
       sum(QtdePontos) 
FROM transacoes
WHERE DtCriacao >='2025-07-01' AND DtCriacao <'2025-08-01'

GROUP BY IdCliente


--                 HAVING - é um filtro apos agrupar


SELECT idCliente,
       sum(QtdePontos),
       count(IdTransacao) 
FROM transacoes
WHERE DtCriacao >='2025-07-01' AND DtCriacao <'2025-08-01'

GROUP BY IdCliente
HAVING sum(QtdePontos) >= 4000
ORDER BY sum(QtdePontos) DESC
LIMIT 10 


--                 EXERCICIOS 2 - CASE WHEN

-- Listar todas as transacões adicionando uma coluna nova sinalizando
-- "alto", "médio" e "baixo" para o valor dos pontos [<10 ; <500; >=500]

SELECT IdTransacao,QtdePontos,
        CASE 
            WHEN qtdePontos < 10 THEN 'Baixo'
            WHEN qtdePontos < 500 THEN 'Medio'
            ELSE 'Alto'
        END AS flQtdePontos
FROM transacoes
ORDER BY QtdePontos DESC

--                 EXERCICIOS 3- AGREGACOES

-- 1) Quantos clientes tem email cadastrado?

--FORMA 1 
SELECT sum(flEmail) 
FROM clientes

--FORMA 2 (menos performatica)
SELECT COUNT(*) 
FROM clientes 
WHERE flEmail = 1 

--2) Qual o cliente juntou mais pontos positivos em 2025-05?

SELECT idCliente, 
        sum(qtdePontos) AS totalPontos 
FROM transacoes

WHERE DtCriacao >= '2025-05-01' AND DtCriacao < '2025-06-01' 
AND qtdePontos > 0

GROUP BY idCliente

ORDER BY sum(qtdePontos) DESC

LIMIT 1 


--3) Qual o cliente fez mais transacoes no ano de 2024

SELECT idCliente,
count(*)

FROM transacoes 

WHERE DtCriacao >= '2024-01-01' AND DtCriacao < '2025-01-01'

-- WHERE substr(DtCriacao, 1, 4) = '2024'

GROUP BY IdCliente

ORDER BY count(*) DESC

LIMIT 1 

--4) Quantos produtos são de RPG ?

SELECT count(*) FROM produtos 
WHERE DescCategoriaProduto = 'rpg';

--  forma 2 vendo todos os produtos
SELECT DescCategoriaProduto,
       count(*)
FROM produtos 
GROUP BY DescCategoriaProduto
ORDER BY count(*) DESC


--5) QUAL O VALOR MEDIO DE PONTOS POSITIVOS POR DIA 

SELECT SUM(qtdePontos) AS totalpontos,
       count(DISTINCT substr(DtCriacao, 1,10)) AS diasUnicos,
       sum(qtdePontos) / count(DISTINCT substr(DtCriacao, 1,10)) AS mediaPontosDia
        
FROM transacoes

WHERE qtdePontos > 0


--6) QUAL O DIA DA SEMANA TEM MAIS PEDIDOS EM 2025


SELECT 
       strftime('%w',substr(DtCriacao,1,10)) AS diaSemana,
       count(DISTINCT IdTransacao) AS qtdeTransacao

FROM transacoes 

WHERE substr(DtCriacao,1,4) = '2025'

GROUP BY 1
ORDER BY 2 DESC


--7) QUAL O PRODUTO MAIS TRANSACIONADO?

SELECT IdProduto,
        sum(QtdeProduto) AS soma

FROM transacao_produto

GROUP BY idProduto
ORDER BY sum(QtdeProduto) DESC
LIMIT 1


--8) QUAL O PRODUTO COM MAIS PONTOS TRANSACIONADOS?

SELECT IdProduto,
        sum(vlProduto * QtdeProduto) AS totalPontos,
        sum(QtdeProduto) AS qtdevenda

FROM transacao_produto

GROUP BY IdProduto
ORDER BY sum(vlProduto * QtdeProduto) DESC

-------------------------------------------------------------------------------------------------------------------------------------

--                                                        JOINS




























