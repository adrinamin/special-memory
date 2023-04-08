create table products (
    id uniqueidentifier not null, 
    name varchar(100), 
    price decimal(18,2), 
    creationDate datetime,
    primary key (id)
);
go
