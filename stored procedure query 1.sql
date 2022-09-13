create table product1
(productid int,productname varchar(100))
go

create table productdesc
(productid int,productdesc varchar(800))
go

insert into product1 values(680,'hl road frme-blak,58'),(706,'red-58'),(707,'helmet')
go

insert into productdesc values (680,'replaement mountain wheel for entry level rider'),
(706,'features quick hub')

create procedure getproddescription3 as
begin
set nocount on

select p.productid,p.productname,pd.productdesc
from product1 as p
inner join productdesc pd
on p.productid = pd.productid
end

exec getproddescription3