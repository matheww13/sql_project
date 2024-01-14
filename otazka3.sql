-- sum procentuálního nárůstu/poklesu ceny a získání odpovědi na otázku 3 --
SELECT
	name AS 'Name',
	value AS 'Value',
	unit_value AS '',
	avg(price_increase_percent) AS avg_price_increase_percent
FROM 
	(SELECT 
		name,
		value, 
		unit_value, 
		YEAR,  
		CASE
			WHEN YEAR = 2006 THEN NULL
			ELSE ((value - (lag(value, 1) OVER(ORDER BY name,YEAR))) / (lag(value, 1) OVER(ORDER BY name,YEAR))) * 100
		END AS price_increase_percent
	FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
	WHERE CHAR_LENGTH(category_code) > 1 
	ORDER BY name, YEAR) AS sub
GROUP BY name
ORDER BY avg_price_increase_percent
LIMIT 1;


-- procentuální nárůst/pokles ceny mezi roky u jednotlivých kategorií jídla -- 
SELECT name AS 'Name',
		value AS 'Value',
		unit_value AS 'currency/unit',
		YEAR AS 'Year', 
		lag(value, 1) OVER(ORDER BY name,YEAR) AS 'Last_year', 
		CASE
			WHEN YEAR=2006 THEN NULL
			ELSE ((value - (lag(value, 1) OVER(ORDER BY name,YEAR)))/(lag(value, 1) OVER(ORDER BY name,YEAR)))*100
		END AS 'price_increase_percent'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE CHAR_LENGTH(category_code) > 1 
ORDER BY name, YEAR
;


