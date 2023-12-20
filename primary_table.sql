-- Kontakt na discord: the_law13 --

CREATE TABLE t_matej_tvrznik_project_SQL_primary_final AS (
	SELECT	cp.industry_branch_code AS 'category_code', 
			cpib.name AS 'name',
			round(AVG(cp.value), 0) AS 'value',
			CONCAT(cpu.name, '/month') AS 'unit_value',
			cp.payroll_year AS 'year'
	FROM czechia_payroll cp 
	JOIN czechia_payroll_calculation cpc ON cp.calculation_code = cpc.code
	JOIN czechia_payroll_unit cpu ON cp.unit_code = cpu.code 
	JOIN czechia_payroll_value_type cpvt ON cp.value_type_code = cpvt.code
	JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code 
	WHERE cp.value IS NOT NULL AND cpu.name = 'Kč' AND cp.payroll_year BETWEEN 2006 AND 2018
	GROUP BY cpib.name, cp.payroll_year 
	ORDER BY cp.industry_branch_code, cp.payroll_year
);

EXPLAIN t_matej_tvrznik_project_SQL_primary_final 

ALTER TABLE t_matej_tvrznik_project_SQL_primary_final 
MODIFY COLUMN category_code VARCHAR(255);

INSERT INTO t_matej_tvrznik_project_SQL_primary_final (category_code, name, value, unit_value, year)
	SELECT	cp.category_code,
			cpc.name,
			round(AVG(cp.value), 2),
			CONCAT('Kč/', cpc.price_value, ' ', cpc.price_unit),
			YEAR(date_from)
	FROM czechia_price cp 
	JOIN czechia_price_category cpc ON cp.category_code = cpc.code 
	GROUP BY cpc.name, year(cp.date_from)
;

SELECT *
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf ;


-- kontrola že jsou všechna data obsahují všechny roky mezi 2006 a 2018 --
SELECT
    name,
    count(name),
    year
FROM
    t_matej_tvrznik_project_SQL_primary_final tmtpspf 
WHERE YEAR BETWEEN 2006 AND 2018
GROUP BY name
HAVING count(name) != 13 
;
   
-- -> data pro Jakostní víno bílé jsou neúplná, z tabulky smažeme --

DELETE FROM t_matej_tvrznik_project_SQL_primary_final 
WHERE name = 'Jakostní víno bílé';

   


