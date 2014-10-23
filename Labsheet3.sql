--Roll Number: AM.EN.U4CSE12501
--Name: Surya Seetharaman

--Using the tables created and populated from Asignment 2, do the folowing queries:

Create table temp
(
    sid Varchar(20) primary key,
    sname Varchar(20),
    dept_name Varchar(3) references Departments(dept_name), 
    cgpa float, state Varchar(20), 
    nationality Varchar(15),
    advisor_id  int references Instructors(Iid)
);

insert into temp values
(
	'u4cse12001','Edward Cullen','CS',8.60,'Tel Aviv','Israeli',3000
);
insert into temp values
(
	'u4cse12002','Harry Potter','CS',7.33,'Jerusalem','Israeli',3001
);
insert into temp values
(
	'p4mec12003','Hermoine Granger', 'ME', 10.00, 'Karnataka', 'Indian', 3002
);
insert into temp values
(
	'p4mec12004','Ronald Weasley','ME',8.98,'Maharashtra','Indian',3002
);
insert into temp values
(
	'u4cse12005','Isabella Swan','CS',8.00,'Eilat','Israeli',3000
);
insert into temp values
(
	'p4mec12006','Tom Cruise','ME',9.05,'Ashkelon','Israeli',3003
);
insert into temp values
(
	'u4cse12007','Ethan Hunt','CS',5.00,'Netanya','Israeli',3001
);
insert into temp values
(
	'p4mec12008','Angelina Jolie','ME',8.64,'Tamil Nadu','Indian',3003
);
insert into temp values
(
	'u4cse12009','Alice Raichand','CS',6.66,'Gujaat','Indian',3000
);

insert into temp values
(
	'u4cse12010','Surya Seetharaman','CS',9.31,'Kerala','Indian',3001
);

select * from temp;


create table course1
(
 ccode Varchar(6) primary key, 
 ctitle Varchar (25), credits int, 
 semester Varchar(2)
);

insert into course1 values('CSE340','DBMS',4,'S5');
insert into course1 values('CSE200','DS',4,'S4');
insert into course1 values('CSE100','OOPS',3,'S3');
insert into course1 values('CSE330','OS',2,'S6');
insert into course1 values('CSE320','ALGO',4,'S5');
insert into course1 values('CSE310','SICP',4,'S3');
insert into course1 values('CSE400','software engineering',2,'S1');

select * from course1;


create table Departments
(
 dept_name Varchar(2) primary key, 
 location Varchar(15),
 budget Int
);

--entered values manually.

create table Instructors
(
 Iid int primary key,
 Iname Varchar(20),
 dep_name Varchar(2) references Departments (dept_name), 
 salary int
);

--entered values manually

Create table Batch_details
(
	batchid Varchar(7)primary key,
	ccode Varchar(6) references course1(ccode),
	semester Varchar(2),
	year Varchar(4),
	room_no Varchar(4),
	time_slot_id int references timeslots (time_slot_id)
);
--entered values manually

create table teach_details
(
	Iid int references Instructors(Iid),
	batchid Varchar(7) references batch_details(batchid),
	ccode Varchar(6) references Course1(ccode),
	semester Varchar(2) , 
	primary key(Iid,ccode,semester),
	year Varchar(20) 
);
--entered manually

create table timeslots 
(
	time_slot_id int primary key , 
	day Varchar(25), 
	start_time time,end_time time
);
--entered values manually.

create table registration_details
(
	sid Varchar (10) references students(sid),
	batchid Varchar(7) references batch_details(batchid), 
	ccode Varchar(6) references course1(ccode),
	semester Varchar(2) , 
	primary key(sid,ccode,semester),
	year int , 
	grade Varchar(2)
);

--entered values manually

create table Prerequisites1
(
	ccode Varchar(6) references Course1(ccode), 
	prereqccode Varchar(6) references Course1(ccode),
	primary key(ccode,prereqccode)
);

--entered values manually

1. Use truncate and delete to remove the student data. What are the notable differences between truncate, delete and drop commands of SQL?

--solution for question 1.
truncate table temp;
--TRUNCATE COMMAND:-
--The truncate command hence deletes the whole structure and recreates it. 
--That is, it deletes the contents of the table but retains the structure.
--It is a DDL command.
delete from temp;
--DELETE COMMAND:-
--The delete command also deletes the contents of the table ,  sequentially row by row or full table.
--We can give conditions for the deletion of a particular row.
--That is, it deletes the contents of the table but retains the structure.
--It is a DML command.
drop table temp;
--DROP COMMAND:-
-- It deletes the whole structure including the contents of the structure.
--That is, it deletes the contents of the table and it doesn't retain the structure.
--It is a DDL command.

