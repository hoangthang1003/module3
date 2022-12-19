create database student_management2;
use student_management2;

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
  credit tinyint not null check(credit >= 1), 
  status bit default 1
);

create table mark(
  mark_id int not null primary key auto_increment, 
  sub_id int, 
  student_id int, 
  mark float check(
    mark >= 0 
    and mark <= 100
  ), 
  exam_times tinyint default 1, 
  foreign key (sub_id) references subject(sub_id), 
  foreign key (student_id) references student(student_id)
);

INSERT INTO class 
VALUES 
  (1, 'A1', '2008-12-20', 1);
INSERT INTO class 
VALUES 
  (2, 'A2', '2008-12-22', 1);
INSERT INTO class 
VALUES 
  (3, 'B3', current_date, 0);
  
INSERT INTO student (
  student_name, address, phone, status, 
  class_id
) 
VALUES 
  (
    'Hung', 'Ha Noi', '0912113113', 1, 
    1
  ), 
  ('Hoa', 'Hai phong', null, 1, 1), 
  ('Manh', 'HCM', '0123123123', 0, 2);
  
INSERT INTO subject 
VALUES 
  (1, 'CF', 5, 1), 
  (2, 'C', 6, 1), 
  (3, 'HDJ', 5, 1), 
  (4, 'RDBMS', 10, 1);
INSERT INTO mark (
  sub_id, student_id, mark, exam_times
) 
VALUES 
  (1, 1, 8, 1), 
  (1, 2, 10, 2), 
  (2, 1, 12, 1);
  
/*  Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’ */
select 
  * 
from 
  student 
where 
  student_name like "h%";
  
/*
Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12. */
select 
  * 
from 
  class 
where 
  start_date like "%-12-%";
  
/*
Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5. */
select 
  * 
from 
  subject 
where 
  credit in (3, 4, 5);
  
/*
Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2. */
set 
  SQL_SAFE_UPDATES = 0;
update 
  student 
set 
  class_id = 2 
where 
  student_name = 'Hung';
set 
  SQL_SAFE_UPDATES = 1;
  
/*
Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần. */
select 
  s.student_name, 
  sub_name, 
  mark as so_luong 
from 
  student as s 
  join mark as m on m.student_id = s.student_id 
  join subject as sub on sub.sub_id = m.sub_id 
order by 
  so_luong;
