/*ex 1*/
select p.firstname,p.lastname,e.jobtitle, c.rate, averagerate = avg(c.rate) over()
from Person.Person as p
join humanresources.employee as e
on p.BusinessEntityID = e.BusinessEntityID
join HumanResources.EmployeePayHistory as c

on p.BusinessEntityID = C.BusinessEntityID

/*ex 2*/
select p.firstname, p.lastname, e.jobtitle, C.rate, averagerate = avg(c.rate) over(), maximarate = max(c.rate) over()
from Person.person as p
join HumanResources.employee as e
on p.businessentityid = e.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on e.BusinessEntityID = c.BusinessEntityID

/*ex 3*/
select p.firstname, p.lastname, e.jobtitle, C.rate, averagerate = avg(c.rate) over(), maximarate = max(c.rate) over(),
difffromavg = c.rate - avg(c.rate) over()
from Person.person as p
join HumanResources.employee as e
on p.businessentityid = e.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on e.BusinessEntityID = c.BusinessEntityID


/*ex 4*/
select p.firstname, p.lastname, e.jobtitle, C.rate, averagerate = avg(c.rate) over(), maximarate = max(c.rate) over(),
difffromavg = c.rate - avg(c.rate) over(),  percentofmaxrate = c.rate/MAX(c.rate) over() *100
from Person.person as p
join HumanResources.employee as e
on p.businessentityid = e.BusinessEntityID
join HumanResources.EmployeePayHistory as c
on e.BusinessEntityID = c.BusinessEntityId