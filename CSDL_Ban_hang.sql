use quan_ly_ban_hang;

select * from product;

select customer_name as "Tên người mua",name_product as "Tên sản phẩm mua"
from customer c
join orders o
on c.c_id = o.customer_id
join order_detail od
on o.o_id = od.id_O
join product p
on od.id_P = p.id;

select customer_name as "Tên người mua" 
from customer c
left join orders o
on c.c_id = o.customer_id
where o.date_order is null;

select customer_name,c_id,date_order,(p.product_price * od.odQTY) as total_price
from customer c
join orders o
on c.c_id = o.customer_id
join order_detail od
on o.o_id = od.id_O
join product p
on od.id_P = p.id
order by c.c_id asc;











