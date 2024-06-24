use quan_ly_ban_hang;

SELECT 
    *
FROM
    product;

select c.c_id,c.customer_name AS "Tên người mua",GROUP_CONCAT(p.name_product) AS "Tên sản phẩm mua", o.o_id
from customer c
join orders o ON c.c_id = o.customer_id
join order_detail od ON o.o_id = od.id_O
join product p ON od.id_P = p.id
group by c.c_id,c.customer_name,o.o_id;

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











