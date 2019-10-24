--1 
select state_name, COUNT(*) Qtde 
from City
group by state_name
order by Qtde desc


--2
select sum(price * ytd_sales) Calculo
from titles

--3
select fname, job_desc
from employee left join jobs
on employee.job_id = jobs.job_id

--4
select fname, pub_name
from employee left join publishers 
on employee.pub_id = publishers.pub_id

--5
select title, price
from titles
where price < (select AVG(price) from titles where type like 'psychology')

--6
select job_desc, COUNT(employee.job_id) calculo
from jobs left join employee
on jobs.job_id = employee.job_id
group by job_desc 
order by calculo desc

--7
select au_fname, pub_name, a.city
from authors a inner join publishers p
on a.city = p.city

--8
select p.nome , evo.nome 'Evolução de'
from Pokemon p left join Pokemon evo
on p.evoluiDe = evo.codPokemon
--9
select p.nome, tp.nmTipo
from Pokemon p left join TipoPokemon tpp
on p.codPokemon = tpp.codPokemon 
inner join Tipo tp
on tpp.codTipo = tp.codTipo

--10
select p.nome, tp.nmTipo Fraqueza
from Pokemon p left join Fraqueza f
on p.codPokemon = f.codPokemon 
inner join Tipo tp
on f.codTipo = tp.codTipo
where tp.nmTipo like 'steel'

-- select pra tudo
select * from Pokemon
select * from Fraqueza
select * from Tipo
