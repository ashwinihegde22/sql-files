select p.name as productname,p.listprice,
s.name as productsubcategory, c.name as productcategory,
pricerank =row_number() over(partition by p.listprice order by c.name desc),
categorypricerank = RANK() over(partition by c.name order by p.listprice desc),
case when rank() over (partition by p.name order by p.listprice desc) > 5 
then 'no'
else 'yes'
end as top5priceincategory

from production.product p
inner join production.productsubcategory s
on p.productsubcategoryid = s.productcategoryid
inner join Production.productcategory c
on s.productcategoryid = c.productcategoryid
order by p.listprice,productcategory
 