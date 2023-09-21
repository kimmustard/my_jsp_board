
//Board DB

create table board(
bno int not null auto_increment,
title varchar(200) not null,
writer varchar(100) not null,
content text,
regdate datetime default now(),
moddate datetime default now(),
readcount int default 0,
image_File varchar(500),
primary key(bno));
// 추천수 추가 테이블
alter table  board add recommend int default 0;



//Member DB
create table member(
id varchar(100),
pwd varchar(100) not null,
email varchar(100) not null,
age int default 0,
introduce text,
profile varchar(500),
regdate datetime default now(),
lastlogin datetime default now(),
primary key(id));
// 자기소개, 프로필사진 경로 추가