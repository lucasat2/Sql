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

SELECT t1.*,
       t2.DescDescricaoProduto

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

limit 10


-- Qual categoria tem mais produtos vendidos? 

SELECT 
       t2.DescCategoriaProduto 
       count(DISTINCT t1.IdTransacao)

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto 

GROUP BY t2.DescCategoriaProduto
ORDER BY count(DISTINCT t1.IdTransacao) DESC


-- Em 2024, quantas transacoes de lovers tivemos?

SELECT COUNT(DISTINCT t1.IdTransacao)

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01' AND t1.DtCriacao < '2025-01-01'
AND t3.DescCategoriaProduto = 'lovers'
GROUP BY t3.DescCategoriaProduto


-- Qual mês tivemos mais lista de presença assinada?

SELECT

substr(t1.DtCriacao, 1, 7) AS anoMes,
count(distinct t1.IdTransacao) AS qtdeTransacao

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1. IdTransacao = t2. IdTransacao

LEFT JOIN produtos AS t3
ON t2. IdProduto = t3. IdProduto

WHERE t3.DescProduto = 'Lista de presenca'

GROUP BY substr(t1.DtCriacao, 1, 7)
ORDER BY qtdeTransacao DESC




-- Quais clientes mais perderam pontos por Lover?

SELECT t1. IdCliente,
sum(t1. QtdePontos) AS totalPontos

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1. IdTransacao = t2. IdTransacao

LEFT JOIN produtos AS t3
ON t2. IdProduto = t3. IdProduto

WHERE t3.DescCateogriaProduto = 'lovers'

GROUP BY t1. IdCliente

ORDER BY sum(t1. QtdePontos) ASC

LIMIT 5


-- Quais clientes assinaram a lista de presença no dia 2025/08/25?

SELECT t1. IdCliente,
count(*)

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1. IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2. IdProduto = t3. IdProduto

WHERE substr(t1.DtCriacao, 1,10) = '2025-08-25'
AND t3.DescProduto = 'Lista de presença'

GROUP BY t1.IdCliente

-- Do inicio ao fim do nosso curso (2025/08/25 a 2025/08/29),
-- quantos clientes assinaram a lista de presença?

SELECT count(DISTINCT t1.Idcliente)

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2025-08-25'
AND t1.DtCriacao < '2025-08-30'
AND t3.DescNomeProduto = 'Lista de presença'




-------------------------------------------------------------------------------------------------------------------------------------

--                                                        SUBQUERIES

SELECT count(DISTINCT idCliente)

FROM transacoes AS t1

WHERE t1.idCliente IN (

        SELECT DISTINCT idCliente 
        FROM transacoes 
        WHERE substr(DtCriacao,1,10) = '2025-08-25'

)
AND  substr(t1.DtCriacao,1,10) = '2025-08-29'

----------CTE


WITH tb_cliente_primeiro_dia AS (
SELECT DISTINCT IdCliente
FROM transacoes
WHERE substr(dtCriacao,1,10) = '2025-08-25'

),

tb_cliente_ultimo_dia AS (
SELECT DISTINCT IdCliente
FROM transacoes
WHERE substr(dtCriacao,1,10) = '2025-08-29'

),

tb_join AS (

        SELECT t1.idCliente AS primCliente,
               t2.idCliente AS ultCliente

        FROM tb_cliente_primeiro_dia AS t1

        LEFT JOIN tb_cliente_ultimo_dia AS t2
        ON t1. IdCliente = t2.IdCliente
)

SELECT count(primCliente),
       count(ultCliente),
       1. * count(ultCliente) / (primCliente)

FROM tb_join

























