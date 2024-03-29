-- odvětví kde došlo k poklesu příjmů -- 
SELECT
	name AS 'Industry',
	value AS 'Wages',
	YEAR AS 'Year',
	Last_year_pay AS 'Last_year_pay',
	up_or_down AS 'Up/down'
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


-- query pro všechny roky a odvětví --

SELECT
	name AS 'Industry',
	value AS 'Wages',
	YEAR AS 'Year',
	LAG (round(avg(value), 0)) OVER ( ORDER BY name, `year` ) AS 'Last_year_pay',
	CASE
		WHEN  year = 2006 THEN NULL
		WHEN round(avg(value), 0) > LAG (round(avg(value), 0)) OVER ( 
  		ORDER BY name, year 
		) THEN TRUE 
		ELSE FALSE
	END AS 'Up/down'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE unit_value = 'Kč/month'
GROUP BY name, `year` 
ORDER BY name;


-- počet odvětví --
SELECT COUNT(DISTINCT name) AS 'Industry_total'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE unit_value  = 'Kč/month';
 