2. Write down the differences between the different data types you have used.
--solution for question 2.
CHAR<SIZE>
-> This data type helps us create a sequence of characters/strings of size <SIZE>.
-> The values inserted into this data type should be included in quotes.
-> if size is not mentioned the default size is taken as one.

VARCHAR<SIZE>
-> This is also used to declare strings .
-> The difference of this from CHAR<SIZE> is that , a field of CHAR type always allocates ,
memory storage for the maximum number of characters that can be stored in thhe field while,
-> a VARCHAR field will alocate only enough memory to store the actual size of VARCHAR 
field which is implementor defined and can vary between 254  to 2048 characters.

INT
-> This data type is used to store all integer type values and it does not have any arguments.
-> The size is automatically set to a value depending on the computer.


FLOAT
-> This data type is used to store decimal point values like cgpa.

DATE
-> This is a special kind of data type used to store datalike date of birth,date of admission etc.
-> The format we use is the IBM USA Standard mm/dd/yyyy.

TIME
->This is a special kind of data type used to store time. We use the hh.mm AM/PM format.(IBM USA Standard).

3. Retrieve the name of the courses that has 'systems' or 'software' appearing anywhere in
their names irrespective of the lower or upper case. (String operation)

--solution for question 3.
select ctitle from course1 where ctitle ilike '%systems%' or ctitle ilike '%software%';

4. Display the details of the courses with following two headers (String concatenation)
CourseCode:CourseTitle

--solution for question 4. 
select ccode || ':' || ctitle as "CourseCode:CourseTitle" , credits as "Credits"  from course1 ;

5. Find the number of instructors for each course for different batches in a semester and 
year. 

--solution for question five
SELECT  batchid,semester,year1 ,count(distinct instructorid) from Teach group by batchid , semester ,year1 ;

6. Find the number of departments located in the first floor.

--Solution for question 6.
select count(distinct dept_name) from Departments where location = 'First floor';

7.Find the average salary of instructors of each department.

--Solution for question7.
select dep_name,AVG(salary) from instructors group by dep_name;

8. Find the average salary and the name of each department if the average salary is more
than Rs. 15000.

--solution for question 8.
select dep_name,AVG(salary) from instructors group by dep_name having AVG(salary) > 15000;

9. Display the student details sorted by name in the descending order.

--solution for question 9.
select * from temp order by sname desc;

10.  Alter and add a column join date to the instructor table.

--solution for question 10.
alter table instructors add column join_date Date; 

11.  Find the employees who joined after '01/Jan/2002'

--solution to question 11.
select * from Instructors where join_date > '01/Jan/2002';

12. Find the name of the students and the name of the courses he/she has registered for. 

--solution of question 12.
select sname,ctitle from temp t,course1 c,registration_details r where r.sid=t.sid and c.ccode=r.ccode;

13. Find the name of the instructors and the name of the courses they teach for 5th 
semester CS-A batch students. 

--solution for question 13.
select iname,ctitle from instructors i,course1 c ,teach_details t,batch_details b where b.batchid = 'S5CSEA' and b.semester='S5' and t.batchid=b.batchid and i.Iid=t.Iid and t.ccode=c.ccode;

14. Find the name of the instructors from the CS department and the name of the courses 
they teach for 5th semester CS-A batch students. 

--solution for question 14.
select iname,ctitle from instructors i,course1 c ,teach_details t,batch_details b where i.dep_name='CS' and b.batchid = 'S5CSEA' and b.semester='S5' and t.batchid=b.batchid and i.Iid=t.Iid and t.ccode=c.ccode; 

15. Display the name of the course and the name of the pre-requisite course. 

--solution for question 15.
select a.ctitle,b.ctitle from course1 a,course1 b,Prerequisites1 p where a.ccode=p.ccode and b.ccode = p.prereqccode;

16. Find the number of rooms that are engaged on '11/Aug/2014' from 8:30 to 9:30 A.M. 

--solution for question 16.
select count(room_no) from Batch_details, TimeSlots where TimeSlots.time_slot_id =Batch_details.time_slot_id  and TimeSlots.start_time =8:30 and TimeSlot.end_time =9:30 and TimeSlots.day ='2014/08/11'; 
