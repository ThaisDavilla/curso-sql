-- FUNÇÕES DE AGREGAÇÃO: MIN, MAX. CLAUSULA HAVING E Sub query

-- Qual é o preço médio dos produtos em geral?

SELECT AVG(p.preco) AS preco_medio
FROM produto p;

-- Qual é o preço médio por categoria?

SELECT c.descricao AS nome_categoria,
		AVG(p.preco) AS preco_medio
FROM produto p 
JOIN categoria c ON (c.id = p.id_categoria)
GROUP BY p.id_categoria;

-- Quais categorias tem o preço maior que 100 reais?
--Having = "desde que".

SELECT c.descricao AS nome_categoria,
		AVG(p.preco) AS preco_medio
FROM produto p 
JOIN categoria c ON (c.id = p.id_categora)
GROUP BY p.id_categoria Having AVG(p.preco) > 100;

-- Qual (is) categorias tem produtos cujo preço é maior que a média dos demais preços?

SELECT c.descricao AS nome_categoria,
		AVG(p.preco) AS preco_medio
FROM produto p 
JOIN categoria c ON (c.id = p.id_categora)
GROUP BY p.id_categoria Having AVG(p.preco) > (SELECT AVG(preco) FROM produto);

-- Preço do produto mais caro de cada categoria.

SELECT c.descricao AS nome_categoria,
		MAX (p.preco) AS preco_mais_caro
FROM produto p 
JOIN categoria c ON (c.id_categoria)
GROUP BY p.id_categoria;

-- Qual é o produto mais caro de cada marca?

SELECT m.descricao AS nome_marca,
		MAX(p.preco) AS preco_mais_caro
FROM produto p 
JOIN marca m ON (m.id_marca)
GROUP BY p.id_marca;

-- Qual é o produto mais caro de todos?

SELECT *
FROM produtos p 
WHERE p.preco = (SELECT MAX(preco) FROM produto);

-- ou 

SELECT p.descricao AS nome_produto,
		p.preco AS preco,
		m.descricao AS nome_marca,
		c.descricao AS nome_categoria
FROM produto p 
JOIN marca m ON (m.id = p.id_marca)
JOIN categoria c ON (c.id = p.id_categoria)
WHERE p.preco = (SELECT MAX(preco) FROM produto);

-- Qual é o produto mais barato de todos?

SELECT p.descricao AS nome_produto,
		p.preco AS preco,
		m.descricao AS nome_marca,
		c.descricao AS nome_categoria
FROM produto p 
JOIN marca m ON (m.id = p.id_marca)
JOIN categoria c ON (c.id = p.id_categoria)
WHERE p.preco = (SELECT MIN(preco) FROM produto);

-- Quais produtos custam acima da média dos demais?

SELECT p.descricao AS nome_produto,
		MAX(p.preco) AS preco_mais_caro
FROM produto p 
GROUP BY p.id Having MAX(p.preco) > (SELECT AVG(preco) FROM produto);




		





