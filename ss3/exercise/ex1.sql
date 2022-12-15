classclasscreate database ex1_ss3;
use ex1_ss3;

create table class(
class_id int auto_increment primary key,
class_name varchar(60) not null,
start_date datetime not null,
status bit
);
create table student(
student_id int auto_increment not null primary key,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit,
class_id int not null,
foreign key(class_id) references class(class_id)
);
create table subject(
sub_id int auto_increment not null primary key,
sub_name varchar(30) not null,
credit tinyint not null check(credit >=1),
status bit default 1
);
create table mark(
mark_id int not null primary key auto_increment,
sub_id int,
student_id int,
mark float check(mark>=0 and mark <=100),
exam_times tinyint default 1,
foreign key (sub_id) references subject(sub_id),
foreign key (student_id) references student(student_id)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
 ('Hoa', 'Hai phong',null, 1, 1),
 ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);