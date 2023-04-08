create table orders (
    id uniqueidentifier not null,
    number int not null,
    date datetime not null,
    state tinyint not null,
    primary key (id)
);

alter table orders add products_id uniqueidentifier not null;
alter table orders add constraint products_foreignKey foreign key (products_id) references products(id);