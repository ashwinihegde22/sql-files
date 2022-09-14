select * from Purchasing.PurchaseOrderHeader;


with most_exp as
(select purchaseorderid,vendorid,orderdate,taxamt,freight,
most_expensive_rank = row_number () over(PARTITION by vendorid order by totaldue desc)
from purchasing.purchaseorderheader)

select purchaseorderid,vendorid,orderdate,taxamt,freight,most_expensive_rank 
from most_exp
where most_expensive_rank <=3

