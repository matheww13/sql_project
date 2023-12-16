
-- zobrazení hdp a hdp předešlého roku plus procentualní rozdíl mezi nimi pro čr --
SELECT `year` AS 'Rok',
		gdp AS 'HDP',
		(lag(gdp, 1) OVER(ORDER BY YEAR)) AS 'predesly_rok',
		round(((gdp - (lag(gdp, 1) OVER(ORDER BY YEAR))) / abs((lag(gdp, 1) OVER(ORDER BY YEAR)))) * 100, 2) AS 'procentualni_rozdil'
FROM t_matej_tvrznik_project_SQL_secondary_final tmtpssf 
WHERE country = 'Czech Republic'
ORDER BY `year` ;


-- získání dat k odpovědi na otázku 5--

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
    t1.YEAR AS 'Rok',
    t1.avg_narust_cen_percent AS 'avg_narust_cen_procenta',
    t2.avg_narust_mezd_percent AS 'avg_narust_mezd _procenta',
    c1.hdp_rust
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
        ROUND(((gdp - LAG(gdp, 1) OVER (ORDER BY YEAR)) / ABS(LAG(gdp, 1) OVER (ORDER BY YEAR))) * 100, 2) AS 'hdp_rust'
    FROM
        t_matej_tvrznik_project_SQL_secondary_final tmtpssf 
    WHERE
        country = 'Czech Republic'
    ORDER BY
        `year`) AS c1
ON t1.YEAR = c1.YEAR;
