--Roll Number: AM.EN.U4CSE12501
--Name: Surya Seetharaman

create table student
(
	Stud_id Varchar(15) primary key,
	Name Varchar(20),
	DoB Date,
	Gender Char(1), 
	Pincode Int, 
	State Varchar(15),
	Mobile_no Varchar(10)
);

-- question a) use the following command to insert rows into table.

insert into student values
(
	'u4cse12001','Edward Cullen','05/05/1994','M',680002,'Tel Aviv',9400481062
);

insert into student values
(
	'u4cse12002','Harry Potter','03/21/1994','M',680212,'Jerusalem',8893531062
);

insert into student values
(
	'u4cse12003','Hermoine Granger','01/02/1994','F',680959,'Haifa',9388031062
);

insert into student values
(
	'u4cse12004','Ronald Weasley','09/11/1995','M',684035,'Neve Tzedek',9447731062
);

insert into studlent values
(
	'u4cse12005','Isabella Swan','06/14/1995','F',680900,'Eilat',9846131462
);

insert into student values
(
	'u4cse12006','Tom Cruise','02/28/1994','M',672525,'Ashkelon',9388031062
);

insert into student values
(
	'u4cse12007','Ethan Hunt','08/08/1994','M',650342,'Netanya',8289883090
);

insert into student values
(
	'u4cse12008','Angelina Jolie','10/02/1995','F',680009,'Kiryat',9876543210
);

insert into student values
(
	'u4cse12009','Alice Raichand','04/05/1995','F',687950,'New York',8894567843
);

insert into student values
(
	'u4cse12010','Surya Seetharaman','05/05/1994','F',675354,'Thrissur',9835642105
);

--question b) to retrieve the entire contents of student table , use the following command.

select * from student;

create table Courses
(
	Course_Code Varchar(6) primary key,
	Course_Title Varchar(15),
	Credits Int,
	Semester Int,
	ExamSlot Char(1),
	Programme Varchar(15),
	Branch Char(3)
);

insert into Courses values
(
	'CSE100','C-Programming',4,1,'A','B-TECH','CSE'
);

insert into Courses values
(
	'CSE150','C++-Programming',4,2,'B','B-TECH','CSE'
);

insert into Courses values
(
	'ECE210','EmbeddedSystems',4,3,'A','B-TECH','ECE'
);

insert into Courses values
(
	'MEC300','Machine Drawing',3,4,'B','B-TECH','MEC'
);

insert into Courses values
(	
	'CSE225','DBMS',4,5,'C','B-TECH','CSE'
);

insert into Courses values 
(
	'AER100','Aerospace',2,4,'A','B-TECH','AER'
);

insert into Courses values 
(	
	'MAT200','Algebra',4,5,'B','B-TECH','MAT'
);

insert into Courses values 
(
	'CSE210','Algorithms',4,5,'C','B-TECH','CSE'
);

insert into Courses values 
(
	'ENG300','Literature',3,3,'D','BA-ENG','BAE'
);

insert into Courses values 
(
	'CUL190','CulturalValues',2,1,'A','B-TECH','CSE'
);

select * from Courses;

delete from Courses where Course_Title='Circuits';

create table Registration
(
	Sid Varchar(15),
	Cid Varchar(6),
	references(student(Stud_id),Courses(Course_Code)
);

insert into Registration values
(
	'u4cse12010','CSE100'
);

insert into Registration values
(
	'u4cse12002','CSE340'
);

insert into Registration values
(
	'u4cse12004','AER100'
);

insert into Registration values
(
	'u4cse12008','CSE210'
);

insert into Registration values
(
	'u4cse12006','ENG300'
);

insert into Registration values
(
	'u4cse12005','CUL190'
);

insert into Registration values
(
	'u4cse12010','CSE340'
);

insert into Registration values
(
	'u4cse12007','CSE210'
);

insert into Registration values
(
	'u4cse12004','MEC300'
);

insert into Registration values
(
	'u4cse12003','ECE210'
);

select * from Registration;

-- question c) use the following command to list the various courses offered fro BTECH 5th semester.

Select Course_Title from Courses where Programme='B-TECH' AND Semester=5;

--question d) use the following command to find out the student ids of those registered for CSE340.

Select Sid from Registration where Cid='CSE340';

--question e) use the following command to change the credits of a particular course.

Update Courses set Credits=5 where Course_Title='DBMS';

--question f) use the following command to delete from courses those courses with less than 3 credits.

delete from Courses where Credits < 3;

--question g) use the following command to alter thet able to add a new column.

alter table Registration add column RegDate Date;

--question h) Use the following command to reset a particular table value.

update Registration set regdate='05/05/2012' where sid='u4cse12004';

--questions i,j) to alter the table giving constraints and practising various commands.

alter table Registration add column Name Varchar(15); 
alter table Registration drop column Name;
alter table Courses add constraint credits_check check(Credits>0);
alter table student alter column Gender set not null;
alter table Registration rename regdate to reg_date;
alter table Registration rename to registrations;
select * from registrations;

--------------------------------------------------------------------------
