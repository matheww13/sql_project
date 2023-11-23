-- sum procentuálního nárůstu/poklesu ceny a získání odpovědi na otázku 3 --
SELECT
	name,
	value,
	unit_value,
	avg(narust_cen_percent) AS avg_narust_cen_percent
FROM 
	(SELECT 
		name,
		value, 
		unit_value, 
		YEAR,  
		CASE
			WHEN YEAR = 2006 THEN NULL
			ELSE ((value - (lag(value, 1) OVER(ORDER BY name,YEAR))) / (lag(value, 1) OVER(ORDER BY name,YEAR))) * 100
		END AS narust_cen_percent
	FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
	WHERE CHAR_LENGTH(category_code) > 1 
	ORDER BY name, YEAR) AS sub
GROUP BY name
ORDER BY avg_narust_cen_percent 
LIMIT 1;


-- procentuální nárůst/pokles ceny mezi roky u jednotlivých kategorií jídla -- 
SELECT name, value, unit_value, YEAR, 
		lag(value, 1) OVER(ORDER BY name,YEAR) AS 'predesly_rok', 
		CASE
			WHEN YEAR=2006 THEN NULL
			ELSE ((value - (lag(value, 1) OVER(ORDER BY name,YEAR)))/(lag(value, 1) OVER(ORDER BY name,YEAR)))*100
		END AS 'narust_cen_v_%'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE CHAR_LENGTH(category_code) > 1 
ORDER BY name, YEAR
;


