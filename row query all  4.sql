
/*exersise row 1*/

select p.name as productname,p.listprice,
s.name as productsubcategory,
C.name as productcategory from production.product p
inner join production.productsubcategory s
on p.productsubcategoryid = s.productsubcategoryid
inner join production.productcategory c
on s.productcategoryid = C.productcategoryid

/*ex 2*/
select p.name as productname,p.listprice,
s.name as productsubcategory,c.name as productcategory,
pricerank = row_number() over(order by p.listprice desc)
from production.product p
inner join production.productsubcategory s
on p.productsubcategoryid = s.productsubcategoryid
inner join production.productcategory c
on s.productcategoryid = C.productcategoryid




/*exersize 3 row*/

select p.name as productname, p.listprice,
s.name as productsubcategory,c.name as productcategory,
pricerank = row_number() over(order by p.listprice desc ),
categorypricerank = row_number() over(partition by c.name order by p.listprice desc)
from production.product as p
inner join production.productsubcategory as s
on p.productsubcategoryid = s.productsubcategoryid
inner join production.productcategory as c
on s.productcategoryid = c.productcategoryid

/*ex 4*/

select p.name as productname,p.listprice,
s.name as productsubcategory,C.name as productcategory,
categorypricerank = RANK() over(partition by c.name order by p.listprice desc),

case when rank() over (partition by p.name order by p.listprice desc) > 5
then 'no'
else 'yes'
end as top5priceincategory

from production.product p
inner join production.productsubcategory s
on p.productsubcategoryid = s.productsubcategoryid
inner join production.productcategory c
on s.productcategoryid = c.productcategoryid
order by p.listprice,productcategory
