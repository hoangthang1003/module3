create database student_m;
use student_management;
create table class(
  id int, 
  `name` varchar(50)
);

create table teacher(
  id int primary key, 
  name varchar(50), 
  age int, 
  country varchar(50)
)
