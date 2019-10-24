--1
select (au_lname + ', ' + SUBSTRING(au_fname, 1, 1) + '.') Nome
from authors

--2
select len(max(title))
from titles

--3
select DATEDIFF(day, '20010531', getdate())

--4
select title, DATEDIFF(YEAR, pubdate, getdate()) Year
from titles
--5
select title, price, CEILING(price*1.15) '+15%'  
from titles
where type LIKE 'business'

--6
select COUNT(*)
from authors

--7
select pub_id, count(title) 
from titles
group by pub_id

--8
select distinct UNIDADE
from Titulo

--9
select distinct unidade, COUNT(titulo1)
from titulo
group by UNIDADE
order by 2 

--10
select sum(QTD)
from Titulo
where UNIDADE like 'SENAC'
