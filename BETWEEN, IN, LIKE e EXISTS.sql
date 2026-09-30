-- ============================================================
-- MISSÕES DA NOITE — TECHVENDAS S/A
-- Banco de Dados II - SENAC
-- BETWEEN, IN, LIKE e EXISTS
-- ============================================================
-- OBSERVAÇÃO: o enunciado não veio acompanhado de uma base de
-- dados pronta (apenas o PDF com as regras de negócio). Este
-- script cria um schema simples com clientes.renda e
-- produtos.estoque — colunas exigidas pelas missões e que não
-- existiam no banco do Challenge Night — e popula com dados de
-- exemplo pensados para cobrir todos os casos pedidos (faixas de
-- renda, cidades específicas, nomes com "A"/"Silva", vendedores
-- com "Eduardo", produtos em cada faixa de preço/estoque etc.).
-- Se a professora/o SENAC fornecer um arquivo de dados oficial,
-- troque só os INSERTs — as consultas continuam válidas.
-- ============================================================

CREATE DATABASE IF NOT EXISTS TechVendas_Missoes;
USE TechVendas_Missoes;

-- ============================================================
-- ESTRUTURA
-- ============================================================

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente      INTEGER       PRIMARY KEY,
    nome_cliente    VARCHAR(100)  NOT NULL,
    cidade          VARCHAR(80)   NOT NULL,
    renda           DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS vendedores (
    id_vendedor     INTEGER       PRIMARY KEY,
    nome_vendedor   VARCHAR(100)  NOT NULL
);

CREATE TABLE IF NOT EXISTS produtos (
    id_produto      INTEGER        PRIMARY KEY,
    nome_produto    VARCHAR(120)   NOT NULL,
    preco           DECIMAL(10,2)  NOT NULL,
    estoque         INTEGER        NOT NULL
);

