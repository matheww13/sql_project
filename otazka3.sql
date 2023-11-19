
-- procentuální nárůst/pokles ceny mezi roky u jednotlivých kategorií jídla -- 
SELECT name, value, unit_value, YEAR, 
		lag(value, 1) OVER(ORDER BY name,YEAR) AS 'predesly rok', 
		CASE
			WHEN YEAR=2006 THEN NULL
			ELSE ((value - (lag(value, 1) OVER(ORDER BY name,YEAR)))/(lag(value, 1) OVER(ORDER BY name,YEAR)))*100
		END AS 'narust cen v %'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE CHAR_LENGTH(category_code) > 1 
ORDER BY name, YEAR
;
