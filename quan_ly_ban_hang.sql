create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
	c_id int primary key auto_increment,
    customer_name varchar(50),
    age int
);

create table orders(
	o_id int primary key auto_increment,
    date_order date,
    total_price float,
    customer_id int,
    foreign key (customer_id) references customer (c_id)
);

create table product(
    id int primary key auto_increment,
    name_product varchar(50),
    product_price int
);

create table order_detail(
    id_O int,
    id_P int,
    odQTY int,
    primary key (id_O, id_P),
    foreign key (id_O) references orders (o_id),
    foreign key (id_P) references product (id)
);