create table users (
    user_id number(10) primary key,
    name varchar2(10) not null,
    password varchar2(20) not null,
    role varchar2(10) not null
);

create table posts (
    post_id number(10) primary key,
    title varchar2(20) not null,
    content varchar2(1000) not null,
    user_id number(10) not null,
    foreign key (user_id) references users(user_id)
);

create table comments (
    comment_id number primary key,
    content varchar2(300) not null,
    user_id number(10) not null,
    post_id number(10) not null,
    foreign key (user_id) references users(user_id),
    foreign key (post_id) references posts(post_id)
);

----------------------------------------------------------

create table attachments (
    attachment_id number(10) primary key,
    file varchar2(300) not null
);

create table schedules (
    schedule_id number(10) primary key,
    title varchar2(20) not null,
    content varchar2(3000),
    start_date date not null,
    end_date date not null,
    progress number(5) not null,
    attachment_id number(10),
    foreign key (attachment_id) references attachments(attachment_id)
);

create table alarm (
    alarm_id number(10) primary key,
    content varchar2(200) not null,
    alarm_date date not null,
    status varchar2(10) not null,
    schedule_id number(20) not null,
    foreign key (schedule_id) references schedules(schedule_id)
);


create table schedule_users (
    schedule_id number(10) not null,
    user_id number(10) not null,
    foreign key (schedule_id) references schedules(schedule_id),
    foreign key (user_id) references users(user_id)
);

create table schedule_attachments (
    schedule_id number(10) not null,
    attachment_id number(10) not null,
    foreign key (schedule_id) references schedules(schedule_id),
    foreign key (attachment_id) references attachments(attachment_id)
);