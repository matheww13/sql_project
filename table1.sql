CREATE TABLE t_matej_tvrznik_project_SQL_primary_final AS (
	SELECT cp.industry_branch_code AS 'category_code', cpib.name AS 'name' , round(AVG(cp.value), 0) AS 'value', CONCAT(cpu.name, '/month') AS 'unit_value', cp.payroll_year AS 'year'
	FROM czechia_payroll cp 
	JOIN czechia_payroll_calculation cpc ON cp.calculation_code = cpc.code
	JOIN czechia_payroll_unit cpu ON cp.unit_code = cpu.code 
	JOIN czechia_payroll_value_type cpvt ON cp.value_type_code = cpvt.code
	JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code 
	WHERE cp.value IS NOT NULL AND cpu.name = 'Kč' AND cp.payroll_year BETWEEN 2006 AND 2018
	GROUP BY cpib.name, cp.payroll_year 
	ORDER BY cp.industry_branch_code, cp.payroll_year
);

SELECT *
FROM t_matej_tvrznik_project_SQL_primary_final tmtpspf 

EXPLAIN t_matej_tvrznik_project_SQL_primary_final 

ALTER TABLE t_matej_tvrznik_project_SQL_primary_final 
MODIFY COLUMN category_code VARCHAR(255);

