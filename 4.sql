select * 
from titles
where type like 'trad_cook' and price < 20 and ytd_sales > 10000
Order by price desc 
