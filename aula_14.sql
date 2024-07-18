-- FUNÇÕES MAIS COMUNS PARA TRABALHAR COM DATAS NO MYSQL

-- CURDATE() Retorna a data atual no formato aaaa-mm-dd
SELECT CURDATE();

--CURTIME() Retorna a hora atual no formato hh:mm:ss
SELECT CURTIME();

-- NOW()
SELECT NOW();

--             EXTRAÇÃO DE INFORMAÇÕES

-- DATE_FORMAT(D, <formato>) Retorna s data D no formato especificado.

-- YEAR(D) Retorna o ano de uma data D.
SELECT YEAR('2024-07-17');
SELECT YEAR(CURDATE()) AS ano_atual;


-- MONTH(D) Retorna o mês de uma data D.
SELECT MONTH(CURRENT_DATE()) AS mes_atual;

-- DAY(D) Retorna o dia de uma data D.
SELECT DAY(CURRENT_TIMESTAMP) AS dia_atual;

--            OPERAÇÕES COM DATA

-- DATEDIFF
SELECT DATEDIFF(CURRENT_DATE, '2024-01-01') AS 	dias_do_ano;

SELECT DATEDIFF(CURRENT_DATE, '1985-06-26');


-- TIMESTAMPDIFF
SELECT TIMESTAMPDIFF(DAY, '2024-01-01', CURRENT_DATE) AS dias_do_ano;

SELECT TIMESTAMPDIFF(MONTH, '2024-01-01', CURRENT_DATE) AS meses_do_ano;

SELECT TIMESTAMPDIFF(YEAR, '1985-06-26', CURRENT_DATE) AS minha_idade;

-- Compras de maio

SELECT c.id AS codigo_cliente,
        c.nome,
        DATE_FORMAT(co.dt_compra, "%d/%m/%y") AS data_compra,
        SUM(ci.valor_total) AS itens_por_compra

FROM cliente CASCADE

LEFT JOIN compra co ON (co.id_cliente - c.id)
LEFT JOIN compra_item ci ON (ci.id_compra = co.id)

WHERE MONTH (co.dt_compra) = MONTH(CURRENT_DATE)

GROUP BY co.id;



