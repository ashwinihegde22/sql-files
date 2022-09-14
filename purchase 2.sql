--purchase 2--
purselect * from purchasing.purchaseorderheader;


with p as
(
select distinct top 3 vendorid,purchaseorderid,orderdate,totaldue,freight,taxamt,

most_expensive=row_number() over ( order by totaldue desc),
top3=row_number() over(order by totaldue desc)
from purchasing.purchaseorderheader
)
select*from p where most_expensive<=3;