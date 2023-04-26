drop table SC;
drop table Course;
drop table Student;

CREATE TABLE Student
(
    Sno    varchar2(17) primary key,
    Sname  varchar2(10) not null,
    Sage   integer,
    Ssex   char(4),
    Sdept  varchar2(20)
);

CREATE TABLE Course
(
    Cno varchar2(5) primary key,
    Cname varchar2(20) not null,
    Cpno varchar2(5),
    Ccredit integer
);

create table SC
(
    Sno varchar2(17) not null,
    Cno varchar2(5) not null,
    Grade numeric(5, 2),
    primary key (Sno, Cno),
    foreign key (Sno) references Student(Sno),
    foreign key (Cno) references Course(Cno)
);

insert into Student (Sno, Sname, Sage, Ssex, Sdept)
values ('S0001', '张三', 19, '男', 'A学院');
insert into Student (Sno, Sname, Sage, Ssex, Sdept)
values ('S0002', '李四', 19, '女', 'B学院');
insert into Student (Sno, Sname, Sage, Ssex, Sdept)
values ('S0003', '王五', 19, '男', 'C学院');

insert into Course (Cno, Cname, Cpno, Ccredit)
values ('C0001', '高等数学', null, 2);
insert into Course (Cno, Cname, Cpno, Ccredit)
values ('C0002', '概率论', 'C0001', 2);
insert into Course (Cno, Cname, Cpno, Ccredit)
values ('C0003', '数理统计', 'C0001', 2);

insert into SC (Sno, Cno, Grade)
values ('S0001', 'C0001', 98);
insert into SC (Sno, Cno, Grade)
values ('S0001', 'C0002', 88);
insert into SC (Sno, Cno, Grade)
values ('S0001', 'C0003', 78);

alter table Student add Senrollment date;

alter table Student add check ( Ssex in ('男', '女') );

alter table Course add Cdesc varchar2(200);

alter table Course modify Cdesc varchar2(500);

alter table Course drop column Cdesc;

alter table Course add foreign key (Cpno) references Course (Cno)
