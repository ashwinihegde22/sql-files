Select 
BusinessEntityID,JobTitle,VacationHours ,(
select max(vacationHours) from [AdventureWorks2019].HumanResources.Employee)as MaxVacationHours ,(
cast(
VacationHours as float)
/ cast(
(select max(vacationHours) from [AdventureWorks2019].HumanResources.Employee)as float )) *100
as VacationPercentage
from [AdventureWorks2019].HumanResources.Employee 
