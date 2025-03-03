create table activity
(
    id int primary key auto_increment,
    name varchar(255) null,
    image text null,
    activity_group_id int null,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp
);