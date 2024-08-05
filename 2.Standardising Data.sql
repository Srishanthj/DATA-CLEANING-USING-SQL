SELECT company,TRIM(company)
FROM backup_table;

UPDATE backup_table
SET company = trim(company);

SELECT *
FROM backup_table 
where industry like 'Crypto%';

update backup_table
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct country,trim(trailing '.' from country)
from backup_table
order by 1;

update backup_table
set country = trim(trailing '.' from country)
where country like 'United states%';
select * from backup_table;

select `date`,
str_to_date(`date`,'%d%d%y') 
from backup_table; 



