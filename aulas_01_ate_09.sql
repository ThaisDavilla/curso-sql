-- DML = Data Manipulation Language (Linguagem de manipulação de Dados)
-- DDL = Data Definition Language

--No command line:
--show databases; --> mostra os bancos de dados
--use nome do banco de dados -> use sakila
--show tables; --> mostra as tabelas
--desc nome da tabela -> desc actor; --> mostra as colunas, linhas e conteúdo da tabela

--cria uma tabela:

create table tabela_teste (
 id int auto_increment,
 nome varchar(225),
 primary key(id)
 ); 
 
show tables;

desc tabela_teste;

-- drop apaga a tabela e seu conteúdo:

drop table tabela_teste;

show databases;

--drop apaga o banco de dados

create database esse_eu_vou_excluir;

drop database esse_eu_vou_excluir;

show database;

-- INSERT INTO nome da tabela --> Insere informações

INSERT INTO categoria (descricao) VALUES ("Tênis");
INSERT INTO categoria (descricao) VALUES ("Sapatilha");
INSERT INTO categoria (descricao) VALUES ("Chinelo");

-- SELECT ... FROM --> mostra informações

SELECT descricao FROM categoria;

SELECT id, descricao FROM categoria;

INSERT INTO marca (descricao) VALUES ("Olympkus"), ("Addidas"), ("Mizuno"), ("Shimano"), ("Grendene");

INSER INTO produto (id_marca, id_categoria, descricao, preco) VALUES
                              (1, 1, "Breed 2", 89.99);

SELECT * FROM produto;

-- Utilização do UPDATE

INSERT INTO produto (id_marca, id_categoria, descricao, preco) VALUES
                               (2 , 1, "Duramo Lite 20", 149.99);
INSERT INTO produto (id_marca, id_categoria, descricao, preco) VALUES
                               (2 , 1, "Run Falcon Fem", 169.99);
INSERT INTO produto (id_marca, id_categoria, descricao, preco) VALUES
                               (1 , 1, "Space Masc", 15.99);
INSERT INTO produto (id_marca, id_categoria, descricao, preco) VALUES
                               (4 , 2, "Speed Shwr61", 328.90);
INSERT INTO produto (id_marca, id_categoria, descricao, preco) VALUES
						(NULL,        2,      "Produto teste", 1000.00);
INSERT INTO produto (id_marca, id_categoria, descricao, preco) VALUES
						(5,        3,      "Monstrinhos", 24.99);							   
							   
-- Atualizar/Corrigir registros => UPDATE

UPDATE produto SET descricao = "Run Falcon Feminino" WHERE id = 4;
UPDATE produto SET descricao = "Space Masculino", id_marca = 3, preco = 159.99 WHERE id=5;

-- Remover registros => DELETE

DELETE FROM produto WHERE id = 6;

--DELETE FROM marca WHERE id = 4; ---> erro por ter chave estrangeira.

-- JOIN

--INNER JOIN - cruza dados em comum das tabelas
--ALIAS (apelido)

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco
FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id);

--LEFT JOIN - aparecem todos os dados das tabelas, inclusive os null

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco

FROM produto p

LEFT JOIN marca m ON (p.id_marca = m.id);

--RIGHT JOIN - aparecem todos os dados das tabelas, inclusive os null

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco

FROM produto p

RIGHT JOIN marca m ON (p.id_marca = m.id);

--Juntando tudo

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id);

--Ordenando uma Query (consulta)

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

ORDER BY p.id DESC;

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

ORDER BY p.preco DESC;

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

ORDER BY p.id ASC;

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

ORDER BY m.descricao;

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

ORDER BY m.descricao ASC, p.preco DESC;
						   
-- Filtros => WHERE

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.descricao = "Breed 2";

--consulta
SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.preco = 149.99;

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.preco > 149.99;

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.preco >= 149.99;

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.preco >= 100.00 AND p.preco < 200.00;

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.preco >= 100.00 AND p.preco < 200.00

ORDER BY p.preco DESC;

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.preco = 89.99 OR p.preco > 300.00;

--Filtros => LIKE

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.descricao LIKE "Duramo%";

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.descricao LIKE "%s%";

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE p.descricao LIKE "%s";

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE m.descricao LIKE "%s%";

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE m.descricao LIKE "%s%" AND p.preco > 300.00;

--consulta

SELECT  p.id AS codigo_produto,
            p.descricao AS nome_produto,
            m.descricao AS nome_marca,
            p.preco AS preco,
            c.descricao AS nome_categoria

FROM produto p

INNER JOIN marca m ON (p.id_marca = m.id)
INNER JOIN caategoria c ON (p.id_categoria = c.id)

WHERE m.descricao LIKE "%s%" AND p.preco < 300.00;








