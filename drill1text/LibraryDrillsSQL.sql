
create database db_librarydrill
use db_librarydrill

/* create tables */

create table Lib_Branch (
	BranchID int primary key NOT NULL identity (1,1),
	BranchName varchar(50) NOT NULL,
	address varchar(50) NOT NULL
);

insert into Lib_Branch
	(BranchName, address)
	values
	('Sharpestown', '123 Elm St'),
	('Central', '234 Maple Ln'),
	('Uptown', '345 Cedar Ave'),
	('Downtown', 'Cherry Grove')
;

create table Publisher (
	PublisherName varchar(50) primary key NOT NULL,
	address varchar(50) NOT NULL,
	Phone varchar(50) NOT NULL
);

insert into Publisher
	(PublisherName, Address, Phone)
	values
	('Midwest Books', 'Ohio', '555-555-5555'),
	('Arcade Publishing', 'New York', '888-123-4567'),
	('Chronicle Books', 'San Fransico', '123-456-7890'),
	('Emerald City Books', 'Seattle', '800-555-1212')
;

create table Books (
	BookID int primary key NOT NULL identity (1100,1),
	Title varchar(75) NOT NULL,
	PublisherName varchar(50) NOT NULL 
);

insert into Books
	(Title, PublisherName)
	values
	
	('IT', 'Midwest Books'),
	('The Lost Tribe', 'Arcade Publishing'),
	('All Passion Spent', 'Arcade Publishing'),
	('Behold the Man', 'Midwest Books'),
	('Blithe Spirit', 'Chronicle Books'),
	('As I Lay Dying', 'Midwest Books'),
	('Brandy of the Damned', 'Chronicle Books'),
	('Cabbages and Kings', 'Arcade Publishing'),
	('A Catskill Eagle', 'Chronicle Books'),
	('The Children of Men	', 'Midwest Books'),
	('The Doors of Perception', 'Midwest Books'),
	('Dying of the Light', 'Chronicle Books'),
	('East of Eden', 'Arcade Publishing'),
	('Endless Night', 'Emerald City Books'),
	('Specimen Days', 'Arcade Publishing'),
	('The Last Enemy', 'Emerald City Books'),
	('Recalled to Life', 'Chronicle Books'),
	('The Sun Also Rises', 'Arcade Publishing'),
	('Gone with the Wind', 'Midwest Books'),
	('Stranger in a Strange Land', 'Chronicle Books'),
	('Tender Is the Night', 'Emerald City Books'),
	('Night Court', 'Midwest Books'),
	('In Death Ground', 'Emerald City Books'),
	('Tiger! Tiger!', 'Arcade Publishing'),
	('From Here to Eternity', 'Emerald City Books'),
	('The Waste Land', 'Chronicle Books'),
	('Vanity Fair', 'Midwest Books'),
	('The Way Through the Woods', 'Chronicle Books'),
	('A Time of Gifts', 'Arcade Publishing'),
	('The Torment of Others', 'Chronicle Books'),
	('That Hideous Strength', 'Midwest Books'),
	('Surprised by Joy', 'Emerald City Books'),
	('The Glory and the Dream', 'Emerald City Books'),
	('The Wives of Bath', 'Arcade Publishing'),
	('The World, the Flesh and the Devil', 'Emerald City Books'),
	('The Painted Veil', 'Midwest Books'),
	('The Needles Eye', 'Emerald City Books'),
	('The House of Mirth', 'Chronicle Books'),
	('The Moon by Night', 'Arcade Publishing'),
	('A Farewell to Arms', 'Midwest Books')
;

create table Borrower (
	CardNo int primary key not null identity (1000,100),
	name varchar(50) not null,
	address varchar(50) not null,
	Phone varchar(20) not null
);

insert into Borrower 
	(name, address, Phone)
	values
	('Anthony Powell', '123 A Street', '123-111-2222'),
	('Mary Stewart', '2345 Beehive', '987-999-8888'),
	('Henry James', '34 Canturbury Ct.', '456-852-8520'),
	('Susan Swan', '4567 Dingo Dr', '741-963-0258'),
	('Connie Willis', '567 E. Easton', '369-258-0147'),
	('John Steinbeck', '678 Franklin Ave', '024-321-3210'),
	('Bruce Catton', '1000 Gorge', '1179-931-7931'),
	('George Orwell', '2244 Highland Ave', '397-842-8426'),
	('Stephen Fry', '333 Illinois Ave', '264-846-5588'),
	('Isaac Asimov', '12345 Jackson St', '379-197-1973')
;


create table Book_Copies (
	BookID int not null constraint fk_BookID foreign key references Books(BookID),
	BranchID int not null constraint fk_BranchID foreign key references Lib_Branch(BranchID),
	NoOfCopies int not null
);

