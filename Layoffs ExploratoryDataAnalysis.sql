select *
from layoffs_staging3;

-- Exploratory Data Analysis

SELECT * 
FROM world_layoffs.layoffs_staging2;


SELECT MAX(total_laid_off)
FROM world_layoffs.layoffs_staging3;


-- Looking at Percentage to see how big these layoffs were

SELECT MAX(percentage_laid_off),  MIN(percentage_laid_off)
FROM world_layoffs.layoffs_staging3
WHERE  percentage_laid_off IS NOT NULL;


-- Which companies had 1 which is basically 100 percent of they company laid off

SELECT *
FROM world_layoffs.layoffs_staging3
WHERE  percentage_laid_off = 1;


SELECT *
FROM world_layoffs.layoffs_staging3
WHERE  percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;


-- 5 Companies with the biggest single Layoff

SELECT company, total_laid_off
FROM layoffs_staging3
ORDER BY 2 DESC
LIMIT 5;


-- layoffs by location

SELECT location, SUM(total_laid_off) as Layoffs
FROM layoffs_staging3
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;


-- layoffs by country

SELECT country, SUM(total_laid_off) as Layoffs
FROM layoffs_staging3
GROUP BY country
ORDER BY 2 DESC;


-- layoffs by Year

SELECT YEAR(date), SUM(total_laid_off) as Layoffs
FROM layoffs_staging3
GROUP BY YEAR(date)
ORDER BY 1 DESC;


-- Yearwise ranking of total layoffs by individual company

WITH Company_Year AS (
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging3
  GROUP BY company, YEAR(date)
), Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 5
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

select company, year(`date`) as Year, total_laid_off
from layoffs_staging3
group by company, year(`date`), total_laid_off
order by total_laid_off DESC
limit 10;