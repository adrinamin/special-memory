create table customers (
    firstname varchar(20), 
    lastname varchar(40), 
    address varchar(100), 
    city varchar(50), 
    postalCode varchar(50), 
    age tinyint, 
    verified bit
);
go

alter table customers add id uniqueidentifier primary key;
alter table customers alter column verified set not null;
go

alter table customers add orders_id uniqueidentifier not null;
alter table customers add constraint customer_orders foreign key (orders_id) references orders(id);
go