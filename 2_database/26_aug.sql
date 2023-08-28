show databases;
create database if not exists ml_morning;

show warnings;

use ml_morning;

drop table if exists test1;
create table if not exists test1(
	id int,
    name varchar(20)
);
	
show tables;

desc test1;

insert into test1 values (1,"aaa");
insert into test1 values (2,"bbb");
insert into test1 (name,id) values ("ccc",3);
insert into test1 (id) values (4);
insert into test1 (name) values ("eee");

select id from test1;
select name from test1;
select id,name from test1;
select * from test1;


create table test2 (
	id int not null,
    name varchar(20)
);

desc test2;

insert into test2 values (1,"aaa");
insert into test2 values (2,"bbb");
insert into test2 (id) values (1);
insert into test2 (name) values ("aaa");

select * from test2;


create table test3(
	id int unique not null,
    fname varchar(20) not null,
    lname varchar(20) default "no value",
    pin int
);

desc test3;
insert into test3 values (1,"a111","a000",101);
insert into test3 values (2,"b111","b000",102);
insert into test3 values
 (3,"c111","c000",103),
 (4,"d111","d000",104),
 (5,"e111","e000",105);

insert into test3 values (2,"f111","f000",106);				-- duplicate not allowed for id 
insert into test3 (fname,lname,pin) values ("f111","f000",106);  -- missing value not allowed for id

insert into test3 (id,fname) values (6,"a111");
insert into test3 (id,fname,lname) values (7,"a111",null);

select * from test3;


create table test4 (
id int unique default 0,
fname varchar(20)
);

desc test4;

insert into test4 values (1,"aaa");
insert into test4 (fname) values ("bbb");
insert into test4 (id,fname) values (null,"ccc");

select * from test4;