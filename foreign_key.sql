-- Exemplo de inserção sem integridade referencial
INSERT INTO pedidos (cliente_id, produto_id)
VALUES (999, 999);

-- Tabela clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela pedidos com chave estrangeira simples
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Teste de inserção inválida (cliente inexistente)
INSERT INTO pedidos (cliente_id)
VALUES (999);

-- Teste de inserção válida
INSERT INTO pedidos (cliente_id)
VALUES (1);

-- Tabela pedidos completa (cliente_id e produto_id)
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    quantidade INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Regra com exclusão em cascata (ON DELETE CASCADE)
FOREIGN KEY (cliente_id)
REFERENCES clientes(id)
ON DELETE CASCADE;

-- Passo 1: Apagar tabela antiga
DROP TABLE pedidos;

-- Passo 2: Criar pedidos com relacionamentos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    quantidade INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Passo 3: Inserir pedido com referências válidas
INSERT INTO pedidos (cliente_id, produto_id, quantidade, data_pedido)
VALUES (1, 1, 2, '2026-03-24');

-- Passo 4: Testar violação de chave estrangeira
INSERT INTO pedidos (cliente_id, produto_id)
VALUES (999, 1);
