
/*selecione nome, cidade, estado e país das editoras,
traduzindo o cabeçalho das colunas.*/
select pub_name 'Nome', city 'Cidade', state 'Estado', country 'Pais' 
from publishers

/*2 - selecione todas as editoras que não tem um ESTADO cadastrado.*/
select * from publishers where state is null

/*3 - selecione todos os autores cujo sobrenome começe com S ou a sua cidade comece com C*/
select * 
from authors
where (au_lname like 'S%') or (city like 'C%')  


/**/

select * 
from titles
where type like 'trad_cook' and price < 20 and ytd_sales > 10000
Order by price desc 

--5

select title, type, price, price * ytd_sales 'Total arrecadado' 
from titles
order by 'Total arrecadado' 

--6
select title, price, price * 1.15 'Price Aumentado'
from titles 

--7
select city, au_fname 'Nome' from authors 
where city like '%[AU]%'

--8
select * from titles 
where pub_id in ('1389', '0736', '1501')
