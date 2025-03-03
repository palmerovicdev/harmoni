create table activity_group
(
    id int primary key auto_increment,
    name varchar(255) null,
    image text null,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp
);