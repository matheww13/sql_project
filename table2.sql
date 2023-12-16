-- test pred vytvořením nové tabulky --
SELECT e.country, e.`year`, e.GDP, e.gini, c.population AS 'populace_2018' 
FROM economies e 
JOIN countries c ON e.country = c.country 
WHERE YEAR BETWEEN 2006 AND 2018
	AND c.continent = 'Europe'
	AND GDP IS NOT NULL
	AND gini IS NOT NULL
ORDER BY e.country , `year`;


-- vytvoření nové tabulky v databázi --
CREATE TABLE t_matej_tvrznik_project_SQL_secondary_final AS (
SELECT e.country, e.`year`, e.GDP, e.gini, c.population AS 'populace_2018' 
FROM economies e 
JOIN countries c ON e.country = c.country 
WHERE YEAR BETWEEN 2006 AND 2018
	AND c.continent = 'Europe'
	AND GDP IS NOT NULL
	AND gini IS NOT NULL
ORDER BY e.country , `year`
);

SELECT *
FROM t_matej_tvrznik_project_SQL_secondary_final tmtpssf ;

-- kontrola že jsou všechna data obsahují všechny roky mezi 2006 a 2018 --
SELECT
    country ,
    count(country)
FROM
    t_matej_tvrznik_project_SQL_secondary_final
GROUP BY country 
HAVING count(country) != 13
;


-- odstranění těch zemí, které nemají dostatečná data pro porovnání mezi všemi roky -- 
DELETE FROM t_matej_tvrznik_project_SQL_secondary_final 
WHERE country = ANY(SELECT
    country
FROM
    t_matej_tvrznik_project_SQL_secondary_final
GROUP BY country 
HAVING count(country) != 13)
 ;

-- kontrola po odstranění --
SELECT country, COUNT(country) 
FROM t_matej_tvrznik_project_SQL_secondary_final tmtpssf 
GROUP BY country ;
