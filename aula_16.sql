-- FUNÇÕES PARA TRABALHAR COM STRINGS - FORMAT, REPLACE, LOWER, UPPER

-- LOWER  = todas minusculas
SELECT LOWER("THAIS D'AVILLA");

-- UPPER = todas maiúsculas
SELECT UPPER("thais d'avilla");

-- LENGTH = conta caracteres
SELECT LENGTH("Thais");

-- SUBSTRING - corta uma string com base em posições
SELECT SUBSTRING("Thais D'avilla", 1, 5);
SELECT SUBSTRING("Thais D'avilla", 1, LENGTH("Thais"));

-- RTRIM = remove espaços no final de uma STRINGS
SELECT LENGTH(RTRIM("Thais D'avilla       "));

-- LTRIM = remove espaços a esquerda de uma string
SELECT LENGTH(LTRIM("           Thais D'avilla"));

-- TRIM = remove espaços a direita e a esquerda de uma string
SELECT LENGTH(TRIM("        Thais D'avilla       "));

-- REPLACE = substitui uma ocorrência na string
SELECT REPLACE("Thais D'avilla de Souza", "de", "");

-- FORMAT = adiciona casas decimais numa string US 
SELECT FORMAT("100000", 2);
