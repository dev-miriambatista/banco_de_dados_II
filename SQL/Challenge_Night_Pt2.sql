-- ============================================================
-- CHALLENGE NIGHT II - JOINs AVANÇADOS
-- Banco de Dados II - SENAC
-- Cenário: TechVendas S/A
-- ============================================================

-- DROP DATABASE Challenge_Night_Pt2;
CREATE DATABASE IF NOT EXISTS Challenge_Night_Pt2;
USE Challenge_Night_Pt2;


-- ============================================================
-- ESTRUTURA DAS TABELAS
-- ============================================================

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente      INTEGER       PRIMARY KEY,
    nome_cliente    VARCHAR(100)  NOT NULL,
    cidade          VARCHAR(80)   NOT NULL,
    estado          CHAR(2)       NOT NULL
);

CREATE TABLE IF NOT EXISTS vendedores (
    id_vendedor     INTEGER       PRIMARY KEY,
    nome_vendedor   VARCHAR(100)  NOT NULL,
    setor           VARCHAR(50)   NOT NULL
);

CREATE TABLE IF NOT EXISTS produtos (
    id_produto      INTEGER        PRIMARY KEY,
    nome_produto    VARCHAR(120)   NOT NULL,
    categoria       VARCHAR(60)    NOT NULL,
    marca           VARCHAR(60)    NOT NULL,
    preco           DECIMAL(10,2)  NOT NULL
);

