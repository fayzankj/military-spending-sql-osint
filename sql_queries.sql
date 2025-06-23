-- create database db1
-- Total number of records
SELECT 
    COUNT(*)
FROM
    db1.sipri_data;
-- List all unique countries
SELECT DISTINCT
    (country)
FROM
    db1.sipri_data;
-- How many years of data do we have?
SELECT 
    MIN(year) AS Start_year, MAX(year) AS End_year
FROM
    db1.sipri_data;
-- Top 5 spenders (in constant USD) in the most recent year
SELECT 
    country, CEIL(SUM(value)) AS Spent_amount$
FROM
    db1.sipri_data
WHERE
    metric = 'constant_usd'
GROUP BY country
ORDER BY Spent_amount$ DESC
LIMIT 5;
-- Year-wise spending trend of a specific country (e.g. Israel)
SELECT 
    Country, year, value
FROM
    db1.sipri_data
WHERE
    country = 'Israel'
        AND metric = 'constant_usd'
ORDER BY year;
-- Total military spending (all years) by each country
SELECT 
    country, CEIL(SUM(value)) AS total_spending$
FROM
    db1.sipri_data
WHERE
    metric = 'constant_usd'
GROUP BY Country;
-- Compare top 5 countries by spending share of GDP in 2000
SELECT 
    country, value AS share_gdp
FROM
    db1.sipri_data
WHERE
    year = 2000 AND metric = 'share_gdp'
ORDER BY share_gdp
LIMIT 5;
-- Average military spending as % of GDP (per country) over time
SELECT 
    country, ROUND(AVG(value), 3) AS avg_share_gdp
FROM
    db1.sipri_data
WHERE
    metric = 'share_gdp'
GROUP BY country
ORDER BY avg_share_gdp DESC;