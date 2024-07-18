-- FUNÇÕES DE DATA E TEMPO 

-- DATE_ADD(data, INTERVAL) 
 -- Adiciona um intervalo à data. A data pode ser uma data seguida de um horário.
 -- O intervalo a ser subtraído pode ser em dias, dias e horas e minutos, dias e segundos, minutios e segundos.
 
SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY);

SELECT DATE_ADD(CURRENT_DATE, INTERVAL 10 DAY);

SELECT CURRENT_DATE AS hoje,
	DATE_ADD(CURRENT_DATE, INTERVAL 10 DAY) AS no_futuro;
	
SELECT CURRENT_DATE AS hoje,
	DATE_ADD(CURRENT_DATE, INTERVAL 10 WEEK) AS no_futuro;
	

-- DATE_SUB(data, INTERVAL)
 --Subtrai um intervalo à data. A data pode ser seguida de um horário.
 -- O intrvalo a ser subtraído pode ser em dias, dias e horas e minutos, dias e segundos, minutos e segundos.

SELECT DATE_SUB(CURRENT_DATE, INTERVAL 90 DAY); 
SELECT DATE_SUB('2009-09-22', INTERVAL 2 MONTH);
SELECT DATE_SUB('2009-09-22', INTERVAL 2 YEAR);

-- LAST_DAY(d)

SELECT LAST_DAY('2009-09-22');

SELECT DAY(LAST_DAY('2009-09-22')) AS ultimo_dia_do_mes;  

-- FUNÇÕES PARA TRABALHAR COM HORAS - TEMPO HH:MM:SS

--CURTIME() CURRENT_TIME() CURRENT_TIME, CURRENT_TIMESTAMP 

-- FUNÇÕES DE EXTRAÇÃO
 -- HOUR(), MINUTE() E SECOND()
 
SELECT HOUR(CURRENT_TIME) AS hora_agora;

SELECT MINUTE(CURRENT_TIME) AS minuto_agora;

SELECT SECOND(CURRENT_TIME) AS segundo_agora;

-- TIME_FORMAT()
 -- %h Hora (01..12)
 -- %H Hora(00..23)
 -- %i Minutos, numérico(00..59)
 -- %s Segundos(00..59)
 -- %r Tempo, 12 horas(hh:mm:ss seguido por AM ou PM)
 -- %T Horário, 24 horas(hh:mm:ss)
 
SELECT TIME_FORMAT(CURRENT_TIME, '%r') AS hora_agora;
 
-- TIME()
SELECT TIME(CURRENT_TIMESTAMP);

-- SEC_TO_TIME()
SELECT	SEC_TO_TIME(1000);

SELECT MINUTE(SEC_TO_TIME()1000);
-- Converte um valor inteiro para hora 

-- TIME_TO_SEC()
 -- Converte um valor de hora para inteiro, em segundos
SELECT TIME_TO_SEC('00:16:40');

SELECT TIME_TO_SEC(CURRENT_TIME);

-- TIMEDIFF()
SELECT TIMEDIFF("2017-06-25 13:10:11", "2017-06-15 13:10:10");




