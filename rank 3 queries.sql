select p.name as productname,p.listprice,
s.name as productsubcategoy,c.name as productcategory,
pricerank = row_number() over(order by p.listprice desc),
categorypricerank = row_number() over(partition by c.name order by p.listprice desc)
from production.product as p
inner join production.productsubcategory as s
on p.productsubcategoryid = s.productsubcategoryid
inner join production.productcategory as c
on s.productcategoryid = c.productcategoryid