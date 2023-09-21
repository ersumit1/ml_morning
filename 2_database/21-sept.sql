show databases;

create database coaching;

use coaching;


create table branch(bid int primary key auto_increment, 
name varchar(50) not null,
area varchar(10),
city varchar(10),
pin int);

desc branch;

create table course (cid int primary key auto_increment,
cname varchar(50) not null unique,
duration int not null,
fee int not null,
precid int,
foreign key (precid) references course(cid)
);

alter table course 
add column course_status varchar(20) not null default "active"; 

alter table course add constraint
 check_course_status check(course_status in ("active"," inactive"));
desc course;

create table trainer(
tid int primary key auto_increment,
tname varchar(20) not null,
experience int not null default 0,
mobile varchar(10) not null unique,
email varchar(30) unique,
salary decimal(7,2) not null default 10000,
qualification varchar(15) not null
);

create table trainer_course(
cid int not null,
tid int not null,
unique(cid,tid),
foreign key (cid) references course(cid),

foreign key (tid) references trainer(tid)
);

desc trainer_course;

create table student(
sid int primary key auto_increment ,
sname varchar(20) not null,
dob date ,
college_name varchar(15),
city varchar(15),
bid int not null,
foreign key (bid) references branch(bid)
);

desc student;

create table student_course(
sid int not null,
cid int not null,
doj date not null,
offer decimal(3,2) check (offer>=0 and offer<=1),
foreign key (sid) references student(sid),

foreign key (cid) references course(cid)
);

desc student_course;

