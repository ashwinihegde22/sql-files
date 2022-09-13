
/*exersize 1 partition*/
select p.name as productname, p.listprice,
s.name as productsubcategory,
c.name as productcategory from production.product p
inner join production.productsubcategory s
on p.productsubcategoryID = s.productsubcategoryid

inner join production.productcategory c
on s.productcategoryid = c.productcategoryid

/*exercise 2 partition*/

select p.name as productname,p.listprice,
s.name as productsubcategory,
c.name as productcategory,avgpricebycategory = avg(p.listprice) over(),
avgpricebycategoryandsubcategory = avg(p.listprice) over(partition by c.name)
from production.product p
inner join production.productsubcategory s
on p.productsubcategoryid = s.productsubcategoryid
inner join production.productcategory c
on s.productcategoryid = c.productcategoryid

/* exercise 3 partition*/
select p.name as productname,p.listprice,
s.name as productsubcategory,
c.name as productcategory,avgpricebycategory = avg(p.listprice) over(partition by c.name),
avgpricebycategoryandsubcatgory = avg(p.listprice)over(partition by c.name)
from production.product p
inner join production.productsubcategory s
on p.productsubcategoryid = s.productsubcategoryid
inner join production.productcategory c
on s.productcategoryid = c.productcategoryid

/*exersize 4 partition*/
select p.name as productname,p.listprice,
s.name as productsubcategory,
c.name as productcategory,avgpricebycategory = avg(p.listprice)over(partition by c.name),
avgpricebycategoryandsubcategory=avg(p.listprice) over(partition by c.name),
productvscategorydelta=p.listprice - avg(p.listprice) over(partition by c.name)
from production.product p
inner join production.productsubcategory s
on p.productsubcategoryid=s.productsubcategoryid
inner join production.productcategory c
on s.productcategoryid=c.productcategoryid

/*ex 5*/
select p.firstname,p.lastname,e.jobtitle,c.rate,averagerate = avg(c.rate) over()
from Person.Person as p
join HumanResources.employee as e
on p.businessentityid = e.businessentityid
join HumanResources.EmployeePayHistory as c
on p.BusinessEntityID = c.BusinessEntityID

/*ex 6*/

select p.firstname,p.lastname,e.jobtitle,C.rate,averagerate = avg(c.rate) over(),maximumrate = MAX(c.rate) over(),
difffromavg = C.rate - avg(c.rate) over(),percentofmaxrate = C.rate/MAX(c.rate) over() *100
from person.person as p
join HumanResources.employee as e
on p.BusinessEntityID = e.businessentityid
join HumanResources.EmployeePayHistory as c
on e .BusinessEntityID = C.BusinessEntityID