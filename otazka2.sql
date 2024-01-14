-- kolik litrů mléka je možné koupit s nejvyšší mzdou v roce 2006 -- 
SELECT	tmtpspf.value AS 'Milk_price_2006',
		tmtpspf.unit_value AS 'currency/unit',
		MAX(tmtpspf2.value) AS 'Highest_salary_2006',
		tmtpspf2.unit_value AS 'currency/unit',
		MAX(tmtpspf2.value)/tmtpspf.value AS 'How_many_liters_can_be_bought'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
JOIN t_matej_tvrznik_project_SQL_primary_final tmtpspf2 ON tmtpspf.`year` = tmtpspf2.`year` 
WHERE tmtpspf.name LIKE '%Mleko%' 
	  AND tmtpspf.YEAR = 2006;
		 
-- kolik litrů mléka je možné koupit s nejvyšší mzdou v roce 2018 -- 
SELECT	tmtpspf.value AS 'Milk_price_2018',
		tmtpspf.unit_value AS 'currency/unit',
		MAX(tmtpspf2.value) AS 'Highest_salary_2018',
		tmtpspf2.unit_value AS 'currency/unit',
		MAX(tmtpspf2.value)/tmtpspf.value AS 'How_many_liters_can_be_bought'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
JOIN t_matej_tvrznik_project_SQL_primary_final tmtpspf2 ON tmtpspf.`year` = tmtpspf2.`year` 
WHERE tmtpspf.name LIKE '%Mleko%' 
	  AND tmtpspf.YEAR = 2018;
		 
		
-- kolik kg chleba je možné koupit s nejvyšší mzdou v roce 2006 -- 
SELECT	tmtpspf.value AS 'Bread_price_2006',
		tmtpspf.unit_value AS 'currency/unit',
		MAX(tmtpspf2.value) AS 'Highest_salary_2006',
		tmtpspf2.unit_value AS 'currency/unit',
		MAX(tmtpspf2.value)/tmtpspf.value AS 'How_many_kgs_can_be_bought'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
JOIN t_matej_tvrznik_project_SQL_primary_final tmtpspf2 ON tmtpspf.`year` = tmtpspf2.`year` 
WHERE tmtpspf.name LIKE '%Chleb%' 
	  AND tmtpspf.YEAR = 2006;

-- kolik kg chleba je možné koupit s nejvyšší mzdou v roce 2018 -- 
SELECT	tmtpspf.value AS 'Bread_price_2018',
		tmtpspf.unit_value AS 'currency/unit',
		MAX(tmtpspf2.value) AS 'Highest_salary_2018',
		tmtpspf2.unit_value AS 'currency/unit',
		MAX(tmtpspf2.value)/tmtpspf.value AS 'How_many_kgs_can_be_bought'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
JOIN t_matej_tvrznik_project_SQL_primary_final tmtpspf2 ON tmtpspf.`year` = tmtpspf2.`year` 
WHERE tmtpspf.name LIKE '%Chleb%' 
	  AND tmtpspf.YEAR = 2018;
		

	 

-- Jednotlivé položky a jejich cena/mzdy a jejich výška pro kontrolu --
-- 			MZDA 			--	
-- první srovnané období (2006) max mzda --
SELECT MAX(value) AS 'Highest_salary_2006'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE YEAR=2006 AND unit_value = 'Kč/month';

-- druhé srovnané období (2018) max mzda -- 
SELECT MAX(value) AS 'Highest_salary_2018'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE YEAR=2018 AND unit_value = 'Kč/month';


--			MLÉKO			--
-- cena za litr mléka v roce 2006 --
SELECT value AS 'Highest_milk_price_2006', unit_value AS 'currency/unit'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Mléko%' AND YEAR = 2006;

-- cena za litr mléka v roce 2018 --
SELECT value AS 'Highest_milk_price_2018', unit_value AS 'currency/unit'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Mléko%' AND YEAR = 2018;

--			CHLEBA			--
-- cena za kg chleba v roce 2006 --
SELECT value AS 'Highest_bread_price_2006', unit_value AS 'currency/unit'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Chleb%' AND YEAR = 2006;

-- cena za kg chleba v roce 2018 --
SELECT value AS 'Highest_bread_price_2018', unit_value AS 'currency/unit'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE name LIKE '%Chleb%' AND YEAR = 2018;