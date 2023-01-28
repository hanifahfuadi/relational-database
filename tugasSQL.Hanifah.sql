create database alta_online_shop;
use alta_online_shop;

create table user (
id int not null auto_increment,
nama varchar(255) not null,
gender enum ('LAKI-LAKI', 'PEREMPUAN'),
created_at datetime default now(),
updated_at datetime default now(),
primary key (id)
);

create table operator (
id int not null auto_increment,
nama varchar(255) not null,
created_at datetime default now(),
updated_at datetime default now(),
primary key (id)
);

create table product_type (
id int not null auto_increment,
nama varchar(255) not null,
created_at datetime default now(),
updated_at datetime default now(),
primary key (id)
);

create table product (
id int not null auto_increment,
nama varchar(255) not null,
price int not null,
product_type_id int not null,
operator_id int not null,
created_at datetime default now(),
updated_at datetime default now(),
primary key (id),
foreign key (product_type_id) references product_type(id),
foreign key (operator_id) references operator(id)
);

create table product_description (
id int not null auto_increment,
description mediumtext not null,
product_id int not null,
created_at datetime default now(),
updated_at datetime default now(),
primary key (id),
foreign key (product_id) references product(id)
);
create table payment_method(
id int not null auto_increment,
nama varchar(255) not null,
created_at datetime default now(),
updated_at datetime default now(),
primary key (id)
);
create table transaction (
id int not null auto_increment,
user_id int not null,
payment_method_id int not null,
status enum ('PENDING','SUCCESS','FAILED'),
created_at datetime default now(),
updated_at datetime default now(),
primary key (id),
foreign key (user_id) references user(id),
foreign key (payment_method_id) references payment_method(id)
);

create table transaction_detail (
id int not null auto_increment,
product_id int not null,
qty int not null,
price int not null,
transaction_id int not null,
created_at datetime default now(),
updated_at datetime default now(),
primary key (id),
foreign key (transaction_id) references transaction(id),
foreign key (product_id) references product(id)
);

show tables;
describe transaction;
-- I
-- 1. INSERT 
-- a. Insert 5 operator pada table operators
insert into operator (id, nama) values (1, 'alan');
insert into operator (id, nama) values (2, 'indah');
insert into operator (id, nama) values (3, 'ujang');
insert into operator (id, nama) values (4, 'elang');
insert into operator (id, nama) values (5, 'omar');
select * from operator;
-- b. Insert 3 product type
insert into product_type (id, nama) values (1, 'TV');
insert into product_type (id, nama) values (2, 'MOBILE');
insert into product_type (id, nama) values (3, 'PC');
select * from product_type;
-- c. Insert 2 product dengan product type id = 1, dan operators id = 3.
insert into product (nama, price, product_type_id, operator_id) values ('netflix', 50000, 1, 3);
insert into product (nama, price, product_type_id, operator_id) values ('HBO', 60000, 1, 3);
select * from product;
-- d. Insert 3 product dengan product type id = 2, dan operators id = 1.
insert into product (nama, price, product_type_id, operator_id) values ('disney1', 50000, 2, 1);
insert into product (nama, price, product_type_id, operator_id) values ('disney2', 50000, 2, 1);
insert into product (nama, price, product_type_id, operator_id) values ('disney3', 50000, 2, 1);
select * from product;
-- e. Insert 3 product dengan product type id = 3, dan operators id = 4.
insert into product (id, nama, price, product_type_id, operator_id) values (6, 'prime1', 50000, 3, 4);
insert into product (id, nama, price, product_type_id, operator_id) values (7, 'prime2', 50000, 3, 4);
insert into product (id, nama, price, product_type_id, operator_id) values (8, 'prime3', 50000, 3, 4);
insert into product (id, nama, price, product_type_id, operator_id) values (9, 'prime4', 50000, 3, 4);
select * from product;
-- f. Insert product description pada setiap product.
insert into product_description (id, description, product_id) values (1, 'paket 1 bulan', 1);
insert into product_description (id, description, product_id) values (2, 'paket 1 bulan', 2);
insert into product_description (id, description, product_id) values (3, 'paket 1 bulan', 3);
insert into product_description (id, description, product_id) values (4, 'paket 1 bulan', 4);
insert into product_description (id, description, product_id) values (5, 'paket 1 bulan', 5);
insert into product_description (id, description, product_id) values (6, 'paket 1 bulan', 6);
insert into product_description (id, description, product_id) values (7, 'paket 1 bulan', 7);
insert into product_description (id, description, product_id) values (8, 'paket 1 bulan', 8);
insert into product_description (id, description, product_id) values (9, 'paket 1 bulan', 9);
select * from product_description;
-- g. Insert 3 payment methods.
insert into payment_method (id, nama) values (1, 'VA');
insert into payment_method (id, nama) values (2, 'CASH');
insert into payment_method (id, nama) values (3, 'MOBILE');
select * from payment_method;
-- h. Insert 5 user pada tabel user.
insert into user (id, nama, gender) values (1, 'Reza', 'LAKI-LAKI');
insert into user (id, nama, gender) values (2, 'Rani', 'PEREMPUAN');
insert into user (id, nama, gender) values (3, 'Rain', 'LAKI-LAKI');
select * from user;
-- i. Insert 3 transaksi di masing-masing user (min 3 user).
insert into transaction (id, user_id, payment_method_id, status) values (1, 1, 1 ,'SUCCESS');
insert into transaction (id, user_id, payment_method_id, status) values (2, 2, 2 ,'PENDING');
insert into transaction (id, user_id, payment_method_id, status) values (3, 3, 3 ,'FAILED');
insert into transaction (id, user_id, payment_method_id, status) values (4, 3, 1 ,'SUCCESS');
insert into transaction (id, user_id, payment_method_id, status) values (5, 3, 2 ,'SUCCESS');
select * from transaction ;
-- j. Insert 3 product di masing-masing transaksi.
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (1, 1, 1, 50000, 1);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (6, 2, 2, 50000, 1);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (7, 2, 2, 50000, 1);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (2, 2, 2, 50000, 2);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (8, 3, 2, 50000, 2);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (9, 3, 2, 50000, 2);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (3, 3, 3, 50000, 3);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (10, 4, 3, 50000, 3);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (11, 4, 3, 50000, 3);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (4, 4, 4, 50000, 4);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (12, 4, 4, 50000, 4);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (13, 4, 4, 50000, 4);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (5, 5, 5, 50000, 5);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (14, 5, 5, 50000, 5);
insert into transaction_detail (id, product_id, qty, price, transaction_id) values (15, 5, 5, 50000, 5);
select * from transaction_detail ;

