create table Students(
StudentID int primary key auto_increment,
StudentName varchar(100) not null,
StudentAge int
);

create table Courses(
CourseID int primary key auto_increment,
CourseName varchar(100) not null,
CourseDescription varchar(100)
);

create table Enrollments (
EnrollmentID int primary key auto_increment,
StudentID int,
CourseID int,
foreign key (StudentID) references Students(StudentID),
foreign key (CourseID) references Courses(CourseID)
);

insert into Students (StudentName , StudentAge) values
('A', 18),
('B', 19),
('C', 20),
('D', 21),
('E', 22);

insert into Courses (CourseName , CourseDescription) values
('Nhạc','1'),
('Vẽ','2'),
('Hát','3'),
('Nhảy','4'),
('Múa','5');

insert into Enrollments (StudentID, CourseID) values
(1, 1),  
(2, 2),  
(3, 3), 
(4, 4),
(5, 5);

select Students.StudentID, Students.StudentName, Students.StudentAge, Courses.CourseID, Courses.CourseName, Courses.CourseDescription
from Students join Enrollments on Students.StudentID = Enrollments.StudentID join Courses on Courses.CourseID = Enrollments.CourseID;

select Courses.CourseId, Courses.CourseName from Courses join Enrollments 
on Courses.CourseId = Enrollments.CourseId where Enrollments.StudentId = 1;

select Students.StudentId, Students.StudentName, count(Enrollments.CourseId)
from Students left join Enrollments 
on Students.StudentId = Enrollments.StudentId
GROUP BY Students.StudentId, Students.StudentName;

select Courses.CourseId, Courses.CourseName
from Courses left join Enrollments on Courses.CourseId = Enrollments.CourseId
where Enrollments.CourseId is null;

select Students.StudentId, Students.StudentName, Courses.CourseId, Courses.CourseName
from Students join Enrollments on Students.StudentId = Enrollments.StudentId
join Courses on Enrollments.CourseId = Courses.CourseId
order by Students.StudentName asc , Courses.CourseName asc ;

select Students.StudentId, Students.StudentName, Students.StudentAge, Courses.CourseId, Courses.CourseName
from Students left join Enrollments on Students.StudentId = Enrollments.StudentId
left join Courses on Enrollments.CourseId = Courses.CourseId;

select Students.StudentId, Students.StudentName, Students.StudentAge, Courses.CourseId, Courses.CourseName from Students
left join Enrollments on Students.StudentId = Enrollments.StudentId
left join Courses on Enrollments.CourseId = Courses.CourseId
order by Students.StudentName asc, Students.StudentAge desc;

select Courses.CourseId, Courses.CourseName, count(Enrollments.StudentId) from Courses
left join Enrollments on Courses.CourseId = Enrollments.CourseId
group by Courses.CourseId, Courses.CourseName;