CREATE TABLE IF NOT EXISTS vendas (
    id_venda          INTEGER        PRIMARY KEY,
    data_venda        DATE           NOT NULL,
    id_cliente        INTEGER        NOT NULL,
    id_vendedor       INTEGER        NOT NULL,
    forma_pagamento   VARCHAR(40)    NOT NULL,
    status            VARCHAR(20)    NOT NULL,
    valor_total       DECIMAL(10,2)  NOT NULL,
    CONSTRAINT fk_vendas_clientes
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_vendas_vendedores
        FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

CREATE TABLE IF NOT EXISTS itens_venda (
    id_item          INTEGER        PRIMARY KEY,
    id_venda         INTEGER        NOT NULL,
    id_produto       INTEGER        NOT NULL,
    quantidade       INTEGER        NOT NULL,
    valor_unitario   DECIMAL(10,2)  NOT NULL,
    desconto         DECIMAL(5,2)   NOT NULL DEFAULT 0,
    CONSTRAINT fk_itens_venda
        FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    CONSTRAINT fk_itens_produtos
        FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- ============================================================
-- 50 REGISTROS: CLIENTES
-- ============================================================

INSERT IGNORE INTO clientes (id_cliente, nome_cliente, cidade, estado) VALUES
    (1, 'Ana Souza', 'Curitiba', 'PR'),
    (2, 'Bruno Lima', 'São José dos Pinhais', 'PR'),
    (3, 'Carla Mendes', 'Curitiba', 'PR'),
    (4, 'Diego Martins', 'Colombo', 'PR'),
    (5, 'Eduarda Alves', 'Pinhais', 'PR'),
    (6, 'Felipe Rocha', 'Curitiba', 'PR'),
    (7, 'Gabriela Costa', 'Araucária', 'PR'),
    (8, 'Henrique Silva', 'Curitiba', 'PR'),
    (9, 'Isabela Nunes', 'Campo Largo', 'PR'),
    (10, 'João Ribeiro', 'Curitiba', 'PR'),
    (11, 'Karen Oliveira', 'Piraquara', 'PR'),
    (12, 'Lucas Ferreira', 'Curitiba', 'PR'),
    (13, 'Mariana Gomes', 'Almirante Tamandaré', 'PR'),
    (14, 'Nicolas Santos', 'Curitiba', 'PR'),
    (15, 'Olívia Barros', 'Fazenda Rio Grande', 'PR'),
    (16, 'Paulo Moreira', 'Curitiba', 'PR'),
    (17, 'Queila Teixeira', 'Quatro Barras', 'PR'),
    (18, 'Rafael Cardoso', 'Curitiba', 'PR'),
    (19, 'Sabrina Correia', 'Campina Grande do Sul', 'PR'),
    (20, 'Thiago Lopes', 'Curitiba', 'PR'),
    (21, 'Úrsula Freitas', 'Mandirituba', 'PR'),
    (22, 'Vinícius Melo', 'Curitiba', 'PR'),
    (23, 'William Araújo', 'Rio Branco do Sul', 'PR'),
    (24, 'Yasmin Duarte', 'Curitiba', 'PR'),
    (25, 'Alice Pires', 'Joinville', 'SC'),
    (26, 'Bernardo Castro', 'Florianópolis', 'SC'),
    (27, 'Cecília Farias', 'Blumenau', 'SC'),
    (28, 'Daniela Reis', 'Itajaí', 'SC'),
    (29, 'Enzo Carvalho', 'São Paulo', 'SP'),
    (30, 'Fernanda Vieira', 'Campinas', 'SP'),
    (31, 'Gustavo Moraes', 'Sorocaba', 'SP'),
    (32, 'Helena Campos', 'Santos', 'SP'),
    (33, 'Igor Monteiro', 'Rio de Janeiro', 'RJ'),
    (34, 'Juliana Peixoto', 'Niterói', 'RJ'),
    (35, 'Kaique Batista', 'Belo Horizonte', 'MG'),
    (36, 'Larissa Cunha', 'Londrina', 'PR'),
    (37, 'Marcelo Prado', 'Maringá', 'PR'),
    (38, 'Natália Assis', 'Cascavel', 'PR'),
    (39, 'Otávio Rezende', 'Ponta Grossa', 'PR'),
    (40, 'Priscila Leal', 'Guarapuava', 'PR'),
    (41, 'Renato Diniz', 'Paranaguá', 'PR'),
    (42, 'Simone Amaral', 'Curitiba', 'PR'),
    (43, 'Tadeu Coelho', 'Curitiba', 'PR'),
    (44, 'Valéria Neves', 'Curitiba', 'PR'),
    (45, 'Wesley Ramos', 'Curitiba', 'PR'),
    (46, 'Adriana Luz', 'Curitiba', 'PR'),
    (47, 'Caio Borges', 'Curitiba', 'PR'),
    (48, 'Débora Matos', 'Curitiba', 'PR'),
    (49, 'Emanuel Pinto', 'Curitiba', 'PR'),
    (50, 'Flávia Xavier', 'Curitiba', 'PR');

-- ============================================================
-- 50 REGISTROS: VENDEDORES
-- ============================================================

INSERT IGNORE INTO vendedores (id_vendedor, nome_vendedor, setor) VALUES
    (1, 'Amanda Freire', 'Loja Física'),
    (2, 'Breno Paiva', 'E-commerce'),
    (3, 'Camila Sales', 'Corporativo'),
    (4, 'Douglas Reis', 'Televendas'),
    (5, 'Elaine Braga', 'Marketplace'),
    (6, 'Fábio Moura', 'Loja Física'),
    (7, 'Giovana Teles', 'E-commerce'),
    (8, 'Hugo Andrade', 'Corporativo'),
    (9, 'Ingrid Leite', 'Televendas'),
    (10, 'Jorge Cunha', 'Marketplace'),
    (11, 'Kátia Prado', 'Loja Física'),
    (12, 'Leandro Vaz', 'E-commerce'),
    (13, 'Mônica Dias', 'Corporativo'),
    (14, 'Natan Pacheco', 'Televendas'),
    (15, 'Patrícia Alves', 'Marketplace'),
    (16, 'Ricardo Falcão', 'Loja Física'),
    (17, 'Sara Brito', 'E-commerce'),
    (18, 'Tomás Queiroz', 'Corporativo'),
    (19, 'Vanessa Lins', 'Televendas'),
    (20, 'Yuri Bastos', 'Marketplace'),
    (21, 'Aline Rocha', 'Loja Física'),
    (22, 'Bruno Medeiros', 'E-commerce'),
    (23, 'Cláudia Fontes', 'Corporativo'),
    (24, 'Davi Correia', 'Televendas'),
    (25, 'Ester Maia', 'Marketplace'),
    (26, 'Fernando Lima', 'Loja Física'),
    (27, 'Graziella Moraes', 'E-commerce'),
    (28, 'Heitor Nunes', 'Corporativo'),
    (29, 'Iara Martins', 'Televendas'),
    (30, 'Jonas Cardoso', 'Marketplace'),
    (31, 'Kelly Ribeiro', 'Loja Física'),
    (32, 'Luan Pereira', 'E-commerce'),
    (33, 'Márcia Carvalho', 'Corporativo'),
    (34, 'Noel Souza', 'Televendas'),
    (35, 'Pamela Castro', 'Marketplace'),
    (36, 'Raul Mendes', 'Loja Física'),
    (37, 'Silvia Lopes', 'E-commerce'),
    (38, 'Túlio Barros', 'Corporativo'),
    (39, 'Vitória Gomes', 'Televendas'),
    (40, 'Wallace Freitas', 'Marketplace'),
    (41, 'Ágata Moreira', 'Loja Física'),
    (42, 'César Silva', 'E-commerce'),
    (43, 'Denise Oliveira', 'Corporativo'),
    (44, 'Edson Santos', 'Televendas'),
    (45, 'Francine Costa', 'Marketplace'),
    (46, 'Gilberto Melo', 'Loja Física'),
    (47, 'Heloísa Reis', 'E-commerce'),
    (48, 'Ítalo Vieira', 'Corporativo'),
    (49, 'Jéssica Pires', 'Televendas'),
    (50, 'Kevin Araújo', 'Marketplace');

-- ============================================================
-- 50 REGISTROS: PRODUTOS
-- ============================================================

INSERT IGNORE INTO produtos (id_produto, nome_produto, categoria, marca, preco) VALUES
    (1, 'Notebook Pro 14', 'Informática', 'TechPlus', 4599.90),
    (2, 'Mouse Sem Fio', 'Informática', 'ClickMax', 89.90),
    (3, 'Teclado Mecânico', 'Informática', 'KeyMaster', 329.90),
    (4, 'Monitor 24 Polegadas', 'Informática', 'Vision', 899.90),
    (5, 'SSD 1 TB', 'Informática', 'FastDrive', 449.90),
    (6, 'Webcam Full HD', 'Informática', 'Vision', 219.90),
    (7, 'Headset Gamer', 'Informática', 'SoundPlay', 289.90),
    (8, 'Roteador Wi-Fi 6', 'Informática', 'Connect', 399.90),
    (9, 'Impressora Multifuncional', 'Informática', 'PrintNow', 799.90),
    (10, 'Hub USB-C', 'Informática', 'Connect', 179.90),
    (11, 'Smartphone X1', 'Telefonia', 'MobileX', 1999.90),
    (12, 'Smartphone X2 Pro', 'Telefonia', 'MobileX', 3299.90),
    (13, 'Carregador Turbo', 'Telefonia', 'Volt', 119.90),
    (14, 'Capa Antichoque', 'Telefonia', 'SafeCase', 69.90),
    (15, 'Fone Bluetooth', 'Telefonia', 'SoundPlay', 199.90),
    (16, 'Smartwatch Fit', 'Wearables', 'Move', 599.90),
    (17, 'Pulseira Inteligente', 'Wearables', 'Move', 249.90),
    (18, 'TV 50 Polegadas 4K', 'TV e Vídeo', 'Vision', 2699.90),
    (19, 'Soundbar 2.1', 'Áudio', 'SoundPlay', 999.90),
    (20, 'Caixa de Som Bluetooth', 'Áudio', 'BeatBox', 349.90),
    (21, 'Air Fryer 5L', 'Eletrodomésticos', 'CasaFácil', 549.90),
    (22, 'Liquidificador 1200W', 'Eletrodomésticos', 'CasaFácil', 229.90),
    (23, 'Cafeteira Elétrica', 'Eletrodomésticos', 'BelaCasa', 189.90),
    (24, 'Micro-ondas 32L', 'Eletrodomésticos', 'BelaCasa', 799.90),
    (25, 'Aspirador Vertical', 'Eletrodomésticos', 'CleanHome', 499.90),
    (26, 'Ventilador de Coluna', 'Climatização', 'FreshAir', 299.90),
    (27, 'Climatizador Portátil', 'Climatização', 'FreshAir', 699.90),
    (28, 'Ar-condicionado 12000 BTU', 'Climatização', 'FreshAir', 2399.90),
    (29, 'Panela Elétrica', 'Eletrodomésticos', 'CasaFácil', 319.90),
    (30, 'Grill Elétrico', 'Eletrodomésticos', 'CasaFácil', 249.90),
    (31, 'Lava-louças 10 Serviços', 'Eletrodomésticos', 'CleanHome', 2999.90),
    (32, 'Máquina de Lavar 12kg', 'Eletrodomésticos', 'CleanHome', 2299.90),
    (33, 'Geladeira Duplex 400L', 'Eletrodomésticos', 'BelaCasa', 3499.90),
    (34, 'Forno Elétrico 50L', 'Eletrodomésticos', 'BelaCasa', 899.90),
    (35, 'Cooktop de Indução', 'Eletrodomésticos', 'CasaFácil', 1399.90),
    (36, 'Ferro a Vapor', 'Eletroportáteis', 'CasaFácil', 159.90),
    (37, 'Secador de Cabelo', 'Cuidados Pessoais', 'BeautyPro', 199.90),
    (38, 'Chapinha Cerâmica', 'Cuidados Pessoais', 'BeautyPro', 169.90),
    (39, 'Barbeador Elétrico', 'Cuidados Pessoais', 'BeautyPro', 249.90),
    (40, 'Escova Secadora', 'Cuidados Pessoais', 'BeautyPro', 229.90),
    (41, 'Câmera de Segurança', 'Segurança', 'SafeHome', 399.90),
    (42, 'Fechadura Digital', 'Segurança', 'SafeHome', 699.90),
    (43, 'Campainha Inteligente', 'Segurança', 'SafeHome', 449.90),
    (44, 'Lâmpada Inteligente', 'Casa Inteligente', 'SmartCasa', 79.90),
    (45, 'Tomada Inteligente', 'Casa Inteligente', 'SmartCasa', 99.90),
    (46, 'Robô Aspirador', 'Casa Inteligente', 'SmartCasa', 1499.90),
    (47, 'Projetor Portátil', 'TV e Vídeo', 'Vision', 1899.90),
    (48, 'Controle Universal', 'TV e Vídeo', 'Connect', 129.90),
    (49, 'Suporte Articulado TV', 'TV e Vídeo', 'SafeMount', 199.90),
    (50, 'Filtro de Linha', 'Acessórios', 'Volt', 89.90);

-- ============================================================
-- 50 REGISTROS: VENDAS
-- ============================================================

INSERT IGNORE INTO vendas (
    id_venda,
    data_venda,
    id_cliente,
    id_vendedor,
    forma_pagamento,
    status,
    valor_total
) VALUES
    (1, '2026-01-09', 7, 3, 'Pix', 'Concluída', 317.45),
    (2, '2026-01-13', 14, 6, 'Cartão de Crédito', 'Concluída', 454.90),
    (3, '2026-01-17', 21, 9, 'Boleto', 'Concluída', 592.35),
    (4, '2026-01-21', 28, 12, 'Dinheiro', 'Pendente', 729.80),
    (5, '2026-01-25', 35, 15, 'Cartão de Débito', 'Cancelada', 867.25),
    (6, '2026-01-29', 7, 18, 'Pix', 'Concluída', 1004.70),
    (7, '2026-02-02', 14, 1, 'Cartão de Crédito', 'Concluída', 1142.15),
    (8, '2026-02-06', 21, 4, 'Boleto', 'Concluída', 1279.60),
    (9, '2026-02-10', 28, 7, 'Dinheiro', 'Pendente', 1417.05),
    (10, '2026-02-14', 35, 10, 'Cartão de Débito', 'Cancelada', 1554.50),
    (11, '2026-02-18', 7, 13, 'Pix', 'Concluída', 1691.95),
    (12, '2026-02-22', 14, 16, 'Cartão de Crédito', 'Concluída', 1829.40),
    (13, '2026-02-26', 21, 19, 'Boleto', 'Concluída', 1966.85),
    (14, '2026-03-02', 28, 2, 'Dinheiro', 'Pendente', 2104.30),
    (15, '2026-03-06', 35, 5, 'Cartão de Débito', 'Cancelada', 2241.75),
    (16, '2026-03-10', 7, 8, 'Pix', 'Concluída', 2379.20),
    (17, '2026-03-14', 14, 11, 'Cartão de Crédito', 'Concluída', 2516.65),
    (18, '2026-03-18', 21, 14, 'Boleto', 'Concluída', 2654.10),
    (19, '2026-03-22', 28, 17, 'Dinheiro', 'Pendente', 2791.55),
    (20, '2026-03-26', 35, 20, 'Cartão de Débito', 'Cancelada', 2929.00),
    (21, '2026-03-30', 7, 3, 'Pix', 'Concluída', 3066.45),
    (22, '2026-04-03', 14, 6, 'Cartão de Crédito', 'Concluída', 3203.90),
    (23, '2026-04-07', 21, 9, 'Boleto', 'Concluída', 3341.35),
    (24, '2026-04-11', 28, 12, 'Dinheiro', 'Pendente', 3478.80),
    (25, '2026-04-15', 35, 15, 'Cartão de Débito', 'Cancelada', 3616.25),
    (26, '2026-04-19', 7, 18, 'Pix', 'Concluída', 3753.70),
    (27, '2026-04-23', 14, 1, 'Cartão de Crédito', 'Concluída', 3891.15),
    (28, '2026-04-27', 21, 4, 'Boleto', 'Concluída', 4028.60),
    (29, '2026-05-01', 28, 7, 'Dinheiro', 'Pendente', 4166.05),
    (30, '2026-05-05', 35, 10, 'Cartão de Débito', 'Cancelada', 4303.50),
    (31, '2026-05-09', 7, 13, 'Pix', 'Concluída', 4440.95),
    (32, '2026-05-13', 14, 16, 'Cartão de Crédito', 'Concluída', 4578.40),
    (33, '2026-05-17', 21, 19, 'Boleto', 'Concluída', 4715.85),
    (34, '2026-05-21', 28, 2, 'Dinheiro', 'Pendente', 4853.30),
    (35, '2026-05-25', 35, 5, 'Cartão de Débito', 'Cancelada', 190.75),
    (36, '2026-05-29', 7, 8, 'Pix', 'Concluída', 328.20),
    (37, '2026-06-02', 14, 11, 'Cartão de Crédito', 'Concluída', 465.65),
    (38, '2026-06-06', 21, 14, 'Boleto', 'Concluída', 603.10),
    (39, '2026-06-10', 28, 17, 'Dinheiro', 'Pendente', 740.55),
    (40, '2026-06-14', 35, 20, 'Cartão de Débito', 'Cancelada', 878.00),
    (41, '2026-06-18', 7, 3, 'Pix', 'Concluída', 1015.45),
    (42, '2026-06-22', 14, 6, 'Cartão de Crédito', 'Concluída', 1152.90),
    (43, '2026-06-26', 21, 9, 'Boleto', 'Concluída', 1290.35),
    (44, '2026-06-30', 28, 12, 'Dinheiro', 'Pendente', 1427.80),
    (45, '2026-01-05', 35, 15, 'Cartão de Débito', 'Cancelada', 1565.25),
    (46, '2026-01-09', 7, 18, 'Pix', 'Concluída', 1702.70),
    (47, '2026-01-13', 14, 1, 'Cartão de Crédito', 'Concluída', 1840.15),
    (48, '2026-01-17', 21, 4, 'Boleto', 'Concluída', 1977.60),
    (49, '2026-01-21', 28, 7, 'Dinheiro', 'Pendente', 2115.05),
    (50, '2026-01-25', 35, 10, 'Cartão de Débito', 'Cancelada', 2252.50);

-- ============================================================
-- 50 REGISTROS: ITENS_VENDA
-- ============================================================

INSERT IGNORE INTO itens_venda (
    id_item,
    id_venda,
    id_produto,
    quantidade,
    valor_unitario,
    desconto
) VALUES
    (1, 1, 9, 2, 759.90, 5.00),
    (2, 2, 18, 3, 2429.91, 10.00),
    (3, 3, 27, 4, 734.89, 15.00),
    (4, 4, 36, 1, 159.90, 20.00),
    (5, 5, 5, 2, 427.40, 0.00),
    (6, 6, 14, 3, 62.91, 5.00),
    (7, 7, 23, 4, 199.40, 10.00),
    (8, 8, 32, 1, 2299.90, 15.00),
    (9, 9, 1, 2, 4369.90, 20.00),
    (10, 10, 10, 3, 161.91, 0.00),
    (11, 11, 19, 4, 1049.89, 5.00),
    (12, 12, 28, 1, 2399.90, 10.00),
    (13, 13, 37, 2, 189.91, 15.00),
    (14, 14, 6, 3, 197.91, 20.00),
    (15, 15, 15, 4, 209.90, 0.00),
    (16, 16, 24, 1, 799.90, 5.00),
    (17, 17, 33, 2, 3324.90, 10.00),
    (18, 18, 2, 3, 80.91, 15.00),
    (19, 19, 11, 4, 2099.89, 20.00),
    (20, 20, 20, 1, 349.90, 0.00),
    (21, 21, 29, 2, 303.90, 5.00),
    (22, 22, 38, 3, 152.91, 10.00),
    (23, 23, 7, 4, 304.39, 15.00),
    (24, 24, 16, 1, 599.90, 20.00),
    (25, 25, 25, 2, 474.90, 0.00),
    (26, 26, 34, 3, 809.91, 5.00),
    (27, 27, 3, 4, 346.39, 10.00),
    (28, 28, 12, 1, 3299.90, 15.00),
    (29, 29, 21, 2, 522.40, 20.00),
    (30, 30, 30, 3, 224.91, 0.00),
    (31, 31, 39, 4, 262.40, 5.00),
    (32, 32, 8, 1, 399.90, 10.00),
    (33, 33, 17, 2, 237.41, 15.00),
    (34, 34, 26, 3, 269.91, 20.00),
    (35, 35, 35, 4, 1469.90, 0.00),
    (36, 36, 4, 1, 899.90, 5.00),
    (37, 37, 13, 2, 113.91, 10.00),
    (38, 38, 22, 3, 206.91, 15.00),
    (39, 39, 31, 4, 3149.90, 20.00),
    (40, 40, 40, 1, 229.90, 0.00),
    (41, 41, 9, 2, 759.90, 5.00),
    (42, 42, 18, 3, 2429.91, 10.00),
    (43, 43, 27, 4, 734.89, 15.00),
    (44, 44, 36, 1, 159.90, 20.00),
    (45, 45, 5, 2, 427.40, 0.00),
    (46, 46, 14, 3, 62.91, 5.00),
    (47, 47, 23, 4, 199.40, 10.00),
    (48, 48, 32, 1, 2299.90, 15.00),
    (49, 49, 1, 2, 4369.90, 20.00),
    (50, 50, 10, 3, 161.91, 0.00);

-- ============================================================
-- TABELAS AUXILIARES (EXERCÍCIOS 12 E 13)
-- Cenário: a TechVendas adquiriu outra empresa.
-- ============================================================

CREATE TABLE IF NOT EXISTS clientes_techvendas (
    id_cliente      INTEGER       PRIMARY KEY,
    nome_cliente    VARCHAR(100)  NOT NULL,
    cidade          VARCHAR(80)   NOT NULL,
    estado          CHAR(2)       NOT NULL
);

INSERT IGNORE INTO clientes_techvendas (id_cliente, nome_cliente, cidade, estado)
SELECT c.id_cliente,
       c.nome_cliente,
       c.cidade,
       c.estado
FROM clientes c;

CREATE TABLE IF NOT EXISTS clientes_empresa_adquirida (
    id_cliente      INTEGER       PRIMARY KEY,
    nome_cliente    VARCHAR(100)  NOT NULL,
    cidade          VARCHAR(80)   NOT NULL,
    estado          CHAR(2)       NOT NULL
);

-- 5 clientes em comum com a TechVendas + 5 exclusivos da adquirida
INSERT IGNORE INTO clientes_empresa_adquirida (id_cliente, nome_cliente, cidade, estado) VALUES
    (1,  'Adriana Luz',        'Curitiba',             'PR'),
    (2,  'Caio Borges',        'Curitiba',             'PR'),
    (3,  'Débora Matos',       'Curitiba',             'PR'),
    (4,  'Emanuel Pinto',      'Curitiba',             'PR'),
    (5,  'Flávia Xavier',      'Curitiba',             'PR'),
    (6,  'Marcos Tavares',     'Curitiba',             'PR'),
    (7,  'Renata Aguiar',      'Pinhais',              'PR'),
    (8,  'Sérgio Bittencourt', 'Colombo',              'PR'),
    (9,  'Tatiane Lacerda',    'São José dos Pinhais', 'PR'),
    (10, 'Vera Andrade',       'Curitiba',             'PR');

-- ============================================================
-- ÍNDICES NAS CHAVES UTILIZADAS NOS JOINS
-- ============================================================
-- MySQL não aceita "CREATE INDEX IF NOT EXISTS", então a
-- existência é checada via information_schema antes de criar
-- cada índice, evitando erro em uma segunda execução.
-- ============================================================

DROP PROCEDURE IF EXISTS criar_indice_se_nao_existir;

DELIMITER $$
CREATE PROCEDURE criar_indice_se_nao_existir(
    IN p_tabela VARCHAR(64),
    IN p_indice VARCHAR(64),
    IN p_coluna VARCHAR(64)
)
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.statistics
        WHERE table_schema = DATABASE()
          AND table_name   = p_tabela
          AND index_name   = p_indice
    ) THEN
        SET @ddl = CONCAT('CREATE INDEX ', p_indice, ' ON ', p_tabela, ' (', p_coluna, ')');
        PREPARE stmt FROM @ddl;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$
DELIMITER ;

CALL criar_indice_se_nao_existir('vendas', 'idx_vendas_cliente', 'id_cliente');
CALL criar_indice_se_nao_existir('vendas', 'idx_vendas_vendedor', 'id_vendedor');
CALL criar_indice_se_nao_existir('itens_venda', 'idx_itens_venda_venda', 'id_venda');
CALL criar_indice_se_nao_existir('itens_venda', 'idx_itens_venda_produto', 'id_produto');

DROP PROCEDURE criar_indice_se_nao_existir;


-- ============================================================
-- EXERCÍCIO 01 – CLIENTES E COMPRAS
-- ============================================================
-- Liste todos os clientes cadastrados, informando:
--   Nome do cliente / Cidade / Quantidade de compras / Valor total comprado
-- Clientes que nunca compraram também devem aparecer.
--
-- JOIN: LEFT JOIN, para preservar os clientes sem nenhuma venda.
-- ============================================================

SELECT c.nome_cliente,
       c.cidade,
       COUNT(v.id_venda)                  AS quantidade_vendas,
       COALESCE(SUM(v.valor_total), 0)    AS valor_total_vendas
FROM clientes c
LEFT JOIN vendas v
    ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente,
         c.nome_cliente,
         c.cidade
ORDER BY valor_total_vendas DESC;


-- ============================================================
-- EXERCÍCIO 02 – PRODUTOS COMERCIALIZADOS
-- ============================================================
-- Nome do produto / Categoria / Quantidade vendida / Faturamento
-- Produtos sem vendas devem aparecer com valores zerados.
--
-- JOIN: LEFT JOIN + COALESCE para zerar os produtos sem venda.
-- ============================================================

SELECT p.nome_produto,
       p.categoria,
       COALESCE(SUM(iv.quantidade), 0)                     AS quantidade_vendida,
       COALESCE(SUM(iv.valor_unitario * iv.quantidade), 0) AS faturamento
FROM produtos p
LEFT JOIN itens_venda iv
    ON p.id_produto = iv.id_produto
GROUP BY p.id_produto,
         p.nome_produto,
         p.categoria
ORDER BY faturamento DESC;


-- ============================================================
-- EXERCÍCIO 03 – DESEMPENHO DOS VENDEDORES
-- ============================================================
-- Nome / Setor / Quantidade de vendas / Faturamento
-- Vendedores sem vendas também devem aparecer.
--
-- Observação: COUNT(DISTINCT v.id_venda) evita contar a mesma
-- venda duas vezes caso ela possua mais de um item.
-- ============================================================

SELECT vd.nome_vendedor,
       vd.setor,
       COUNT(DISTINCT v.id_venda)                          AS quantidade_vendas,
       COALESCE(SUM(iv.valor_unitario * iv.quantidade), 0) AS faturamento
FROM vendedores vd
LEFT JOIN vendas v
    ON vd.id_vendedor = v.id_vendedor
LEFT JOIN itens_venda iv
    ON v.id_venda = iv.id_venda
GROUP BY vd.id_vendedor,
         vd.nome_vendedor,
         vd.setor
ORDER BY faturamento DESC;


-- ============================================================
-- EXERCÍCIO 04 – AUDITORIA DE CLIENTES
-- ============================================================
-- CTE com os clientes e suas compras; depois classifica quem
-- nunca comprou como INATIVO.
-- ============================================================

WITH clientes_status AS (
    SELECT c.id_cliente,
           c.nome_cliente,
           COUNT(v.id_venda) AS quantidade_vendas
    FROM clientes c
    LEFT JOIN vendas v
        ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente, c.nome_cliente
)
SELECT nome_cliente,
       quantidade_vendas,
       CASE
           WHEN quantidade_vendas > 0 THEN 'ATIVO'
           ELSE 'INATIVO'
       END AS status
FROM clientes_status
ORDER BY quantidade_vendas, nome_cliente;


-- ============================================================
-- EXERCÍCIO 05 – AUDITORIA DE PRODUTOS
-- ============================================================
-- CTE com a contagem de vendas de cada produto; depois lista
-- apenas os produtos que NUNCA foram vendidos.
-- ============================================================

WITH produtos_venda AS (
    SELECT p.id_produto,
           p.nome_produto,
           p.categoria,
           COUNT(iv.id_produto) AS produtos_vendidos
    FROM produtos p
    LEFT JOIN itens_venda iv
        ON p.id_produto = iv.id_produto
    GROUP BY p.id_produto, p.nome_produto, p.categoria
)
SELECT nome_produto,
       categoria,
       produtos_vendidos
FROM produtos_venda
WHERE produtos_vendidos = 0
ORDER BY nome_produto;


-- ============================================================
-- EXERCÍCIO 06 – RANKING COMERCIAL
-- ============================================================
-- CTE com o faturamento de cada vendedor + classificação com CASE.
-- ============================================================

WITH ranking_vendedores AS (
    SELECT vd.id_vendedor,
           vd.nome_vendedor,
           COALESCE(SUM(iv.valor_unitario * iv.quantidade), 0) AS faturamento
    FROM vendedores vd
    LEFT JOIN vendas v
        ON v.id_vendedor = vd.id_vendedor
    LEFT JOIN itens_venda iv
        ON iv.id_venda = v.id_venda
    GROUP BY vd.id_vendedor, vd.nome_vendedor
)
SELECT nome_vendedor,
       faturamento,
       CASE
           WHEN faturamento > 16000.00                        THEN 'EXCELENTE'
           WHEN faturamento BETWEEN 9000.00 AND 16000.00      THEN 'BOM'
           WHEN faturamento BETWEEN 0.01    AND 8999.99       THEN 'REGULAR'
           ELSE 'SEM VENDAS'
       END AS status
FROM ranking_vendedores
ORDER BY faturamento DESC;


-- ============================================================
-- EXERCÍCIO 07 – PRODUTOS ACIMA DA MÉDIA
-- ============================================================
-- CTE com o faturamento por produto; a consulta principal filtra
-- quem está acima da média geral.
-- ============================================================

WITH faturamento_produto AS (
    SELECT p.id_produto,
           p.nome_produto,
           COALESCE(SUM(iv.valor_unitario * iv.quantidade), 0) AS faturamento
    FROM produtos p
    LEFT JOIN itens_venda iv
        ON p.id_produto = iv.id_produto
    GROUP BY p.id_produto, p.nome_produto
)
SELECT nome_produto,
       faturamento
FROM faturamento_produto
WHERE faturamento > (
        SELECT AVG(faturamento)
        FROM faturamento_produto
      )
ORDER BY faturamento DESC;


-- ============================================================
-- EXERCÍCIO 08 – CATEGORIAS ESTRATÉGICAS
-- ============================================================
-- Categoria / Qtd de produtos / Produtos vendidos /
-- Produtos nunca vendidos / Faturamento
-- Categorias sem vendas também devem aparecer.
-- ============================================================

WITH relatorio_produtos AS (
    SELECT p.categoria,
           COUNT(DISTINCT p.id_produto)           AS quantidade_produto,
           COUNT(DISTINCT iv.id_produto)          AS quantidade_vendidos,
           SUM(iv.valor_unitario * iv.quantidade) AS faturamento
    FROM produtos p
    LEFT JOIN itens_venda iv
        ON p.id_produto = iv.id_produto
    GROUP BY p.categoria
)
SELECT categoria,
       quantidade_produto,
       quantidade_vendidos,
       quantidade_produto - quantidade_vendidos AS produtos_nunca_vendidos,
       COALESCE(faturamento, 0)                 AS faturamento
FROM relatorio_produtos
ORDER BY faturamento DESC;


-- ============================================================
-- EXERCÍCIO 09 – DASHBOARD DE CLIENTES
-- ============================================================
-- Cliente / Qtd de compras / Valor total / Ticket médio / Classificação
-- Clientes sem compras devem aparecer.
-- ============================================================

WITH dashboard AS (
    SELECT c.id_cliente,
           c.nome_cliente,
           COUNT(v.id_venda)               AS quantidade_compras,
           COALESCE(SUM(v.valor_total), 0) AS valor_total,
           COALESCE(AVG(v.valor_total), 0) AS ticket_medio
    FROM clientes c
    LEFT JOIN vendas v
        ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente, c.nome_cliente
)
SELECT nome_cliente,
       quantidade_compras,
       valor_total,
       ticket_medio,
       CASE
           WHEN valor_total > 20000                   THEN 'EXCELENTE'
           WHEN valor_total BETWEEN 10000 AND 20000   THEN 'BOM'
           WHEN valor_total BETWEEN 0.01  AND 9999.99 THEN 'REGULAR'
           ELSE 'SEM COMPRAS'
       END AS classificacao
FROM dashboard
ORDER BY valor_total DESC;


-- ============================================================
-- EXERCÍCIO 10 – DASHBOARD DE PRODUTOS
-- ============================================================
-- Quantidade vendida / Valor vendido / % de participação nas vendas
-- Produtos sem vendas devem aparecer.
--
-- O CROSS JOIN com a CTE de uma linha só repete o total geral em
-- todas as linhas sem recalcular a soma a cada registro.
-- ============================================================

WITH faturamento_produto AS (
    SELECT p.id_produto,
           p.nome_produto,
           p.categoria,
           COALESCE(SUM(iv.quantidade), 0)                     AS quantidade_vendida,
           COALESCE(SUM(iv.valor_unitario * iv.quantidade), 0)  AS valor_vendido
    FROM produtos p
    LEFT JOIN itens_venda iv
        ON p.id_produto = iv.id_produto
    GROUP BY p.id_produto, p.nome_produto, p.categoria
),
total_geral AS (
    SELECT SUM(valor_vendido) AS faturamento_total
    FROM faturamento_produto
)
SELECT fp.nome_produto,
       fp.categoria,
       fp.quantidade_vendida,
       fp.valor_vendido,
       ROUND(fp.valor_vendido * 100 / tg.faturamento_total, 2) AS percentual_participacao
FROM faturamento_produto fp
CROSS JOIN total_geral tg
ORDER BY percentual_participacao DESC;


-- ============================================================
-- EXERCÍCIO 11 – AUDITORIA COMPLETA
-- ============================================================
-- Relatório identificando produtos vendidos x nunca vendidos.
--
-- JOIN UTILIZADO: LEFT JOIN, com a tabela produtos à esquerda.
-- Motivo: a lista completa de produtos cadastrados precisa
-- aparecer inteira. O INNER JOIN devolveria apenas os que
-- venderam, e é justamente a AUSÊNCIA de correspondência
-- (pv.id_produto IS NULL) que identifica o produto nunca vendido.
-- ============================================================

WITH produtos_vendidos AS (
    SELECT iv.id_produto,
           SUM(iv.quantidade)                     AS quantidade_vendida,
           SUM(iv.valor_unitario * iv.quantidade) AS faturamento
    FROM itens_venda iv
    GROUP BY iv.id_produto
)
SELECT p.nome_produto,
       p.categoria,
       COALESCE(pv.quantidade_vendida, 0) AS quantidade_vendida,
       COALESCE(pv.faturamento, 0)        AS faturamento,
       CASE
           WHEN pv.id_produto IS NULL THEN 'NUNCA VENDIDO'
           ELSE 'VENDIDO'
       END AS situacao
FROM produtos p
LEFT JOIN produtos_vendidos pv
    ON p.id_produto = pv.id_produto
ORDER BY situacao, faturamento DESC;


-- ============================================================
-- EXERCÍCIO 12 – INTEGRAÇÃO DE SISTEMAS
-- ============================================================
-- Clientes apenas na TechVendas / apenas na adquirida / em ambas.
--
-- O MySQL não possui FULL OUTER JOIN nativo, então ele é simulado
-- com LEFT JOIN + UNION + RIGHT JOIN.
-- O UNION (sem ALL) é obrigatório: ele elimina as linhas de
-- interseção, que aparecem nos dois lados da simulação.
-- A chave de comparação é o nome, porque os IDs das duas bases
-- são independentes entre si.
-- ============================================================

SELECT ct.nome_cliente AS cliente_techvendas,
       ea.nome_cliente AS cliente_adquirida,
       CASE
           WHEN ea.nome_cliente IS NULL THEN 'APENAS TECHVENDAS'
           WHEN ct.nome_cliente IS NULL THEN 'APENAS ADQUIRIDA'
           ELSE 'PRESENTE EM AMBAS'
       END AS origem
FROM clientes_techvendas ct
LEFT JOIN clientes_empresa_adquirida ea
    ON ea.nome_cliente = ct.nome_cliente

UNION

SELECT ct.nome_cliente,
       ea.nome_cliente,
       CASE
           WHEN ea.nome_cliente IS NULL THEN 'APENAS TECHVENDAS'
           WHEN ct.nome_cliente IS NULL THEN 'APENAS ADQUIRIDA'
           ELSE 'PRESENTE EM AMBAS'
       END
FROM clientes_techvendas ct
RIGHT JOIN clientes_empresa_adquirida ea
    ON ea.nome_cliente = ct.nome_cliente

ORDER BY origem, cliente_techvendas, cliente_adquirida;


-- ============================================================
-- EXERCÍCIO 13 – AUDITORIA DE CADASTROS
-- ============================================================
-- Quantos clientes existem só na base antiga, só na nova e em ambas.
-- Resultado esperado: 45 / 5 / 5 (total 55).
-- ============================================================

WITH base_unificada AS (
    SELECT ct.nome_cliente AS nome_tech,
           ea.nome_cliente AS nome_adq
    FROM clientes_techvendas ct
    LEFT JOIN clientes_empresa_adquirida ea
        ON ea.nome_cliente = ct.nome_cliente

    UNION

    SELECT ct.nome_cliente,
           ea.nome_cliente
    FROM clientes_techvendas ct
    RIGHT JOIN clientes_empresa_adquirida ea
        ON ea.nome_cliente = ct.nome_cliente
)
SELECT SUM(CASE WHEN nome_adq  IS NULL THEN 1 ELSE 0 END) AS apenas_techvendas,
       SUM(CASE WHEN nome_tech IS NULL THEN 1 ELSE 0 END) AS apenas_adquirida,
       SUM(CASE WHEN nome_tech IS NOT NULL
                 AND nome_adq  IS NOT NULL THEN 1 ELSE 0 END) AS presentes_em_ambas,
       COUNT(*) AS total_base_unificada
FROM base_unificada;


-- ============================================================
-- EXERCÍCIO 14 – DASHBOARD EXECUTIVO
-- ============================================================
-- Vendedor / Qtd de clientes / Qtd de vendas / Ticket médio /
-- Melhor cliente / Melhor categoria / Melhor produto
--
-- Lógica de cada bloco "melhor X": agrupa os totais, descobre o
-- MAX daquele vendedor e volta na tabela agrupada procurando a
-- linha que bate com esse máximo. O MIN(nome) garante uma linha
-- por vendedor em caso de empate.
--
-- Dentro das CTEs o JOIN é INNER (só interessa o que foi vendido);
-- o LEFT JOIN fica na consulta principal, onde os vendedores sem
-- venda precisam aparecer.
-- ============================================================

WITH resumo_vendedor AS (
    SELECT v.id_vendedor,
           COUNT(DISTINCT v.id_cliente) AS quantidade_clientes,
           COUNT(DISTINCT v.id_venda)   AS quantidade_vendas,
           AVG(v.valor_total)           AS ticket_medio
    FROM vendas v
    GROUP BY v.id_vendedor
),

-- ---------- melhor cliente ----------
total_por_cliente AS (
    SELECT v.id_vendedor,
           c.nome_cliente,
           SUM(v.valor_total) AS total_cliente
    FROM vendas v
    INNER JOIN clientes c
        ON c.id_cliente = v.id_cliente
    GROUP BY v.id_vendedor, c.nome_cliente
),
maior_valor_cliente AS (
    SELECT id_vendedor,
           MAX(total_cliente) AS maior_total
    FROM total_por_cliente
    GROUP BY id_vendedor
),
melhor_cliente AS (
    SELECT tc.id_vendedor,
           MIN(tc.nome_cliente) AS nome_cliente,
           mv.maior_total       AS valor_melhor_cliente
    FROM total_por_cliente tc
    INNER JOIN maior_valor_cliente mv
        ON mv.id_vendedor = tc.id_vendedor
       AND mv.maior_total = tc.total_cliente
    GROUP BY tc.id_vendedor, mv.maior_total
),

-- ---------- melhor categoria ----------
total_por_categoria AS (
    SELECT v.id_vendedor,
           p.categoria,
           SUM(iv.valor_unitario * iv.quantidade) AS total_categoria
    FROM vendas v
    INNER JOIN itens_venda iv
        ON iv.id_venda = v.id_venda
    INNER JOIN produtos p
        ON p.id_produto = iv.id_produto
    GROUP BY v.id_vendedor, p.categoria
),
maior_valor_categoria AS (
    SELECT id_vendedor,
           MAX(total_categoria) AS maior_total
    FROM total_por_categoria
    GROUP BY id_vendedor
),
melhor_categoria AS (
    SELECT tc.id_vendedor,
           MIN(tc.categoria) AS categoria
    FROM total_por_categoria tc
    INNER JOIN maior_valor_categoria mv
        ON mv.id_vendedor = tc.id_vendedor
       AND mv.maior_total = tc.total_categoria
    GROUP BY tc.id_vendedor
),

-- ---------- melhor produto ----------
total_por_produto AS (
    SELECT v.id_vendedor,
           p.nome_produto,
           SUM(iv.valor_unitario * iv.quantidade) AS total_produto
    FROM vendas v
    INNER JOIN itens_venda iv
        ON iv.id_venda = v.id_venda
    INNER JOIN produtos p
        ON p.id_produto = iv.id_produto
    GROUP BY v.id_vendedor, p.nome_produto
),
maior_valor_produto AS (
    SELECT id_vendedor,
           MAX(total_produto) AS maior_total
    FROM total_por_produto
    GROUP BY id_vendedor
),
melhor_produto AS (
    SELECT tp.id_vendedor,
           MIN(tp.nome_produto) AS nome_produto
    FROM total_por_produto tp
    INNER JOIN maior_valor_produto mv
        ON mv.id_vendedor = tp.id_vendedor
       AND mv.maior_total = tp.total_produto
    GROUP BY tp.id_vendedor
)

SELECT vd.nome_vendedor,
       vd.setor,
       COALESCE(rv.quantidade_clientes, 0)     AS quantidade_clientes,
       COALESCE(rv.quantidade_vendas, 0)       AS quantidade_vendas,
       COALESCE(rv.ticket_medio, 0)            AS ticket_medio,
       COALESCE(mc.nome_cliente, 'SEM VENDAS') AS melhor_cliente,
       COALESCE(mt.categoria, 'SEM VENDAS')    AS melhor_categoria,
       COALESCE(mp.nome_produto, 'SEM VENDAS') AS melhor_produto
FROM vendedores vd
LEFT JOIN resumo_vendedor rv
    ON rv.id_vendedor = vd.id_vendedor
LEFT JOIN melhor_cliente mc
    ON mc.id_vendedor = vd.id_vendedor
LEFT JOIN melhor_categoria mt
    ON mt.id_vendedor = vd.id_vendedor
LEFT JOIN melhor_produto mp
    ON mp.id_vendedor = vd.id_vendedor
ORDER BY quantidade_vendas DESC, vd.nome_vendedor;


-- ============================================================
-- EXERCÍCIO 15 – PAINEL DE AUDITORIA GERAL
-- ============================================================
-- Requisitos atendidos:
--   5 CTEs, funções de agregação, COALESCE, CASE, HAVING,
--   LEFT JOIN, RIGHT JOIN e simulação do FULL OUTER JOIN.
--
-- Depende das tabelas criadas no bloco auxiliar dos exercícios 12/13.
-- ============================================================

WITH clientes_ativos AS (
    SELECT c.id_cliente
    FROM clientes c
    LEFT JOIN vendas v
        ON v.id_cliente = c.id_cliente
    GROUP BY c.id_cliente
    HAVING COUNT(v.id_venda) > 0
),
produtos_vendidos AS (
    SELECT p.id_produto
    FROM itens_venda iv
    RIGHT JOIN produtos p
        ON p.id_produto = iv.id_produto
    GROUP BY p.id_produto
    HAVING COUNT(iv.id_item) > 0
),
vendedores_ativos AS (
    SELECT vd.id_vendedor
    FROM vendedores vd
    LEFT JOIN vendas v
        ON v.id_vendedor = vd.id_vendedor
    GROUP BY vd.id_vendedor
    HAVING COUNT(v.id_venda) > 0
),
base_unificada AS (
    SELECT ct.nome_cliente AS nome_tech,
           ea.nome_cliente AS nome_adq
    FROM clientes_techvendas ct
    LEFT JOIN clientes_empresa_adquirida ea
        ON ea.nome_cliente = ct.nome_cliente
    UNION
    SELECT ct.nome_cliente,
           ea.nome_cliente
    FROM clientes_techvendas ct
    RIGHT JOIN clientes_empresa_adquirida ea
        ON ea.nome_cliente = ct.nome_cliente
),
totais AS (
    SELECT (SELECT COUNT(*) FROM clientes)          AS clientes_cadastrados,
           (SELECT COUNT(*) FROM clientes_ativos)   AS clientes_ativos,
           (SELECT COUNT(*) FROM produtos)          AS produtos_cadastrados,
           (SELECT COUNT(*) FROM produtos_vendidos) AS produtos_vendidos,
           (SELECT COUNT(*) FROM vendedores)        AS vendedores_cadastrados,
           (SELECT COUNT(*) FROM vendedores_ativos) AS vendedores_ativos,
           (SELECT COUNT(*) FROM base_unificada)    AS clientes_base_unificada
)
SELECT 'Clientes cadastrados' AS indicador,
       COALESCE(clientes_cadastrados, 0) AS valor,
       'INFORMATIVO' AS situacao
FROM totais
UNION ALL
SELECT 'Clientes ativos',
       COALESCE(clientes_ativos, 0),
       CASE WHEN clientes_ativos > 0 THEN 'OK' ELSE 'CRÍTICO' END
FROM totais
UNION ALL
SELECT 'Clientes sem compras',
       COALESCE(clientes_cadastrados - clientes_ativos, 0),
       CASE WHEN clientes_cadastrados - clientes_ativos > 0 THEN 'ATENÇÃO' ELSE 'OK' END
FROM totais
UNION ALL
SELECT 'Produtos cadastrados',
       COALESCE(produtos_cadastrados, 0),
       'INFORMATIVO'
FROM totais
UNION ALL
SELECT 'Produtos vendidos',
       COALESCE(produtos_vendidos, 0),
       CASE WHEN produtos_vendidos > 0 THEN 'OK' ELSE 'CRÍTICO' END
FROM totais
UNION ALL
SELECT 'Produtos sem vendas',
       COALESCE(produtos_cadastrados - produtos_vendidos, 0),
       CASE WHEN produtos_cadastrados - produtos_vendidos > 0 THEN 'ATENÇÃO' ELSE 'OK' END
FROM totais
UNION ALL
SELECT 'Vendedores cadastrados',
       COALESCE(vendedores_cadastrados, 0),
       'INFORMATIVO'
FROM totais
UNION ALL
SELECT 'Vendedores ativos',
       COALESCE(vendedores_ativos, 0),
       CASE WHEN vendedores_ativos > 0 THEN 'OK' ELSE 'CRÍTICO' END
FROM totais
UNION ALL
SELECT 'Vendedores sem vendas',
       COALESCE(vendedores_cadastrados - vendedores_ativos, 0),
       CASE WHEN vendedores_cadastrados - vendedores_ativos > 0 THEN 'ATENÇÃO' ELSE 'OK' END
FROM totais
UNION ALL
SELECT 'Clientes na base unificada (FULL OUTER simulado)',
       COALESCE(clientes_base_unificada, 0),
       'INFORMATIVO'
FROM totais;

-- ============================================================
-- FIM DO SCRIPT
-- ============================================================