insert into Book_Copies
	(BookID, BranchID, NoOfCopies)
	values
	(1100, 2, 3),
	(1101, 1, 4),
	(1102, 2, 3),
	(1103, 2, 4),
	(1104, 1, 4),
	(1105, 1, 3),
	(1106, 3, 4),
	(1107, 3, 3),
	(1108, 4, 4),
	(1109, 4, 2),
	(1110, 2, 3),
	(1111, 2, 2),
	(1112, 1, 4),
	(1113, 1, 4),
	(1114, 3, 2),
	(1115, 3, 2),
	(1116, 3, 3),
	(1117, 4, 2),
	(1118, 4, 4),
	(1119, 4, 3),
	(1120, 2, 4),
	(1121, 2, 2),
	(1122, 1, 5),
	(1123, 1, 2),
	(1124, 1, 4),
	(1125, 3, 2),
	(1126, 3, 3),
	(1127, 3, 2),
	(1128, 4, 4),
	(1129, 4, 2),
	(1130, 2, 3),
	(1131, 2, 2),
	(1132, 1, 4),
	(1133, 1, 2),
	(1134, 1, 5),
	(1135, 3, 2),
	(1136, 3, 3),
	(1137, 4, 5),
	(1138, 4, 2),
	(1139, 4, 4)
;

create table Book_Loans (
	BookID int not null constraint fk_BookIDL foreign key references Books(BookID),
	BranchID int not null constraint fk_BranchIDL foreign key references Lib_Branch(BranchID),
	CardNo int not null constraint fk_CardNo foreign key references Borrower(CardNo),
	DateOut date not null,
	DateDue date not null
);

insert into Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	values
	
	(1102, 1, 1100, '2019-03-24', '2019-05-12'),
	(1105, 1, 1100, '2019-03-24', '2019-05-12'),
	(1112, 1, 1200, '2019-03-23', '2019-05-12'),
	(1113, 1, 1200, '2019-03-23', '2019-05-30'),
	(1122, 1, 1200, '2019-03-23', '2019-05-30'),
	(1123, 1, 1200, '2019-03-23', '2019-05-30'),
	(1124, 1, 1200, '2019-03-23', '2019-05-30'),
	(1132, 1, 1200, '2019-03-23', '2019-05-30'),
	(1133, 1, 1200, '2019-03-22', '2019-05-29'),
	(1134, 1, 1200, '2019-03-22', '2019-05-29'),
	(1122, 1, 1200, '2019-03-22', '2019-05-29'),
	(1105, 1, 1200, '2019-03-22', '2019-05-29'),
	(1100, 2, 1000, '2019-03-25', '2019-05-10'),
	(1101, 2, 1000, '2019-03-25', '2019-05-10'),
	(1103, 2, 1000, '2019-03-25', '2019-05-10'),
	(1104, 2, 1000, '2019-03-25', '2019-05-10'),
	(1110, 2, 1000, '2019-03-25', '2019-05-10'),
	(1111, 2, 1000, '2019-03-25', '2019-05-10'),
	(1120, 2, 1000, '2019-03-25', '2019-05-10'),
	(1121, 2, 1100, '2019-03-24', '2019-05-12'),
	(1130, 2, 1100, '2019-03-24', '2019-05-12'),
	(1131, 2, 1100, '2019-03-24', '2019-05-12'),
	(1100, 2, 1100, '2019-03-24', '2019-05-12'),
	(1103, 2, 1100, '2019-03-24', '2019-05-12'),
	(1106, 3, 1200, '2019-03-22', '2019-05-29'),
	(1107, 3, 1200, '2019-03-22', '2019-05-29'),
	(1114, 3, 1300, '2019-03-21', '2019-05-28'),
	(1115, 3, 1300, '2019-03-21', '2019-05-28'),
	(1116, 3, 1300, '2019-03-21', '2019-05-28'),
	(1125, 3, 1300, '2019-03-21', '2019-05-28'),
	(1126, 3, 1300, '2019-03-21', '2019-05-28'),
	(1127, 3, 1300, '2019-03-21', '2019-05-28'),
	(1135, 3, 1300, '2019-03-20', '2019-05-27'),
	(1136, 3, 1300, '2019-03-20', '2019-05-27'),
	(1114, 3, 1300, '2019-03-20', '2019-05-27'),
	(1107, 3, 1300, '2019-03-20', '2019-05-27'),
	(1108, 4, 1300, '2019-03-20', '2019-05-27'),
	(1109, 4, 1300, '2019-03-20', '2019-05-27'),
	(1117, 4, 1400, '2019-03-19', '2019-05-26'),
	(1118, 4, 1400, '2019-03-19', '2019-05-26'),
	(1119, 4, 1400, '2019-03-19', '2019-05-26'),
	(1128, 4, 1400, '2019-03-19', '2019-05-26'),
	(1129, 4, 1400, '2019-03-19', '2019-05-26'),
	(1137, 4, 1400, '2019-03-19', '2019-05-26'),
	(1138, 4, 1500, '2019-03-18', '2019-05-25'),
	(1139, 4, 1500, '2019-03-18', '2019-05-25'),
	(1117, 4, 1500, '2019-03-18', '2019-05-25'),
	(1118, 4, 1500, '2019-03-18', '2019-05-25'),
	(1108, 4, 1500, '2019-03-18', '2019-05-25'),
	(1109, 4, 1500, '2019-03-18', '2019-05-25')
