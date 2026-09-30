USE db_2_bim;

-- ============================================================
-- QUESTÃO 1 – VENDAS CONCLUÍDAS
-- ============================================================

-- CTE vendas_concluidas: somente vendas com status_venda = 'Concluída'.
-- Consulta principal exibe código, data, cliente, produto, valor total
-- e vendedor, do maior para o menor valor total.

WITH vendas_concluidas AS (
    SELECT *
    FROM vendas
    WHERE status_venda = 'Concluída'
)
SELECT
    id_venda,
    data_venda,
    nome_cliente,
    nome_produto,
    valor_total,
    vendedor
FROM vendas_concluidas
ORDER BY valor_total DESC;


-- ============================================================
-- QUESTÃO 2 – FATURAMENTO POR CATEGORIA
-- ============================================================

-- CTE resumo_categorias: quantidade de vendas, produtos vendidos,
-- faturamento total e valor médio por categoria.
-- Consulta principal filtra faturamento_total > 10.000,00.

WITH resumo_categorias AS (
    SELECT
        categoria,
        COUNT(*) AS quantidade_vendas,
        SUM(quantidade) AS total_produtos_vendidos,
        SUM(valor_total) AS faturamento_total,
        AVG(valor_total) AS valor_medio_vendas
    FROM vendas
    GROUP BY categoria
)
SELECT
    categoria,
    quantidade_vendas,
    total_produtos_vendidos,
    faturamento_total,
    valor_medio_vendas
FROM resumo_categorias
WHERE faturamento_total > 10000.00
ORDER BY faturamento_total DESC;


-- ============================================================
-- QUESTÃO 3 – DESEMPENHO DOS VENDEDORES
-- ============================================================

-- CTE desempenho_vendedores: vendas, produtos vendidos, valor total
-- e ticket médio por vendedor.
-- Consulta principal traz apenas os 3 vendedores com maior valor total.

WITH desempenho_vendedores AS (
    SELECT
        vendedor,
        COUNT(*) AS quantidade_vendas,
        SUM(quantidade) AS total_produtos_vendidos,
        SUM(valor_total) AS valor_total_vendido,
        AVG(valor_total) AS ticket_medio
    FROM vendas
    GROUP BY vendedor
)
SELECT
    vendedor,
    quantidade_vendas,
    total_produtos_vendidos,
    valor_total_vendido,
    ticket_medio
FROM desempenho_vendedores
ORDER BY valor_total_vendido DESC
LIMIT 3;


-- ============================================================
-- QUESTÃO 4 – ESTADOS COM FATURAMENTO ACIMA DA MÉDIA
-- ============================================================

-- vendas_validas: quantidade > 0 e status_venda <> 'Cancelada'.
-- faturamento_estados: agrega vendas_validas por estado.
-- media_faturamento: média do faturamento_total entre os estados.
-- Consulta principal traz só os estados acima da média geral.

WITH vendas_validas AS (
    SELECT *
    FROM vendas
    WHERE quantidade > 0
      AND status_venda <> 'Cancelada'
),
faturamento_estados AS (
    SELECT
        estado_cliente,
        COUNT(*) AS quantidade_vendas,
        SUM(quantidade) AS total_produtos_vendidos,
        SUM(valor_total) AS faturamento_total
    FROM vendas_validas
    GROUP BY estado_cliente
),
media_faturamento AS (
    SELECT AVG(faturamento_total) AS media_geral
    FROM faturamento_estados
)
SELECT
    fe.estado_cliente,
    fe.quantidade_vendas,
    fe.total_produtos_vendidos,
    fe.faturamento_total,
    mf.media_geral,
    fe.faturamento_total - mf.media_geral AS diferenca_para_media
FROM faturamento_estados fe
CROSS JOIN media_faturamento mf
WHERE fe.faturamento_total > mf.media_geral
ORDER BY fe.faturamento_total DESC;


-- ============================================================
-- DESAFIO ADICIONAL – QUESTÃO 2 COM SUBQUERY
-- ============================================================

-- Mesmo resultado da questão 2, agora com subquery no FROM
-- em vez de CTE.

SELECT
    categoria,
    quantidade_vendas,
    total_produtos_vendidos,
    faturamento_total,
    valor_medio_vendas
FROM (
    SELECT
        categoria,
        COUNT(*) AS quantidade_vendas,
        SUM(quantidade) AS total_produtos_vendidos,
        SUM(valor_total) AS faturamento_total,
        AVG(valor_total) AS valor_medio_vendas
    FROM vendas
    GROUP BY categoria
) AS resumo_categorias
WHERE faturamento_total > 10000.00
ORDER BY faturamento_total DESC;

-- Comparação CTE x subquery:
-- Legibilidade: a CTE é mais legível porque o nome (resumo_categorias)
-- aparece antes da consulta principal, então dá pra ler de cima pra
-- baixo. A subquery obriga a ler de dentro pra fora.
-- Organização: a CTE separa claramente "o que calcula" de "o que filtra".
-- Na subquery os dois ficam misturados dentro do FROM.
-- Aninhamento: a subquery já cria um nível de indentação a mais;
-- com mais de uma etapa (como na questão 4) isso vira uma pirâmide
-- de parênteses. A CTE mantém tudo no mesmo nível, mesmo encadeando várias.
-- Manutenção: reaproveitar ou alterar uma CTE é mais simples, principalmente
-- se ela precisar ser usada mais de uma vez na mesma consulta -- com
-- subquery seria necessário repetir o bloco inteiro.