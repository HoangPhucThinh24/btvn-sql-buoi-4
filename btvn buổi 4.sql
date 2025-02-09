create database LibraryManagement;
use LibraryManagement;

create table Authors (
AuthorID int primary key auto_increment,
AuthorName varchar(100) not null
);

create table Books(
BookID int primary key auto_increment,
Title varchar(200) not null,
AuthorID int , 
PublishedYear year not null,
foreign key (AuthorID) references Authors(AuthorID)
);

create table Members(
MemberID int primary key auto_increment,
MemberName varchar(100) not null,
JoinDate date not null
);

create table Loans(
LoanID int primary key auto_increment,
BookID int,
MemberID int,
LoanDate date not null,
ReturnDate date,
foreign key (BookID) references Books(BookID),
foreign key (MemberID) references Members(MemberID)
);

insert into Authors (AuthorName) values
('xanh'),
('đỏ'),
('tím'),
('vàng'),
('đen');

insert into Books (Title, AuthorID, PublishedYear) values
('xanh', 1, 2009),
('đỏ', 2, 2010),
('tím', 3, 2011),
('vàng', 4, 2012),
('đen', 5, 2013);

insert into Members (MemberName, JoinDate) values
('Bố', '2018-01-01'),
('Mẹ', '2019-01-01'),
('Anh', '2020-01-01'),
('Chị', '2021-01-01'),
('Em', '2022-01-01');

insert into Loans (BookID, MemberID, LoanDate, ReturnDate) values
(1, 1, '2023-01-01', '2023-01-01'),
(2, 2, '2023-01-01',null),
(3, 3, '2023-01-01', '2023-01-01'),
(4, 4, '2023-01-01',null),
(5, 5, '2023-01-01', '2023-01-01');

select Books.BookID , Books.Title , Authors.AuthorName , Books.PublishedYear
from Books join Authors on Books.AuthorID = Authors.AuthorID
where Books.PublishedYear > 2010;

select Members.MemberID , Members.MemberName , count(Loans.BookID)
from Members left join Loans on Members.MemberID = Loans.MemberID 
group by Members.MemberID , Members.MemberName;

select Members.MemberID , Members.MemberName , count(Loans.BookID)
from Members inner join Loans on Members.MemberID = Loans.MemberID 
group by Members.MemberID , Members.MemberName;

select Members.MemberName , count(Loans.BookID) from Members inner join Loans
on Members.MemberID = Loans.MemberID group by Members.MemberID , Members.MemberName
having count(Loans.BookID) > 2;

select min(PublishedYear) from Books;

select * from members 
where joindate between '2020-01-01' and '2022-12-31';

select AuthorID, AuthorName from Authors where AuthorName like '%a%';

select distinct PublishedYear from Books order by PublishedYear;


