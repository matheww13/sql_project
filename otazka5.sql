SELECT *
FROM czechia_region cr 

SELECT *
FROM czechia_district cd 

SELECT *
FROM countries c 

-- zobrazení hdp a hdp předešlého roku plus procentualní rozdíl mezi nimi --
SELECT `year` , gdp,
(lag(gdp, 1) OVER(ORDER BY YEAR)) AS 'predesly_rok',
round(((gdp - (lag(gdp, 1) OVER(ORDER BY YEAR))) / abs((lag(gdp, 1) OVER(ORDER BY YEAR)))) * 100, 2) AS 'procentualni_rozdil'
FROM t_matej_tvrznik_project_SQL_secondary_final tmtpssf 
WHERE country = 'Czech Republic'
ORDER BY `year` ;

-- opravit poté co nachystám tabulku 2 --
SELECT
    t1.YEAR AS 'rok',
    t1.avg_narust_cen_percent AS avg_narust_cen_percent,
    t2.avg_narust_mezd_percent AS avg_narust_mezd_percent,
    c1.procentualni_rozdil
    FROM
    (SELECT
        YEAR,
        AVG(narust_cen_percent) AS avg_narust_cen_percent
    FROM
        (SELECT
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
JOIN (SELECT
		YEAR,
		round(((gdp - (lag(gdp, 1) OVER(ORDER BY YEAR))) / abs((lag(gdp, 1) OVER(ORDER BY YEAR)))) * 100, 2) AS 'procentualni_rozdil'
	  FROM t_matej_tvrznik_project_SQL_secondary_final tmtpssf 
	  WHERE country = 'Czech Republic'
	  ORDER BY `year`) AS c1 
ON t1.YEAR = c1.YEAR;
	 
-- optimize--

WITH cte AS (
    SELECT
        name,
        value,
        unit_value,
        YEAR,
        CHAR_LENGTH(category_code) AS category_length,
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
    t1.YEAR,
    t1.avg_narust_cen_percent,
    t2.avg_narust_mezd_percent,
    c1.procentualni_rozdil
FROM
    (SELECT
        YEAR,
        AVG(narust_percent) AS avg_narust_cen_percent
    FROM
        cte
    WHERE
        category_length = 6 OR category_length = 7
    GROUP BY
        YEAR
    ORDER BY
        YEAR) AS t1
JOIN
    (SELECT
        YEAR,
        AVG(narust_percent) AS avg_narust_mezd_percent
    FROM
        cte
    WHERE
        category_length = 1
    GROUP BY
        YEAR
    ORDER BY
        YEAR) AS t2
        ON t1.YEAR = t2.YEAR
JOIN
    (SELECT
        `year`,
        gdp,
        ROUND(((gdp - LAG(gdp, 1) OVER (ORDER BY YEAR)) / ABS(LAG(gdp, 1) OVER (ORDER BY YEAR))) * 100, 2) AS 'procentualni_rozdil'
    FROM
        t_matej_tvrznik_project_SQL_secondary_final tmtpssf 
    WHERE
        country = 'Czech Republic'
    ORDER BY
        `year`) AS c1
ON t1.YEAR = c1.YEAR;
