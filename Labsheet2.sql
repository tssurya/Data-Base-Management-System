﻿﻿--Roll Number: AM.EN.U4CSE12501
--Name: Surya Seetharaman

--Understand the schema given below.
--Create the tables associated with the schema given below making use of the 6 constraints wherever necessary :
--IMPORTANT: 
-- Programme is Btech, Mtech, MSW, MSc Physics...
-- Branch is equivalent to department name.
-- Pre-reqCCode is the ccode of the prequisite course.
-- A course can be offered to two different batches like S5 CS A, S5 CS B 
-- An instructor can teach many batches and a batch can have many instructors
-- A student can belong/register to any batch
--Student(sid, sname, dept_name,cgpa, state, nationality, advisor_id)
--Department (dept_name, location, budget)
--Instructor( Iid, Iname, dep_name, salary)
--Course (ccode, ctitle, credits, semester, exam_slot, programme, branch)
--Pre-requisite (ccode, pre-reqCCode)
--Batch (batchid, ccode, semester, year, building, room_no, time_slot_id)
--ClassRoom(building, roomno, capacity)
--TimeSlot (time_slot_id, day, start_time, end_time)
--Teach (InstructorID,batchid,ccode,semester,year)
--Register (sid, batchid,ccode,semester,year, grade)

--solution

Create table students
(
	sid Varchar(20) primary key,
	sname Varchar(20),
	dept_name Varchar(3) references Departments(dept_name), 
	cgpa dec(4,2), 
	state Varchar(20), 
	nationality Varchar(15),
	advisor_id  int references Instructors(Iid)
);

insert into students values
(
	'u4cse12001','Edward Cullen','CS',8.60,'Tel Aviv','Israeli',3000
);
insert into students values
(
	'u4cse12002','Harry Potter','CS',7.33,'Jerusalem','Israeli',3001
);
insert into students values
(
	'p4mec12003','Hermoine Granger','ME',10.00,'Karnataka','Indian',3002
);
insert into students values
(
	'p4mec12004','Ronald Weasley','ME',8.98,'Maharashtra','Indian',3002
);
insert into students values
(
	'u4cse12005','Isabella Swan','CS',8.00,'Eilat','Israeli',3000
);
insert into students values
(
	'p4mec12006','Tom Cruise','ME',9.05,'Ashkelon','Israeli',3003
);
insert into students values
(
	'u4cse12007','Ethan Hunt','CS',5.00,'Netanya','Israeli',3001
);
insert into students values
(
	'p4mec12008','Angelina Jolie','ME',8.64,'Tamil Nadu','Indian',3003
);
insert into students values
(
	'u4cse12009','Alice Raichand','CS',6.66,'Gujaat','Indian',3000
);
insert into students values
(
	'u4cse12010','Surya Seetharaman','CS',9.31,'Kerala','Indian',3001
);

select * from students;

create table Departments
(
	dept_name Varchar(2) primary key, 
	location Varchar(15),budget Int
);

select * from Departments;

create table Instructors
(
	Iid int primary key,
	Iname Varchar(20),
	dep_name Varchar(2) references Departments (dept_name), 
	salary int
);

select * from Instructors;

create table Course_details
(
	ccode Varchar(6) primary key, 
	ctitle Varchar (25), 
	credits int, 
	semester Varchar(2),
	exam_slot Char(1),
	programme Varchar(5),
	branch Varchar(2) references Departments (dept_name)
);

create table Prerequisites
(
	ccode Varchar(6) references Course_Details(ccode), 
	prereqccode Varchar(6) references Course_Details(ccode)
);

Create table Batches
(
	batchid Varchar(7)primary key,
	ccode Varchar(6) references Course_details(ccode),
	semester Varchar(2),
	year Varchar(10),
	building Varchar(25),
	room_no int ,
	foreign key(building,room_no) references classroom_details,
	time_slot_id int references timeslots (time_slot_id)
);

create table classroom_details
(
	building Varchar(25) ,
	roomno int,
	capacity int,
	primary key(building,roomno)
);

create table timeslots 
(
	time_slot_id int primary key , 
	day Varchar(25), 
	start_time time,
	end_time time
);

create table teachs
(
	Instructorid int references Instructors(Iid),
	batchid Varchar(7) references batches(batchid),
	ccode Varchar(6) references Course_details(ccode),
	semester Varchar(2), 
	year Varchar(20) 
);

create table registers
(
	sid Varchar (10) references students(sid),
	batchid Varchar(7) references batches(batchid), 
	ccode Varchar(6) references Course_details(ccode),
	semester Varchar(2) , 
	year int , 
	grade Varchar(2)
);

-- solution for question a) Find the students whose name starts with 'A' or 'C'.

select * from students where sname like 'A%' or sname like 'C%' ;

--solution for question b) Find the advisor_ids who advise students of CS department.

select distinct advisor_id from students where dept_name='CS' ;

--solution for question c) Find the number of advisors in each department.

select dept_name,count(distinct advisor_id) from students group by dept_name;

--solution for question d) Find the number of advisors for those departments with more than two advisors.

select dept_name,count(distinct advisor_id) from student  group by dept_name having count(distinct advisor_id) > 2;

--solution for question e)  Display the student details sorted by name and state together.

select * from students order by sname,state;

--solution for question f) Display the student details sorted by name alone.

select * from students order by sname;

--solution for question g)  Find the students coming from kerala and with a cgpa > 8.

select * from students where state='Kerala' and cgpa > 8;

--solution for question h)  Find the students coming from Kerala or with a cgpa > 8.

select * from students where state='Kerala' or cgpa > 8;

--solution for question i)  Find the students with a CGPA between 5 and 8.

select * from students where cgpa between 5 and 8;

--solution for question j) Find the students coming from Kerala, Andhra and Tamil Nadu. (Use IN)

select * from students where state in ('Kerala','Tamil Nadu', 'Andhra');

