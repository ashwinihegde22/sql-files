-- Script for SelectTopNRows command from SSMS --
SELECT TOP (1000) [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[HumanResources].[Employee]
 
--Scalar Subqueries - Exercises 1--
 


Select 
BusinessEntityID,JobTitle,VacationHours ,(
select max(vacationHours) from [AdventureWorks2019].[HumanResources].[Employee])as MaxVacationHours

from [AdventureWorks2019].[HumanResources].[Employee]