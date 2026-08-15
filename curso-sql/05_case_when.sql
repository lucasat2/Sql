
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