CREATE TABLE IF NOT EXISTS vendas (
    id_venda        INTEGER        PRIMARY KEY,
    data_venda      DATE           NOT NULL,
    id_cliente      INTEGER        NOT NULL,
    id_vendedor     INTEGER        NOT NULL,
    valor_total     DECIMAL(10,2)  NOT NULL,
    CONSTRAINT fk_vendas_clientes
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_vendas_vendedores
        FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

CREATE TABLE IF NOT EXISTS itens_venda (
    id_item         INTEGER        PRIMARY KEY,
    id_venda        INTEGER        NOT NULL,
    id_produto      INTEGER        NOT NULL,
    quantidade      INTEGER        NOT NULL,
    CONSTRAINT fk_itens_venda
        FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    CONSTRAINT fk_itens_produtos
        FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- ============================================================
-- DADOS: CLIENTES
-- (misturando faixas de renda e cidades para cobrir as missões
-- 1, 4, 5, 6, 9, 12, 13, 15, 18 e 19)
-- ============================================================

INSERT IGNORE INTO clientes (id_cliente, nome_cliente, cidade, renda) VALUES
    (1,  'Ana Beatriz Silva',    'Curitiba',              5200.00),
    (2,  'André Costa',          'Colombo',               4300.00),
    (3,  'Bruno Fernandes Silva','São José dos Pinhais',  6800.00),
    (4,  'Camila Duarte',        'Curitiba',              3100.00),
    (5,  'Diego Martins',        'Colombo',               7600.00),
    (6,  'Eduarda Alves',        'São José dos Pinhais',  2900.00),
    (7,  'Felipe Rocha Silva',   'Curitiba',              9200.00),
    (8,  'Gabriela Costa',       'Araucária',             4100.00),
    (9,  'Henrique Silva',       'Curitiba',              5900.00),
    (10, 'Isabela Nunes',        'Campo Largo',           3400.00),
    (11, 'Amanda Ferreira',      'Curitiba',              6100.00),
    (12, 'João Ribeiro',         'Curitiba',              2200.00),
    (13, 'Karen Oliveira',       'Piraquara',             5300.00),
    (14, 'Lucas Ferreira',       'Colombo',               3900.00),
    (15, 'Ana Paula Souza',      'São José dos Pinhais',  7000.00);

-- ============================================================
-- DADOS: VENDEDORES
-- (com nomes contendo "Eduardo" em posições diferentes, para a
-- missão 14; e ids 1, 3 e 5 recebendo vendas, para a missão 11)
-- ============================================================

INSERT IGNORE INTO vendedores (id_vendedor, nome_vendedor) VALUES
    (1, 'Amanda Freire'),
    (2, 'Breno Paiva'),
    (3, 'Carlos Eduardo Nunes'),
    (4, 'Douglas Reis'),
    (5, 'Eduardo Lima'),
    (6, 'Fábio Moura'),
    (7, 'José Eduardo Silva'),
    (8, 'Hugo Andrade');

-- ============================================================
-- DADOS: PRODUTOS
-- (preços e estoques cobrindo as faixas das missões 8 e 20)
-- ============================================================

INSERT IGNORE INTO produtos (id_produto, nome_produto, preco, estoque) VALUES
    (1,  'Notebook Pro 14',        4599.90, 15),
    (2,  'Mouse Sem Fio',            89.90, 50),
    (3,  'Teclado Mecânico',        329.90, 30),
    (4,  'Monitor 24 Polegadas',    899.90, 10),
    (5,  'SSD 1 TB',                449.90, 25),
    (6,  'Webcam Full HD',          219.90, 22),
    (7,  'Headset Gamer',           289.90, 18),
    (8,  'Roteador Wi-Fi 6',        399.90, 12),
    (9,  'Fone Bluetooth',          199.90, 35),
    (10, 'Carregador Turbo',        119.90, 40),
    (11, 'Capa Antichoque',          69.90, 60),
    (12, 'Smartwatch Fit',          599.90,  8);

-- ============================================================
-- DADOS: VENDAS
-- (5 delas caem no 1º trimestre de 2025, para a missão 7;
-- clientes 3, 5, 6, 9, 11, 13 e 14 compram — os demais, não)
-- ============================================================

INSERT IGNORE INTO vendas (id_venda, data_venda, id_cliente, id_vendedor, valor_total) VALUES
    (1,  '2025-01-15', 3,  1, 850.00),
    (2,  '2025-02-10', 5,  3, 1200.00),
    (3,  '2025-03-05', 6,  5, 430.00),
    (4,  '2025-04-20', 9,  1, 670.00),
    (5,  '2025-05-12', 11, 3, 990.00),
    (6,  '2025-06-01', 13, 5, 310.00),
    (7,  '2025-01-25', 14, 1, 540.00),
    (8,  '2025-07-15', 3,  3, 275.00),
    (9,  '2025-08-02', 5,  5, 610.00),
    (10, '2025-03-28', 9,  1, 720.00);

-- ============================================================
-- DADOS: ITENS_VENDA
-- (produtos 4, 8, 11 e 12 nunca aparecem aqui — ficam "sem
-- vendas" de propósito, para as missões 2 e 16)
-- ============================================================

INSERT IGNORE INTO itens_venda (id_item, id_venda, id_produto, quantidade) VALUES
    (1,  1,  1, 1),
    (2,  1,  2, 2),
    (3,  2,  3, 1),
    (4,  2,  6, 2),
    (5,  3,  9, 3),
    (6,  4,  5, 1),
    (7,  5,  7, 2),
    (8,  6, 10, 4),
    (9,  7,  1, 1),
    (10, 8,  3, 2),
    (11, 9,  6, 1),
    (12, 10, 5, 2);


-- ============================================================
-- PARTE 1 — COALESCE
-- ============================================================

-- ------------------------------------------------------------
-- Missão 1 — Clientes sem compras
-- Obrigatório: LEFT JOIN, agregação e COALESCE
-- ------------------------------------------------------------
SELECT c.nome_cliente,
       c.cidade,
       COALESCE(SUM(v.valor_total), 0) AS valor_total_gasto
FROM clientes c
LEFT JOIN vendas v
    ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome_cliente, c.cidade
ORDER BY valor_total_gasto DESC;

-- ------------------------------------------------------------
-- Missão 2 — Produtos sem vendas
-- Obrigatório: LEFT JOIN, SUM() e COALESCE
-- ------------------------------------------------------------
SELECT p.nome_produto,
       p.preco,
       p.estoque,
       COALESCE(SUM(iv.quantidade), 0) AS quantidade_vendida
FROM produtos p
LEFT JOIN itens_venda iv
    ON iv.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome_produto, p.preco, p.estoque
ORDER BY quantidade_vendida DESC;

-- ------------------------------------------------------------
-- Missão 3 — Desempenho dos vendedores
-- Obrigatório: LEFT JOIN, COUNT(), SUM() e COALESCE
-- ------------------------------------------------------------
SELECT vd.nome_vendedor,
       COUNT(v.id_venda)               AS quantidade_vendas,
       COALESCE(SUM(v.valor_total), 0) AS faturamento_total
FROM vendedores vd
LEFT JOIN vendas v
    ON v.id_vendedor = vd.id_vendedor
GROUP BY vd.id_vendedor, vd.nome_vendedor
ORDER BY faturamento_total DESC;

-- ------------------------------------------------------------
-- Missão 4 — Classificação de clientes
-- Obrigatório: CTE, LEFT JOIN e COALESCE
-- ------------------------------------------------------------
WITH gasto_cliente AS (
    SELECT c.id_cliente,
           c.nome_cliente,
           c.cidade,
           COALESCE(SUM(v.valor_total), 0) AS total_gasto
    FROM clientes c
    LEFT JOIN vendas v
        ON v.id_cliente = c.id_cliente
    GROUP BY c.id_cliente, c.nome_cliente, c.cidade
)
SELECT nome_cliente,
       cidade,
       total_gasto
FROM gasto_cliente
ORDER BY total_gasto DESC;


-- ============================================================
-- PARTE 2 — BETWEEN e >= / <=
-- ============================================================

-- ------------------------------------------------------------
-- Missão 5 — Clientes por faixa de renda
-- Obrigatório: BETWEEN
-- ------------------------------------------------------------
SELECT nome_cliente,
       cidade,
       renda
FROM clientes
WHERE renda BETWEEN 3000 AND 6000
ORDER BY renda;

-- ------------------------------------------------------------
-- Missão 6 — Comparando formas de escrever intervalos
-- Mesma missão 5, sem usar BETWEEN
-- ------------------------------------------------------------
SELECT nome_cliente,
       cidade,
       renda
FROM clientes
WHERE renda >= 3000
  AND renda <= 6000
ORDER BY renda;

-- Os resultados são IDÊNTICOS às duas consultas. BETWEEN x AND y
-- é só um "açúcar sintático" para x <= coluna <= y — inclui os
-- dois limites (3000 e 6000 entram), exatamente como >= e <=
-- escritos separadamente.

-- ------------------------------------------------------------
-- Missão 7 — Período de vendas
-- Obrigatório: BETWEEN + JOIN
-- ------------------------------------------------------------
SELECT v.id_venda,
       v.data_venda,
       c.nome_cliente,
       vd.nome_vendedor
FROM vendas v
INNER JOIN clientes c
    ON c.id_cliente = v.id_cliente
INNER JOIN vendedores vd
    ON vd.id_vendedor = v.id_vendedor
WHERE v.data_venda BETWEEN '2025-01-01' AND '2025-03-31'
ORDER BY v.data_venda;

-- ------------------------------------------------------------
-- Missão 8 — Produtos em determinada faixa de preço
-- Sem usar BETWEEN
-- ------------------------------------------------------------
SELECT nome_produto,
       preco,
       estoque
FROM produtos
WHERE preco >= 100
  AND preco <= 250
ORDER BY preco;


-- ============================================================
-- PARTE 3 — IN
-- ============================================================

-- ------------------------------------------------------------
-- Missão 9 — Campanha regional
-- Obrigatório: IN
-- ------------------------------------------------------------
SELECT nome_cliente,
       cidade,
       renda
FROM clientes
WHERE cidade IN ('Curitiba', 'Colombo', 'São José dos Pinhais')
ORDER BY cidade, nome_cliente;

-- ------------------------------------------------------------
-- Missão 10 — Produtos selecionados
-- Obrigatório: IN
-- ------------------------------------------------------------
SELECT id_produto,
       nome_produto,
       preco,
       estoque
FROM produtos
WHERE id_produto IN (1, 3, 5, 7)
ORDER BY id_produto;

-- ------------------------------------------------------------
-- Missão 11 — Vendas de vendedores selecionados
-- Obrigatório: IN + JOIN
-- ------------------------------------------------------------
SELECT vd.nome_vendedor,
       v.id_venda,
       v.data_venda
FROM vendas v
INNER JOIN vendedores vd
    ON vd.id_vendedor = v.id_vendedor
WHERE v.id_vendedor IN (1, 3, 5)
ORDER BY vd.nome_vendedor, v.data_venda;


-- ============================================================
-- PARTE 4 — LIKE
-- ============================================================

-- ------------------------------------------------------------
-- Missão 12 — Busca por nomes (começam com "A")
-- Obrigatório: LIKE
-- ------------------------------------------------------------
SELECT nome_cliente,
       cidade,
       renda
FROM clientes
WHERE nome_cliente LIKE 'A%'
ORDER BY nome_cliente;

-- ------------------------------------------------------------
-- Missão 13 — Busca por sobrenome (terminam com "Silva")
-- ------------------------------------------------------------
SELECT nome_cliente,
       cidade,
       renda
FROM clientes
WHERE nome_cliente LIKE '%Silva'
ORDER BY nome_cliente;

-- ------------------------------------------------------------
-- Missão 14 — Busca por parte do nome ("Eduardo" em qualquer parte)
-- Obrigatório: LIKE com % antes e depois
-- ------------------------------------------------------------
SELECT id_vendedor,
       nome_vendedor
FROM vendedores
WHERE nome_vendedor LIKE '%Eduardo%'
ORDER BY nome_vendedor;


-- ============================================================
-- PARTE 5 — EXISTS
-- ============================================================

-- ------------------------------------------------------------
-- Missão 15 — Clientes que já compraram
-- Obrigatório: EXISTS (sem INNER JOIN)
-- ------------------------------------------------------------
SELECT c.id_cliente,
       c.nome_cliente,
       c.cidade
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM vendas v
    WHERE v.id_cliente = c.id_cliente
)
ORDER BY c.nome_cliente;

-- ------------------------------------------------------------
-- Missão 16 — Produtos que já foram vendidos
-- Obrigatório: EXISTS
-- ------------------------------------------------------------
SELECT p.id_produto,
       p.nome_produto,
       p.preco
FROM produtos p
WHERE EXISTS (
    SELECT 1
    FROM itens_venda iv
    WHERE iv.id_produto = p.id_produto
)
ORDER BY p.nome_produto;

-- ------------------------------------------------------------
-- Missão 17 — Vendedores ativos
-- Obrigatório: EXISTS
-- ------------------------------------------------------------
SELECT vd.id_vendedor,
       vd.nome_vendedor
FROM vendedores vd
WHERE EXISTS (
    SELECT 1
    FROM vendas v
    WHERE v.id_vendedor = vd.id_vendedor
)
ORDER BY vd.nome_vendedor;

-- ------------------------------------------------------------
-- Missão 18 — Clientes que NÃO compraram
-- Obrigatório: NOT EXISTS
-- ------------------------------------------------------------
SELECT c.nome_cliente,
       c.cidade,
       c.renda
FROM clientes c
WHERE NOT EXISTS (
    SELECT 1
    FROM vendas v
    WHERE v.id_cliente = c.id_cliente
)
ORDER BY c.nome_cliente;


-- ============================================================
-- PARTE 6 — COMBINANDO OS CONCEITOS
-- ============================================================

-- ------------------------------------------------------------
-- Missão 19 — Clientes de alto potencial
-- Obrigatório: BETWEEN + IN + EXISTS
-- ------------------------------------------------------------
SELECT c.nome_cliente,
       c.cidade,
       c.renda
FROM clientes c
WHERE c.renda BETWEEN 5000 AND 8000
  AND c.cidade IN ('Curitiba', 'Colombo', 'São José dos Pinhais')
  AND EXISTS (
        SELECT 1
        FROM vendas v
        WHERE v.id_cliente = c.id_cliente
      )
ORDER BY c.renda DESC;

-- ------------------------------------------------------------
-- Missão 20 — Produtos estratégicos
-- Obrigatório: BETWEEN + EXISTS
-- ------------------------------------------------------------
SELECT p.nome_produto,
       p.preco,
       p.estoque
FROM produtos p
WHERE p.preco BETWEEN 100 AND 300
  AND p.estoque > 20
  AND EXISTS (
        SELECT 1
        FROM itens_venda iv
        WHERE iv.id_produto = p.id_produto
      )
ORDER BY p.preco;

-- ============================================================
-- FIM DO SCRIPT
-- ============================================================