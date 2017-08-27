
##
# All the table creation queries are here.
# DROPS THE TABLE IF ALREADY EXISTING. ALL DATA IS DELETED
# Usage:
# Copy SQL file to root directory of Amazon EC2:
# scp -i server-key.pem -r /Users/rishi/Documents/smart-home-manager/docs/mysql_database_setup.sql ubuntu@ec2-54-193-102-49.us-west-1.compute.amazonaws.com:~
#
# 1. Either login to mysql shell, and then run using SOURCE <file_name>
# 2. Or use
# mysql -h ec2-54-193-102-49.us-west-1.compute.amazonaws.com -P 3306 -u ridr -p < mysql_database_setup.sql
#
# Naming conventions to follow:
# 1. All names in small caps
# 2. Words separated by underscore(_)
# 3. Table names should be singular (user NOT users)
##

SET foreign_key_checks = 0;
DROP database if exists smart_home_manager;
CREATE database smart_home_manager;
use smart_home_manager;

CREATE TABLE user (
    id int not null auto_increment,
    name varchar(35) not null,
    email varchar(50) not null,
    password varchar(15) not null,
    phone_number varchar(10) not null,
    photo_id int not null,
    signup_from varchar(10) not null,
    primary key(id),
    unique(phone_number),
    unique(photo_id),
    unique(email)
);

CREATE TABLE interest (
    activity varchar(30) not null,
    user_id int not null,
    constraint fk_interest_user_id foreign key(user_id) references user(id) on delete cascade on update cascade,
    primary key(user_id, activity)
);

CREATE TABLE user_group (
    id int not null auto_increment,
    name varchar(15) not null,
    photo_id int not null,
    primary key(id),
    unique(photo_id)
);

CREATE TABLE group_member (
    user_id int not null,
    group_id int not null,
    constraint fk_user_group_member_user_id foreign key(user_id) references user(id) on delete cascade on update cascade,
    constraint fk_group_member_group_id foreign key(group_id) references user_group(id) on delete cascade on update cascade,
    primary key(user_id, group_id)
);

CREATE TABLE task (
    id int not null auto_increment,
    name varchar(15) not null,
    frequency varchar(15) not null,
    start_date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    due_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type varchar(15) not null,
    group_id int not null,
    constraint fk_task_group_id foreign key(group_id) references user_group(id) on delete cascade on update cascade,
    primary key(id, group_id)
);

CREATE TABLE task_assigned_to (
    user_id int not null,
    group_id int not null,
    task_id int not null,
    constraint fk_task_assigned_to_user_id foreign key(user_id) references user(id) on delete cascade on update cascade,
    constraint fk_task_assigned_to_task_id foreign key(task_id) references task(id) on delete cascade on update cascade,
    constraint fk_task_assigned_to_group_id foreign key(group_id) references user_group(id) on delete cascade on update cascade,
    date datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    completed boolean,
    primary key(user_id, task_id, group_id)
);

CREATE TABLE users_involved_task (
    user_id int not null,
    task_id int not null,
    group_id int not null,
    constraint fk_users_involved_task_user_id foreign key(user_id) references user(id) on delete cascade on update cascade,
    constraint fk_users_involved_task_task_id foreign key(task_id) references task(id) on delete cascade on update cascade,
    constraint fk_users_involved_task_group_id foreign key(group_id) references user_group(id) on delete cascade on update cascade,
    primary key(user_id, task_id, group_id)
);

SET autocommit=1;