-- 2. SELECT
-- a. Tampilkan nama user / pelanggan dengan gender Laki-laki / M.
select * from user where gender = 'LAKI-LAKI';
-- b. Tampilkan product dengan id = 3.
select * from product where id = 3;
-- c. Tampilkan data pelanggan yang created_at dalam range 7 hari kebelakang dan mempunyai nama mengandung kata ‘a’.
select * from user where (created_at between '2023-01-21 2023-01-28 21:38:38' and '2023-01-28 21:38:38') and nama like binary '%a';
-- d. Hitung jumlah user / pelanggan dengan status gender Perempuan.
select count('PEREMPUAN') as jumlah_perempuan;
-- e. Tampilkan data pelanggan dengan urutan sesuai nama abjad
select * from user order by nama asc;
-- f. Tampilkan 5 data transaksi dengan product id = 3
select * from transaction_detail where product_id = 3;

-- 3. UPDATE
-- a. Ubah data product id 1 dengan nama ‘product dummy’.
update product_description set description = 'product dummy' where product_id = 1;
select * from product_description;
-- b. Update qty = 3 pada transaction detail dengan product id 1.
update transaction_detail set qty = 3 where product_id = 1;
select * from transaction_detail;

-- 4. DELETE
-- a. Delete data pada tabel product dengan id 1.
insert into product (id, nama, price, product_type_id, operator_id) values (16, 'netflix1', 50000, 1, 3);
select * from product;
delete from product  where id = 16;
-- b. Delete pada tabel product dengan product-type id 1.
insert into product (id, nama, price, product_type_id, operator_id) values (16, 'viu', 50000, 1, 3);
delete from product  where id = 16 and product_type_id = 1;
select * from product;

-- II
-- 1. Gabungkan data transaksi dari user id 1 dan user id 2.
select user_id status from transaction where user_id = 1
union
select user_id status from transaction where user_id = 2;
-- 2. Tampilkan jumlah harga transaksi user id 1.
select sum(price) as jumlah_harga from transaction_detail where id = 1;
-- 3. Tampilkan total transaksi dengan product type 2.
select sum(price) as total_transaksi from product where product_type_id = 2;
-- 4. Tampilkan semua field table product dan field name table product type yang saling berhubungan.
select p.*, pt.nama from product p left join product_type pt on p.product_type_id = p.id;
-- 5. Tampilkan semua field table transaction, field name table product dan field name table user.
select t.*, p.nama, u.nama from transaction t left join product p on p.id = t.id left join user u on u.id = t.id;
-- 6. Tampilkan data products yang tidak pernah ada di tabel transaction_details dengan sub-query.
select p.* from transaction_detail td right join product p on td.product_id = p.id where td.product_id is null;
select * from transaction_detail;
select * from product;

