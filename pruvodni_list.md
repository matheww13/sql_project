﻿# sql_project
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
4. Neexistuje. Nejblíže k tomu má rok 2013, ale i v něm je nárůst potravin pouze o 6.72% vyšší než nárůst mezd.  
5. HDP je spíše retrospektivní ukazatel ekonomiky země. HDP může pouze naznačit silnou ekonomiku a zvyšující se poptávku, která má pak za následek zvýšení cen. Ale HDP jako takové je pouhý ukazatel a nezpůsobí růst mezd ani cen. Z dat nám korelace nevyplývá. 

** Pozn. **
Z dat bylo nutné smazat potraviny, které neměly úplná data pro všechny zkoumané roky. Jednalo se o Jakostní víno bílé, které mělo jako jediné dostupná data pouze mezi roky 2015 a 2018.
Další chybějící data bylo nutné odstranit při vytváření druhé tabulky pro evropské státy, kdy některé státy neměly žádné hodnoty u hledaného HDP a gini. Další odstranění dat proběhlo poté, kdy některé evropské státy neměly data ze všech porovnávaných let. 
Pro lepší vizualizaci meziročních dat pro otázku č. 5 jsem si data zobrazil ve spojnicovém grafu v PowerBI a z tohoto grafu lépe usoudil odpověď na otázku (viz otazka5graf.pdf).
