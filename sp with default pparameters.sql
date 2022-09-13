Create Procedure GetProdDescription11_withDefaultparam
(@PID INT = 706 )
AS
Begin
SET NOCOUNT ON

Select p.ProductID, p.ProductName,PD.ProductDesc
From Product1 as p
Inner Join ProductDesc PD
On p.ProductID = PD.ProductID
Where p.ProductID = @PID

End

exec GetProdDescription11_withDefaultparam