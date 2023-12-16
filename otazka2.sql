-- kolik litrů mléka je možné koupit s nejvyšší mzdou v roce 2006 -- 
SELECT	tmtpspf.value AS 'Cena mléka v roce 2006',
		tmtpspf.unit_value AS 'měna/jednotky',
		MAX(tmtpspf2.value) AS 'Nejvyšší mzda za rok 2006',
		tmtpspf2.unit_value AS 'měna/jednotky',
		MAX(tmtpspf2.value)/tmtpspf.value AS 'Kolik litrů je možné koupit'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
JOIN t_matej_tvrznik_project_SQL_primary_final tmtpspf2 ON tmtpspf.`year` = tmtpspf2.`year` 
WHERE tmtpspf.name LIKE '%Mleko%' 
	  AND tmtpspf.YEAR = 2006;
		 
-- kolik litrů mléka je možné koupit s nejvyšší mzdou v roce 2018 -- 
SELECT	tmtpspf.value AS 'Cena mléka v roce 2018',
		tmtpspf.unit_value AS 'měna/jednotky',
		MAX(tmtpspf2.value) AS 'Nejvyšší mzda za rok 2018',
		tmtpspf2.unit_value AS 'měna/jednotky',
		MAX(tmtpspf2.value)/tmtpspf.value AS 'Kolik litrů je možné koupit'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
JOIN t_matej_tvrznik_project_SQL_primary_final tmtpspf2 ON tmtpspf.`year` = tmtpspf2.`year` 
WHERE tmtpspf.name LIKE '%Mleko%' 
	  AND tmtpspf.YEAR = 2018;
		 
		
-- kolik kg chleba je možné koupit s nejvyšší mzdou v roce 2006 -- 
SELECT	tmtpspf.value AS 'Cena chleba v roce 2006',
		tmtpspf.unit_value AS 'měna/jednotky',
		MAX(tmtpspf2.value) AS 'Nejvyšší mzda za rok 2006',
		tmtpspf2.unit_value AS 'měna/jednotky',
		MAX(tmtpspf2.value)/tmtpspf.value AS 'Kolik kg je možné koupit'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
JOIN t_matej_tvrznik_project_SQL_primary_final tmtpspf2 ON tmtpspf.`year` = tmtpspf2.`year` 
WHERE tmtpspf.name LIKE '%Chleb%' 
	  AND tmtpspf.YEAR = 2006;

-- kolik kg chleba je možné koupit s nejvyšší mzdou v roce 2018 -- 
SELECT	tmtpspf.value AS 'Cena chleba v roce 2018',
		tmtpspf.unit_value AS 'měna/jednotky',
		MAX(tmtpspf2.value) AS 'Nejvyšší mzda za rok 2018',
		tmtpspf2.unit_value AS 'měna/jednotky',
		MAX(tmtpspf2.value)/tmtpspf.value AS 'Kolik kg je možné koupit'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
JOIN t_matej_tvrznik_project_SQL_primary_final tmtpspf2 ON tmtpspf.`year` = tmtpspf2.`year` 
WHERE tmtpspf.name LIKE '%Chleb%' 
	  AND tmtpspf.YEAR = 2018;
		

	 

-- Jednotlivé položky a jejich cena/mzdy a jejich výška pro kontrolu --
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
SELECT value AS 'Nejvyšší cena mléka v roce 2006', unit_value AS 'měna/jednotky'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Mléko%' AND YEAR = 2006;

-- cena za litr mléka v roce 2018 --
SELECT value AS 'Nejvyšší cena mléka v roce 2018', unit_value AS 'měna/jednotky'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Mléko%' AND YEAR = 2018;

--			CHLEBA			--
-- cena za kg chleba v roce 2006 --
SELECT value AS 'Nejvyšší cena cleba v roce 2006', unit_value AS 'měna/jednotky'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Chleb%' AND YEAR = 2006;

-- cena za kg chleba v roce 2018 --
SELECT value AS 'Nejvyšší cena cleba v roce 2018', unit_value AS 'měna/jednotky'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Chleb%' AND YEAR = 2018;