;

create table Book_Authors (
	BookID int not null constraint fk_BookIDT foreign key references Books(BookID),
	AuthorName varchar(50) not null
);

insert into Book_Authors
	(BookID, AuthorName)
	values
	(1100,'Stephen King'),
	(1101,'Stephen King'),
	(1102,'Ricky Bobby'),
	(1103,'Ricky Bobby'),
	(1104,'Ricky Bobby'),
	(1105,'Joan Jett'),
	(1106,'Joan Jett'),
	(1107,'Joan Jett'),
	(1108,'Joan Jett'),
	(1109,'Joan Jett'),
	(1110,'Joshua Jones'),
	(1111,'Joshua Jones'),
	(1112,'Joshua Jones'),
	(1113,'Joshua Jones'),
	(1114,'Joshua Jones'),
	(1115,'Mike Jackson'),
	(1116,'Mike Jackson'),
	(1117,'Mike Jackson'),
	(1118,'Mike Jackson'),
	(1119,'Mike Jackson'),
	(1120,'Paul Simon'),
	(1121,'Paul Simon'),
	(1122,'Paul Simon'),
	(1123,'Paul Simon'),
	(1124,'Paul Simon'),
	(1125,'Paul Simon'),
	(1126,'Mary Jane'),
	(1127,'Mary Jane'),
	(1128,'Mary Jane'),
	(1129,'Mary Jane'),
	(1130,'Mary Jane'),
	(1131,'Don Osmond'),
	(1132,'Don Osmond'),
	(1133,'Don Osmond'),
	(1134,'Don Osmond'),
	(1135,'J Ceasar'),
	(1136,'J Ceasar'),
	(1137,'J Ceasar'),
	(1138,'Chris Cross'),
	(1139,'Chris Cross')
;

select * from Lib_Branch
go
	/* create procedures */
	 /* PROCEDURE 1 */

create procedure  CountLostTribe
as
select NoOfCopies from Book_Copies 
	where BookID = 1101 and BranchID = 1
go
drop  procedure CountLostTribe
CountLostTribe

	 /* PROCEDURE 2 */

 create procedure  LostTribePerBranch
 as
 select NoOfCopies, BranchID 
 from Book_Copies
 where BookID = 1102

LostTribePerBranch

	/* PROCEDURE 3 */

create procedure NoCheckedOut
as
select name
from Borrower
where CardNo not in (select CardNo from Book_loans)
go
NoCheckedOut

	 /* PROCEDURE 4 */

create procedure  StownDueToday
 as
select a1.Title, a2.name, a2.address
from Books a1, Borrower a2, Book_Loans a3, Lib_Branch a4
where a4.BranchName='Sharpestown' and a4.BranchId=a3.BranchId and
a3.DateDue='2019-05-29' and a3.CardNo=a2.CardNo and a3.BookId=a1.BookId;
StownDueToday
drop procedure stownduetoday

	/*PROCEDURE 5 */

create procedure BranchLoaned
as
select L.BranchName, count(*)
from Lib_Branch L, book_loans BL
where BL.BranchId = L.BranchId
group by L.BranchName;
BranchLoaned


	 /* PROCEDURE 6 */

create procedure FiveBooks
as
select a1.Name, a1.Address, count(*)
from borrower a1, BOOK_LOANS a2
where a1.CardNo = a2.CardNo
group by a1.CardNo, a1.name, a1.address
having count(*) > 5;
FiveBooks

	/* PROCEDURE 7 */

create procedure SKingAtCentral
as
select distinct a1.Title, a2.NoOfCopies
from Books a1
inner join Book_Copies a2 on a1.BookID = a2.BookID
inner join Book_Authors a3 on a1.BookID = a3.BookID
inner join Book_Loans a4 on a1.BookID = a4.BookID
inner join Lib_Branch a5 on a4.BranchID = a5.BranchID
where
a3.AuthorName = 'Stephen King'
and
a4.BranchID = 2
SKingAtCentral

	/* Select*/

select * from  Lib_Branch
select * from  Book_Copies
select * from  Book_Loans
select * from  Borrower
select * from  Publisher
select * from  Books
select * from  Book_Authors

	/* procedures  */

CountLostTribe
LostTribePerBranch
SKingAtCentral
NoCheckedOut
StownDueToday
branchLoaned
FiveBooks
