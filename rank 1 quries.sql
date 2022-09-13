select a.name as productname,a.listprice,b.name as productsubcategory, c.name as productcategory,
pricerank = row_number() over(order by listprice desc),
categorypricernkwithrank=RANK()over(partition by c.name order by a.listprice desc)
from Production.product as a
join Production.productsubcategory as b
on b.productsubcategoryid = a.productsubcategoryid
join Production.productcategory as c
on c.productcategoryid=b.productcategoryid
order by a.listprice desc,productcategory;

