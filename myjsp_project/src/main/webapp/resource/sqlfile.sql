
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

