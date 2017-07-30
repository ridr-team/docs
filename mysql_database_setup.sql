
##
# All the table creation queries are here.
# DROPS THE TABLE IF ALREADY EXISTING. ALL DATA IS DELETED
# Usage:
# 1. Either copy the file to EC2, login to mysql shell, and then run using SOURCE <file_name>
# 2. Or use
# mysql -h ec2-54-193-102-49.us-west-1.compute.amazonaws.com -P 3306 -u ridr -p < file_name.sql
#
# Naming conventions to follow:
# 1. All names in small caps
# 2. Words separated by underscore(_)
# 3. Table names should be singular (user NOT users)
##

SET foreign_key_checks = 0;
DROP database if exists smart_home_manager;

CREATE database smart_home_manager;
USE smart_home_manager;

CREATE TABLE user(
    user_id int not null auto_increment,
    name varchar(15) not null,
    email varchar(60) not null,
    mobile char(10) not null,
    password varchar(60) not null,
    primary key(user_id)
);

SET autocommit=1;
