-- 1) Qual a diferença máxima de preços praticado por cada editora?
select publishers.pub_name, max(titles.price) - min(titles.price) Diferenca
from titles inner join publishers
on titles.pub_id = publishers.pub_id
group by publishers.pub_name


-- 2) Quais os livros que tem preço superior à média de preços do seu tipo?
select title, price, type 
from titles
where price >(select type from titles where type not like (select type, avg(price) media from titles group by type)) 

select type, avg(price)
from titles
group by type

select title, price from titles where type like 'business'

select title, price, type
from titles
where price > (SELECT AVG(t1.price)
                FROM titles t1 CROSS JOIN titles t2
                where t1.type = t2.type)
-- 3) Que autores vivem na mesma cidade?  

select  a1.au_fname, a2.au_fname, a1.city
from authors a1 cross join authors a2
where a1.city = a2.city and a1.au_id > a2.au_id
order by a1.city

-- 4) Quais os livros publicados que não foram vendidos?(Resolva de duas formas, com Join e com Subquery)
	--4)a.
select titles.title, sales.qty
from titles left join sales
on titles.title_id = sales.title_id
where sales.ord_num is null
	
	--4)b.
select titles.title
from titles
where titles.title_id not in (select sales.title_id from sales)
	 
-- 5) Aumente em 20% os preços dos livros que custam menos que $12.
update titles
set price = price * 1.2
where price < 12
-- 6) Inclua um Job que ainda não foi inserido com min_lvl 170 e max_lvl = 250
select * from jobs

insert jobs
(job_desc, min_lvl, max_lvl)
values ('Job' , 170, 250)
-- 7) Insira você mesmo na tabela Employee, com o código SNC10101M, associado ao cargo que acabou de inserir no exercício 6. Não específique uma editora nem uma data de contratação.(mude o 4 primeiros dígitos numéricos para outros números)
insert employee
(emp_id, fname, minit, lname, job_id, job_lvl)
values('SNC77772M', 'Gustavo', '', 'Yamauchi', 15, 250)


-- 8) Reduza em 1% o preço dos livros das editoras que não são da california.
SELECT * FROM titles
select * from publishers

update titles
set price = price * 0.99
from publishers left join titles
on publishers.pub_id = titles.pub_id
where publishers.state <>like 'CA'
-- 9) Exclua o Employees que você criou.

delete employee
where emp_id like 'SNC77771M'


-- 10) Crie uma tabela chamada "TituloFulano" (onde fulano é seu nome) com os campos: Id, Titulo, Preço, Tipo, NomeEditora e DataPublicacao, com os dados vindos das tabelas titles e publishers.
SELECT title_id Id, title Titulo, price Preco, pub_name Editora, pubdate DataPublicacao
INTO tituloGustavo
FROM titles LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id

