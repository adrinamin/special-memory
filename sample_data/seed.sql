if not exists (select * from sys.databases where name = 'onlineStoreDb')
begin
    create database onlineStoreDb;
end
go

if not exists (select * from sys.tables where name = 'products')
begin
    create table onlineStoreDb.dbo.products (
        id uniqueidentifier not null, 
        name varchar(100), 
        price decimal(18,2),
        quantity int,
        creationDate datetime,
        primary key (id)
    );
end

if not exists (select * from sys.tables where name = 'orders')
begin
    create table onlineStoreDb.dbo.orders (
        id uniqueidentifier not null,
        number int not null,
        date datetime not null,
        state tinyint not null,
        products_id uniqueidentifier not null,
        primary key (id),
        foreign key (products_id) references products(id)
    );
end

-- alter table orders add products_id uniqueidentifier not null;
-- alter table orders add constraint products_foreignKey foreign key (products_id) references products(id);

if not exists (select * from sys.tables where name = 'customers')
begin
    create table onlineStoreDb.dbo.customers (
        id uniqueidentifier not null,
        firstname varchar(20), 
        lastname varchar(40), 
        address varchar(100), 
        city varchar(50), 
        postalCode varchar(50), 
        age tinyint, 
        verified bit,
        orders_id uniqueidentifier not null,
        primary key (id),
        foreign key (orders_id) references orders(id)
    );
end

-- alter table customers add id uniqueidentifier primary key;
-- alter table customers alter column verified bit not null;

-- alter table customers add orders_id uniqueidentifier not null;
-- alter table customers add constraint c_orders foreign key (orders_id) references orders(id);

insert into onlineStoreDb.dbo.products (id, name, price, quantity, creationDate) values 
    ('9b7f15de-7fa4-4b4d-8d80-f5b5d5c5ed2f', 'Product A', 10.99, 124, getdate()),
    ('7a0c18fc-ec7b-47dc-bd00-7b50df07f34d', 'Product B', 19.99, 228, getdate()),
    ('9b8f15de-7fa4-4b4d-8d80-f5b5d5c5ed5f', 'Product C', 5.99, 1124, getdate()),
    ('bb40781c-33ab-4821-9016-f29d6f9f6d13', 'Product D', 29.99, 2124, getdate()),
    ('bb40781c-33ab-4821-9016-f29d6f9f6d44', 'Product E', 14.99, 9900, getdate());

INSERT INTO onlineStoreDb.dbo.orders (id, number, date, state, products_id)
VALUES 
    ('dcd6d47b-cf46-48eb-a2f9-9b6963a3c7f1', 1, '2022-02-10 10:00:00', 1, '9b7f15de-7fa4-4b4d-8d80-f5b5d5c5ed2f'),
    ('f1d2a7e4-4ef4-4d4e-8b5d-eae5e17ca5e9', 2, '2022-02-11 12:30:00', 2, '7a0c18fc-ec7b-47dc-bd00-7b50df07f34d'),
    ('0cbde83e-f333-41f6-9ea6-3d3a39235af5', 3, '2022-02-12 14:45:00', 1, '9b8f15de-7fa4-4b4d-8d80-f5b5d5c5ed5f'),
    ('d24c8135-9641-4c81-8e3b-02c117f41cc5', 4, '2022-02-13 16:15:00', 3, 'bb40781c-33ab-4821-9016-f29d6f9f6d13');

INSERT INTO onlineStoreDb.dbo.customers 
    (id, firstname, lastname, address, city, postalCode, age, verified, orders_id)
VALUES
    (NEWID(), 'John', 'Doe', '123 Main St', 'Anytown', '12345', 35, 1, 'dcd6d47b-cf46-48eb-a2f9-9b6963a3c7f1'),
    (NEWID(), 'Jane', 'Smith', '456 Elm St', 'Othertown', '54321', 28, 0, 'f1d2a7e4-4ef4-4d4e-8b5d-eae5e17ca5e9'),
    (NEWID(), 'Bob', 'Johnson', '789 Oak St', 'Another Town', '67890', 42, 1, '0cbde83e-f333-41f6-9ea6-3d3a39235af5');

go


-- verify
select * from onlineStoreDb.dbo.customers
select * from onlineStoreDb.dbo.orders
select * from onlineStoreDb.dbo.products
go