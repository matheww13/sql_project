
-- průměrný meziroční narust cen potravin v % za jednotlivé roky --
SELECT
	YEAR AS 'Year',
	AVG(narust_cen_percent) AS avg_price_increase_percent
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
GROUP BY YEAR
ORDER BY YEAR  ;

-- průměrný meziroční nárůst mezd v % za jednotlivé roky --
SELECT
	YEAR AS 'Year',
	avg(narust_mezd_percent) AS avg_salary_increase_percent
FROM 
	(SELECT 
		name,
		value, 
		unit_value, 
		YEAR,  
		CASE
			WHEN YEAR = 2006 THEN NULL
			ELSE ((value - (lag(value, 1) OVER(ORDER BY name,YEAR))) / (lag(value, 1) OVER(ORDER BY name,YEAR))) * 100
		END AS narust_mezd_percent
	FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 
	WHERE CHAR_LENGTH(category_code) < 2 
	ORDER BY name, YEAR) AS sub
GROUP BY YEAR
ORDER BY YEAR  ;


-- spojení tabulek do jedné s použitím with, kde jsou zobrazeny pouze roky kdy potraviny narostly více než mzdy a o kolik--

WITH cat AS (
    SELECT
        name,
        value,
        unit_value,
        category_code,
        YEAR,
        CASE
            WHEN YEAR = 2006 THEN NULL
            ELSE ((value - LAG(value, 1) OVER (ORDER BY name, YEAR)) / LAG(value, 1) OVER (ORDER BY name, YEAR)) * 100
        END AS narust_percent
    FROM
        t_matej_tvrznik_project_SQL_primary_final tmtpspf
    WHERE
        CHAR_LENGTH(category_code) IN (1, 6, 7)
    ORDER BY
        name, YEAR
)
SELECT
    t1.YEAR AS 'Year',
    t1.avg_narust_cen_percent AS avg_price_increase_percent,
    t2.avg_narust_mezd_percent AS avg_salary_increase_percent,
    round(t1.avg_narust_cen_percent - t2.avg_narust_mezd_percent, 2) AS 'Difference'
FROM
    (SELECT
        YEAR,
        AVG(narust_percent) AS avg_narust_cen_percent
    FROM
        cat
    WHERE CHAR_LENGTH(category_code) = 6 OR CHAR_LENGTH(category_code) = 7 
    GROUP BY
        YEAR
    ORDER BY
        YEAR) AS t1
JOIN
    (SELECT
        YEAR,
        AVG(narust_percent) AS avg_narust_mezd_percent
    FROM
        cat
    WHERE CHAR_LENGTH(category_code) = 1
    GROUP BY
        YEAR
    ORDER BY
        YEAR) AS t2 ON t1.YEAR = t2.YEAR
GROUP BY t1.year
HAVING t1.avg_narust_cen_percent > t2.avg_narust_mezd_percent;
