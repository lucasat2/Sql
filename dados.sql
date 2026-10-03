CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    idade INTEGER,
    cidade TEXT,
    email TEXT
);

CREATE TABLE produtos (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    preco REAL,
    estoque INTEGER
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    produto_id INTEGER,
    quantidade INTEGER,
    valor_total REAL
);

INSERT INTO clientes (id, nome, idade, email)
VALUES (1, 'João Silva', 28, 'joao@email.com');

INSERT INTO clientes (id, nome, idade, email)
VALUES (2, 'Maria Souza', 32, 'maria@email.com');

INSERT INTO clientes (id, nome, idade, email)
VALUES (3, 'Pedro Santos', 19, 'pedro@email.com');

INSERT INTO clientes (id, nome, idade, email)
VALUES (4, 'Ana Costa', 25, 'ana@email.com');

INSERT INTO clientes (id, nome, idade, email)
VALUES (5, 'Lucas Oliveira', 40, 'lucas@email.com')
;


INSERT INTO produtos (id, nome, preco, estoque)
VALUES (1, 'Mouse Gamer', 149.90, 15);

INSERT INTO produtos (id, nome, preco, estoque)
VALUES (2, 'Teclado Mecânico', 299.90, 8);

INSERT INTO produtos (id, nome, preco, estoque)
VALUES (3, 'Monitor 24"', 899.90, 5);

INSERT INTO produtos (id, nome, preco, estoque)
VALUES (4, 'Headset', 199.90, 0);

INSERT INTO produtos (id, nome, preco, estoque)
VALUES (5, 'Webcam Full HD', 249.90, 0);


INSERT INTO pedidos VALUES
(1, 1, 1, 2, 300),
(2, 1, 2, 1, 320),

(3, 2, 7, 1, 4200),
(4, 2, 8, 2, 1000),

(5, 3, 1, 1, 150),
(6, 3, 5, 2, 560),

(7, 4, 3, 1, 950),

(8, 5, 1, 3, 450),
(9, 5, 2, 1, 320),
(10, 5, 5, 1, 280),

(11, 6, 4, 1, 1400),

(12, 7, 6, 2, 900),
(13, 7, 1, 2, 300),

(14, 8, 1, 1, 150),
(15, 8, 2, 1, 320),

(16, 9, 7, 1, 4200),

(17, 10, 8, 2, 1000),
(18, 10, 5, 1, 280);
