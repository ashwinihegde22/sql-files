select a.name as productname,a.listprice,b.name as productsubcategory ,C.name as productcategory,
categorypricerank=row_number()over(order by a.listprice desc),
categorypricerankwithrank=RANK()over(order by a.listprice desc),
categorypricedenserank=DENSE_RANK()over(partition by c.name order by a.listprice desc)
from Production.product as a
join Production.productsubcategory as b
on b.productsubcategoryid=a. productsubcategoryid
join production.productcategory as c
on C.productcategoryid=b.productcategoryid
order by a.listprice desc,productcategory desc;