drop table products;
create table products(
    id          number(11),
    name        varchar2(50),
    price       number,
    maker       varchar2(30)
);

alter table products
add primary key(id);

select * from products;
delete from products;