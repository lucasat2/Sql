SELECT * FROM clientes
------------------------------
-- CRIAR NOVAS COLUNAS COM SELECT ( nao altera o banco ) 

SELECT idCliente,
        QtdePontos,
        QtdePontos + 10 AS QtdePontosPlus10,
        QtdePontos + 2 AS QtdePontosDouble,
        DtCriacao

FROM clientes
------------------------------
-- CONVERTENDO STRING PARA DATA
SELECT  idCliente,
        DtCriacao,
        datetime(substr(DtCriacao, 1, 19)) AS dtCriacaoNova -- FATIAR A STRING E CONVERTER PRA DATA
FROM clientes
------------------------------
-- PEGANDO O DIA DA SEMANA - O DOMINGO COMEÇA DO 0
SELECT  idCliente,
        DtCriacao,
        substr(DtCriacao, 1, 19) AS dtSubString,
        datetime(substr(DtCriacao, 1, 19)) AS dtCriacaoNova,
        strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaSemana 
FROM clientes


