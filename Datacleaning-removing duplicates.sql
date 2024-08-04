CREATE TABLE world_layoffs.backup_table AS
SELECT * FROM  world_layoffs.layoffs;

WITH RankedLayoffs AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY company, industry, total_laid_off, percentage_laid_off 
               ORDER BY date -- Adjust this ordering as needed
           ) AS row_num
    FROM world_layoffs.layoffs
)
DELETE FROM world_layoffs.layoffs
WHERE EXISTS (
    SELECT 1
    FROM RankedLayoffs
    WHERE world_layoffs.layoffs.primary_key_column = RankedLayoffs.primary_key_column
    AND RankedLayoffs.row_num > 1
);
SELECT *
FROM world_layoffs.layoffs;







