-- Filtros => BETWEEN

SELECT p.id As codigo_produto,
	   p.descricao As nome_produto,
	   m.descricao AS nome_marca,
	   p.preco AS preco,
	   c.descricao AS nome_categoria
	   
FROM produto p 

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN categoria c ON (p.id_categoria = c.id)

WHERE (p.preco BETWEEN 140.00 AND 170.00) AND (m.id = 2)

ORDER BY p.preco DESC;

-- Acrescentando tabelas

CREATE TABLE cliente(
	id int auto_increment,
	nome varchar(255),
	cpf char(11),
	dt_nasc date,
	primary key(id)
);

CREATE TABLE compra(
	id int auto_increment,
	id_clente int,
	dt_compra date,
	primary key(id),
	foreing key(id_cliente) references cliente(id)
);

CREATE TABLE compra_item(
	id_compra int,
	id_produto int,
	quantidade int,
	preco_unitario double (10,2),
	valor_total double (10,2),
	
	primary key(id_compra, id_produto),
	
	foreing key (id_compra) references compra (id),
	foreing key (id_produto) references produto (id)
);

show tables;

-- INSERT DOS DADOS DAS COMPRAS

INSERT INTO cliente (nome, cpf, dt_nasc) VALUES
					("João", "36514898755", "1985-02-25"),
					("Maria", "78912345685", "1990-01-02"),
					("José", "14785236925", "1955-04-17");
					
INSERT INTO compra (id_cliente, dt_compra) VALUES
					(1, "2020-05-15"),
					(1, "20-05-22");
					
INSERT INTO compra_item (id_compra, id_produto, quantidade, preco_unitario, valor_total) VALUES
						(1, 1, 2, 89.99, 179.98),
						(1, 9, 2, 24.99, 49,98),
						(2, 7, 10, 328.90, 3289.00);
						
-- GROUP BY 

SELECT c.id AS codigo_cliente,
		c.nome,
		DATE_FORMAT (c.dt_nasc, "%d/%m/%Y") AS data_nascimento,
		DATE_FORMAT (co.dt_compra, "%d/%m/%Y") AS data_primeira_compra
		
FROM cliente c 
LEFT JOIN compra co ON (co.id_cliente = c.id)
GROUP BY c.id;

-- GROUP BY + FUNÇÕES SUM, COUNT e AVG

SELECT c.id AS codigo_cliente,
		c.nome,
		DATE_FORMAT (c.dt_nasc, "%d/%m/%Y") AS data_nascimento,
		DATE_FORMAT (co.dt_compra, "%d/%m/%Y") AS data_compra,
		SUM(ci.valor_total) AS valor_total_compra
		
FROM cliente c 

LEFT JOIN compra co ON (co.id_cliente = c.id)
JOIN compra_item ci ON (ci.id_compra = co.id)

GROUP BY co.id;

-- agrupando pelo cliente

SELECT c.id AS codigo_cliente,
		c.nome,
		DATE_FORMAT (c.dt_nasc, "%d/%m/%Y") AS data_nascimento,
		DATE_FORMAT (co.dt_compra, "%d/%m/%Y") AS data_compra,
		SUM(ci.valor_total) AS valor_total_compra
		
FROM cliente c 

LEFT JOIN compra co ON (co.id_cliente = c.id)
JOIN compra_item ci ON (ci.id_compra = co.id)

GROUP BY c.id;

-- para consultar todos os clientes

SELECT c.id AS codigo_cliente,
		c.nome,
		DATE_FORMAT (c.dt_nasc, "%d/%m/%Y") AS data_nascimento,
		DATE_FORMAT (co.dt_compra, "%d/%m/%Y") AS data_compra,
		SUM(ci.valor_total) AS valor_total_compra
		
FROM cliente c 

LEFT JOIN compra co ON (co.id_cliente = c.id)
LEFT JOIN compra_item ci ON (ci.id_compra = co.id)

GROUP BY c.id;

-- itens por compra do cliente

SELECT c.id AS codigo_cliente,
		c.nome,
		DATE_FORMAT (c.dt_nasc, "%d/%m/%Y") AS data_nascimento,
		DATE_FORMAT (co.dt_compra, "%d/%m/%Y") AS data_compra,
		SUM(ci.valor_total) AS valor_total_compra,
		COUNT(co.id) AS itens_por_compra
		
FROM cliente c 

LEFT JOIN compra co ON (co.id_cliente = c.id)
LEFT JOIN compra_item ci ON (ci.id_compra = co.id)

GROUP BY c.id, co.id;

--simplificado

SELECT c.nome AS nome_cliente,
		co.id AS codigo_compra,
		co.dt_compra,
		SUM(ci.valor_total) AS valor_total_compra
		SUM(ci.quantidade) AS total_quantidade_itens_compra,
		COUNT(ci.id_produto) AS total_produtos_distintos_compra
		
FROM compra co
JOIN compra_item ci ON (ci.id_)compra = co.id)
JOIN cliente c ON (c.id = co.id_cliente)

GROUP BY co.id;

-- simplificado GROUP BY + AVG

SELECT c.nome AS nome_cliente,
		AVG(ci.valor_total) AS media_valor_comprado_cliente
		
		
		
FROM compra co
JOIN compra_item ci ON (ci.id_)compra = co.id)
JOIN cliente c ON (c.id = co.id_cliente)

FROM compra co
JOIN compra_item ci ON (ci.id_)compra = co.id)
JOIN cliente c ON (c.id = co.id_cliente)

GROUP BY co.id;

-- valor médio por cliente

SELECT c.nome AS nome_cliente,
		AVG(ci.valor_total) AS media_valor_comprado_cliente
		
		
		
FROM compra co
JOIN compra_item ci ON (ci.id_)compra = co.id)
JOIN cliente c ON (c.id = co.id_cliente)

FROM compra co
JOIN compra_item ci ON (ci.id_)compra = co.id)
JOIN cliente c ON (c.id = co.id_cliente)

GROUP BY c.id;