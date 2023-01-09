CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

DELIMITER //
Create procedure display_list()
BEGIN 
select *
from users;
end //
DELIMITER //;
call display_list();


delimiter // 
create procedure update_user (in id1 int , in name1 varchar(50), in email1 varchar(50) , in country1 varchar(50)) begin 
update users set name = name1,email= email1, country = country1 where id = id1;
end // 
delimiter // ;
set SQL_SAFE_UPDATES = 0;
call update_user(2,'2','3','3');
DELIMITER //
Create procedure remove_user(in user_id int)
begin
delete from users where id = user_id;
end//
DELIMITER // ;
call remove_user(1);