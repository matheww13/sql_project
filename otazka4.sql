-- vytvorit mezirocni narust cen vsech potravin/mezd a porovnat je v % --
-- průměrný meziroční narust cen potravin v % za jednotlivé roky --
SELECT
	YEAR,
	AVG(narust_cen_percent) AS avg_narust_cen_percent
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
	YEAR,
	avg(narust_mezd_percent) AS avg_narust_mezd_percent
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


-- spojení tabulek do jedné --
SELECT
    t1.YEAR,
    t1.avg_narust_cen_percent AS avg_narust_cen_percent,
    t2.avg_narust_mezd_percent AS avg_narust_mezd_percent,
    round(((t1.avg_narust_cen_percent - t2.avg_narust_mezd_percent) / abs(t2.avg_narust_mezd_percent)) * 100, 2) AS 'Procentuální_rozdíl'
FROM
    (SELECT
        YEAR,
        AVG(narust_cen_percent) AS avg_narust_cen_percent
    FROM
        (SELECT
            name,
            value,
            unit_value,
            YEAR,
            CASE
                WHEN YEAR = 2006 THEN NULL
                ELSE ((value - LAG(value, 1) OVER (ORDER BY name, YEAR)) / LAG(value, 1) OVER (ORDER BY name, YEAR)) * 100
            END AS narust_cen_percent
        FROM
            t_matej_tvrznik_project_SQL_primary_final tmtpspf
        WHERE
            CHAR_LENGTH(category_code) > 1
        ORDER BY
            name, YEAR) AS sub
    GROUP BY
        YEAR
    ORDER BY
        YEAR) AS t1
JOIN
    (SELECT
        YEAR,
        AVG(narust_mezd_percent) AS avg_narust_mezd_percent
    FROM
        (SELECT
            name,
            value,
            unit_value,
            YEAR,
            CASE
                WHEN YEAR = 2006 THEN NULL
                ELSE ((value - LAG(value, 1) OVER (ORDER BY name, YEAR)) / LAG(value, 1) OVER (ORDER BY name, YEAR)) * 100
            END AS narust_mezd_percent
        FROM
            t_matej_tvrznik_project_SQL_primary_final tmtpspf
        WHERE
            CHAR_LENGTH(category_code) < 2
        ORDER BY
            name, YEAR) AS sub
    GROUP BY
        YEAR
    ORDER BY
        YEAR) AS t2
ON t1.YEAR = t2.YEAR
HAVING t1.avg_narust_cen_percent > t2.avg_narust_mezd_percent AND Procentuální_rozdíl > 10;
