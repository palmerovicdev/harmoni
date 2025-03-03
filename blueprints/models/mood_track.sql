create table mood_track
(
    id int primary key auto_increment,
    image_mood text null,
    record_mood text null,
    user_id int null,
    created_at datetime default current_timestamp,
    updated_at datetime default current_timestamp
);
