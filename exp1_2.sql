Declare
    tmp integer default 0;
Begin
    select count(*) into tmp from user_tables where table_name='RB';
    if(tmp>0) then
        execute immediate 'drop table RB';
    end if;
    select count(*) into tmp from user_tables where table_name='READER';
    if(tmp>0) then
        execute immediate 'drop table READER';
    end if;
    select count(*) into tmp from user_tables where table_name='BOOK';
    if(tmp>0) then
        execute immediate 'drop table BOOK';
    end if;
end;

create table Reader
(
    RNO	varchar2(4) primary key,
    Rname	varchar2(10) not null,
    Rsex	varchar2(4),
    Rage	integer,
    Rboss	varchar2(10),
    Raddress	varchar2(30)
) ;
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R001','张三',20,'男','李四','416');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R002','张三',35,'女',null,'417');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R003','李四',30,'男',null,'416');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R004','王五',20,'男',null,'417');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R005','马六',40,'男',null,'416');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R006','刘三',20,'男',null,'417');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R007','王四',40,'男','李四','416');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R008','李小龙',20,'男','李四','417');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R009','王小倩',40,'男','李四','416');
insert into Reader (RNO,Rname,Rage,Rsex,Rboss, Raddress) values('R010','王一小',20,'男','李四','417');

create table Book
(
    BNO	varchar2(4),
    Bname	varchar2(50) not null,
    Bauthor	varchar2(50),
    Bpress	varchar2(50),
    Bprice	numeric(6,2),
    primary key(BNO)
);
insert into book (BNO,Bauthor,Bname, bpress, bprice) values('B001','严蔚敏','数据结构','清华大学出版社',null);
insert into book (BNO,Bauthor,Bname, bpress, bprice) values('B002','唐发根','数据结构','北航出版社',24);
insert into book (BNO,Bauthor,Bname, bpress, bprice) values('B003','王珊','数据库原理','高等教育出版社',40);
insert into book (BNO,Bauthor,Bname, bpress, bprice) values('B004','张飞','数据库原理','清华大学出版社',30);
insert into book (BNO,Bauthor,Bname, bpress, bprice) values('B005','王珊','数据库原理','清华大学出版社',null);

create table RB
(
    RNO varchar2(4),
    BNO varchar2(4),
    RBdate date default sysdate,
    primary key(RNO,BNO),
    foreign key (RNO) references Reader(RNO),
    foreign key (BNO) references Book(BNO)
);
insert into RB (RNO,BNO) values ('R001','B001');
insert into RB (RNO,BNO) values ('R001','B002');
insert into RB (RNO,BNO) values ('R001','B004');
insert into RB (RNO,BNO) values ('R002','B001');
insert into RB (RNO,BNO) values ('R003','B001');
insert into RB (RNO,BNO) values ('R004','B001');
insert into RB (RNO,BNO) values ('R004','B002');
insert into RB (RNO,BNO) values ('R005','B001');
insert into RB (RNO,BNO) values ('R006','B001');
insert into RB (RNO,BNO) values ('R006','B003');
insert into RB (RNO,BNO) values ('R006','B005');
insert into RB (RNO,BNO) values ('R006','B002');
insert into RB (RNO,BNO) values ('R006','B004');