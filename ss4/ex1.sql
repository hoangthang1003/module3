use student_management2;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select 
  * 
from 
  subject 
where 
  credit = (
    select 
      max(credit) 
    from 
      subject
  );
  
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select 
  s.sub_id, 
  s.sub_name, 
  s.credit, 
  s.status, 
  m.mark 
from 
  subject s 
  left join mark m on m.sub_id = s.sub_id 
where 
  mark = (
    select 
      max(mark) 
    from 
      mark
  );
  
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm giảm dần
select 
  s.*, 
  avg(m.mark) 
from 
  student s 
  left join mark m on s.student_id = m.student_id 
group by 
  m.student_id 
order by 
  m.mark desc;
