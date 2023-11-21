SELECT *
FROM czechia_region cr 

SELECT *
FROM czechia_district cd 

SELECT *
FROM countries c 

SELECT `year` , gdp,
(lag(gdp, 1) OVER(ORDER BY YEAR)),
round(((gdp - (lag(gdp, 1) OVER(ORDER BY YEAR))) / abs((lag(gdp, 1) OVER(ORDER BY YEAR)))) * 100, 2) AS 'Procentuální_rozdíl'
FROM economies e 
WHERE country = 'Czech Republic' AND YEAR BETWEEN 2006 AND 2018
ORDER BY `year` ;

-- opravit poté co nachystám tabulku 2 --
SELECT
    t1.YEAR,
    t1.avg_narust_cen_percent AS avg_narust_cen_percent,
    t2.avg_narust_mezd_percent AS avg_narust_mezd_percent,
    c1.Procentuální_rozdíl
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
JOIN (SELECT `year` , gdp,
(lag(gdp, 1) OVER(ORDER BY YEAR)),
round(((gdp - (lag(gdp, 1) OVER(ORDER BY YEAR))) / abs((lag(gdp, 1) OVER(ORDER BY YEAR)))) * 100, 2) AS 'Procentuální_rozdíl'
FROM economies e 
WHERE country = 'Czech Republic' AND YEAR BETWEEN 2006 AND 2018
ORDER BY `year`) AS c1 ON t1.YEAR = c1.year
