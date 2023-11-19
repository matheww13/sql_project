-- 			MZDA 			--	
-- první srovnané období (2006) max mzda --
SELECT MAX(value) AS 'Nejvyšší mzda za rok 2006'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE YEAR=2006 AND unit_value = 'Kč/month';

-- druhé srovnané období (2018) max mzda -- 
SELECT MAX(value) AS 'Nejvyšší mzda za rok 2018'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE YEAR=2018 AND unit_value = 'Kč/month';


--			MLÉKO			--
-- cena za litr mléka v roce 2006 --
SELECT value AS 'Nejvyšší cena mléka v roce 2006', unit_value 
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Mléko%' AND YEAR = 2006;

-- cena za litr mléka v roce 2018 --
SELECT value AS 'Nejvyšší cena mléka v roce 2018', unit_value 
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Mléko%' AND YEAR = 2018;

--			CHLEBA			--
-- cena za kg chleba v roce 2006 --
SELECT value AS 'Nejvyšší cena cleba v roce 2006', unit_value 
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Chleb%' AND YEAR = 2006;

-- cena za kg chleba v roce 2018 --
SELECT value AS 'Nejvyšší cena cleba v roce 2018', unit_value 
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Chleb%' AND YEAR = 2018;


SELECT *
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 


SELECT *
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE `year` = 2006