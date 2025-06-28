SELECT * 
FROM layoffs_staging;

-- Removing Duplicates

Select  *,
row_number() over(
Partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage,
country, funds_raised_millions) as row_num
from layoffs_staging;

with duplicate_cte as
(
Select  *,
row_number() over(
Partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage,
country, funds_raised_millions) as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num>1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2
where row_num>1;

insert into layoffs_staging2
Select  *,
row_number() over(
Partition by company,location, industry, total_laid_off, percentage_laid_off, `date`, stage,
country, funds_raised_millions) as row_num
from layoffs_staging;

delete
from layoffs_staging2
where row_num>1;

-- Standardizing data

Select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

update layoffs_staging2
set industry = 'Crypto'
where industry like 'crypto%';

select distinct country, trim(country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = 'United States'
where country like 'United States.';

select `date`,
str_to_date(`date`, '%m/%d/%Y') 
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;


-- taking care of null and blanks

CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` date DEFAULT NULL,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into layoffs_staging3
select distinct company,location, industry, total_laid_off, percentage_laid_off, `date`, stage,
country, funds_raised_millions
from layoffs_staging2;


update layoffs_staging3
set industry = null
where industry = '';


select t1.industry, t2.industry
from layoffs_staging3 t1
join layoffs_staging3 t2
   ON t1.company=t2.company
where t1.industry is null 
and t2.industry is not null;


update layoffs_staging3 t1
join layoffs_staging3 t2
  ON t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null
and t2.industry is not null;


select *
from layoffs_staging3 
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs_staging3 
where total_laid_off is null
and percentage_laid_off is null;












