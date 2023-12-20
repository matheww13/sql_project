-- odvětví kde došlo k poklesu příjmů -- 
SELECT
	name AS 'Odvětví',
	value AS 'Mzda',
	YEAR AS 'Rok',
	Last_year_pay AS 'Lonska_mzda',
	up_or_down AS 'Roste/klesá'
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
	name AS 'Odvětví',
	value AS 'Mzda',
	YEAR AS 'Rok',
	LAG (round(avg(value), 0)) OVER ( ORDER BY name, `year` ) AS 'Lonska_mzda',
	CASE
		WHEN  year = 2006 THEN NULL
		WHEN round(avg(value), 0) > LAG (round(avg(value), 0)) OVER ( 
  		ORDER BY name, year 
		) THEN TRUE 
		ELSE FALSE
	END AS 'Roste/klesa'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE unit_value = 'Kč/month'
GROUP BY name, `year` 
ORDER BY name;


-- počet odvětví --
SELECT COUNT(DISTINCT name) AS 'Součet odvětví'
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE unit_value  = 'Kč/month';
 

