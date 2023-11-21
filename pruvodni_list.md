# sql_project
SQL Project for engeto data academy 

**Úvod do projektu**

Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

**Výzkumné otázky**

1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

**Odpovědi**

1. V průběhu let mzdy v některých odvětvích i klesají (mezi roky 2006 a 2018 mzdy poklesly v patnácti odvětví z celkových devatenácti sledovaných). Při celkovém porovnání mezd mezi rokem 2006 a 2018 příjmy ale vždy vzrostly.
2. První a poslední společné sledované období cen a mezd je rok 2006 a 2018. S nejvyšší mzdou v roce 2006 jsme schopni koupit 2835 litrů mléka nebo 2480,6 kilo chleba. V roce 2018 jsme s nejvyšší mzdou schopni koupit 2805 litrů mléka nebo 2337.5 kilo chleba.
3. Potravina s nejnižším meziročním procentuálním nárůstem je Cukr krystalový.
4. Existuje. Potraviny výrazně zdražili oproti mzdám v roce 2007 (meziroční nárůst je o 52,41 % vyšší u potravin než u mzdy), 2008 (o 13,86 %), 2011 (o 122,51 %), 2012 (o 189,77 %) a nejvíce v roce 2013 kdy potraviny zdražili o 5,95% ale mzdy se o 0,78% snížili což činí rozdíl 866,62 %.  

** Pozn. **
Z dat bylo nutné smazat potraviny, které neměly úplná data pro všechny zkoumané roky. Jednalo se o Jakostní víno bílé, které mělo jako jediné dostupná data pouze mezi roky 2015 a 2018.
Další chybějící data bylo nutné odstranit při vytváření druhé tabulky pro evropské státy, kdy některé státy neměly žádné hodnoty u hledaného HDP a gini. Další odstranění dat proběhlo poté kdy některé evropské státy neměly data ze všech porovnávaných let. 
