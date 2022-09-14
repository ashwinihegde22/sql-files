CREATE TABLE Product
(ProductID INT, ProductName VARCHAR(100) )
GO
 
CREATE TABLE ProductDescription
(ProductID INT, ProductDescription VARCHAR(800) )
GO
 
 --To insert values in Table--

INSERT INTO Product VALUES (680,'HL Road Frame - Black, 58')
,(706,'HL Road Frame - Red, 58')
,(707,'Sport-100 Helmet, Red')
GO
 
INSERT INTO ProductDescription VALUES (680,'Replacement mountain wheel for entry-level rider.')
,(706,'Sturdy alloy features a quick-release hub.')
,(707,'Aerodynamic rims for smooth riding.')


Select *
From ProductDescription

--To create Procedure--

Create Procedure GetProdDescription AS
Begin
Set nocount ON

Select p.ProductID, p.ProductName, PD.ProductDescription
FROM Product as p
Inner Join ProductDescription PD
On p.ProductID = PD.ProductID

End

--To create procedure with Parameters--
Create Procedure GetProdDescription_withparaments
(@PID INT)
AS
BEGIN
SET NOCOUNT ON

Select p.ProductID, p.ProductName,PD.ProductDescription
FROM Product as p
Inner Join ProductDescription PD
On p.ProductID = PD.ProductID
WHERE p.ProductID = @PID

END

Exec GetProdDescription_withparaments 706

--To create procedure with default parameters--

Create Procedure GetProdDescription_withDefaultparam
(@PID INT = 706)
AS
BEGIN
SET NOCOUNT ON

Select p.ProductID, p.ProductName,PD.ProductDescription
FROM Product as p
Inner Join ProductDescription PD
On p.ProductID = PD.ProductID
WHERE p.ProductID = @PID

END

Exec GetProdDescription_withDefaultparam 

--Create employee table--

CREATE Table Employee (EmpID INT Identity(1,1),EmpName varchar(500))

Select * From Employee

--To create procedure without parameters--

Create Procedure ins_NewEmp_withoutparameters
(@Ename varchar(50),
@EId INT output)
AS
BEGIN
SET NOCOUNT ON

Insert into Employee (EmpName) Values (@Ename)
Select @EId = SCOPE_IDENTITY()
End

declare @EmpID INT
Exec ins_NewEmp_withoutparameters 'ashwini',@EmpID output

SELECT @EmpID


Select *
FROM Employee 

--To create procedure with encryption--

CREATE Procedure GetEmployee
With Encryption
AS 
BEGIN
SET NOCOUNT ON

SELECT EmpID,EmpName
FROM Employee

End

Exec GetEmployee

sp_helptext GetEmployee

--To create local procedure--

Create Procedure #Temp3
AS
BEGIN
Print('Local temp variable ')
END

EXec #Temp3

--To create Global Variable--

Create Procedure ##TEMP3
AS
BEGIN
Print('Global Temp variable')
END

Exec ##TEMP3


