SELECT
	name,
	value,
	YEAR,
	Last_year_pay,
	up_or_down
FROM ( 
	SELECT
	name,
	value,
	YEAR,
	LAG(value) OVER (ORDER BY name, `year`) AS 'Last_year_pay',
					CASE 
					WHEN YEAR = 2006 THEN NULL
					WHEN value > LAG(value) OVER (ORDER BY name, `year`) THEN TRUE 
					ELSE FALSE 
					END AS 'up_or_down' 
					FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
					WHERE unit_value = 'Kč/month'
) AS subquery 
WHERE up_or_down = FALSE 
GROUP BY name
ORDER BY name
;






















