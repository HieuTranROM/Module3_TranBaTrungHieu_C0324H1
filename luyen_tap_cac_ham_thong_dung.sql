use quanlysinhvien1;

select * from subject
having Credit = (select max(Credit) from subject);

select SubId,SubName,Credit,Status
from subject 
where SubId in (select SubId from mark where Mark in(select max(Mark) from mark));

select s.StudentId,s.StudentName, avg(m.Mark) as diem_trung_binh
from student s
join mark m 
on s.StudentId = m.StudentId
group by s.StudentId
order by diem_trung_binh desc;
