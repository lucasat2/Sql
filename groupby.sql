Agrupar clientes

SELECT idade, COUNT(*)
FROM clientes
GROUP BY idade;


Pedidos por cliente

SELECT cliente_id, COUNT(*)
FROM pedidos
GROUP BY cliente_id;



Vendas por produto

SELECT produto_id, SUM(quantidade)
FROM pedidos
GROUP BY produto_id;


Ranking

SELECT cliente_id, COUNT(*) AS total
FROM pedidos
GROUP BY cliente_id
ORDER BY total DESC;



# 🧪 11. Atividades práticas

## 🟢 Atividade 1 — Clientes por idade

Mostre quantos clientes existem por idade.

---

## 🟡 Atividade 2 — Pedidos por cliente

Mostre quantos pedidos cada cliente fez.

---

## 🔵 Atividade 3 — Produtos vendidos

Mostre quantos itens foram vendidos por produto.

---

# 🔥 12. Desafio (nível mercado)

Você é analista de dados.

Crie consultas para:

1. Cliente que mais comprou
2. Produto mais vendido
3. Total de pedidos por cliente
4. Total de itens vendidos por produto
