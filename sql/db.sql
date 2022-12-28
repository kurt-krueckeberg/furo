#--The specific problem with German umlauts is often described as 'dictionary order' or 'phone-book order'. 
#--The Unicode default is okay for the former but if you want 'Ü' = 'UE', then you could consider 
#--utf8mb4_de_pb_0900_ai_ci or utf8mb4_german2_ci, assuming character set is utf8mb4.

CREATE DATABASE IF NOT EXISTS imman CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_german2_ci';

#--Create user and grant privileges to the database:
GRANT ALL PRIVILEGES ON imman.* TO 'kurt'@'localhost' identified by 'kk0457';

use imman;

create table IF NOT EXISTS person (
 id int(11) NOT NULL AUTO_INCREMENT,
 fname varchar(45) not null,
 lname varchar(20) not null,
 sex ENUM('m', 'f', 'u') not null, 
 fid int(11),
 mid int(11),
 bdate date not null,
 founder boolean not null,
 bdorf varchar(15) not null,
 bkreis varchar(20) not null,
 bland varchar(25) not null,
 foreign key (fid) references person(id) on delete set null, 
 foreign key (mid) references person(id) on delete set null,
 primary key(id)
);

#--Insert UNKONWN person into the person table. The unknown person has person(id) of 1, the first auto_increment value, and the fid and mid are also 1, referring this same all-purpose unknown person.
INSERT INTO person (id, fname, lname, sex, fid, mid, bdate, founder, bdorf, bkreis, bland) VALUES (1, "unknown", "unknown", "u", 1, 1, "0000-00-00", false, "unknown", "unknown", "unknown");

#--This tracks Church ceremonies performed on the date, by the pastorid,
#--at the parish.
#--Since mrriage is a joint ceremony that involves two people, we must 
#--create another table participants to link the ceremony's partipants for
#--whom the ceremony occurs to the ceremony. Otherwise, the attributes date,
#--pastor and parish would be duplicated for each individual of the couple being
#--married.
create table IF NOT EXISTS event (
  id int(11) NOT NULL AUTO_INCREMENT,
  edate date not null,
  type ENUM('baptize','confirm','marry', 'birth', 'death') not null,
  foreign key (pastorid) references person(id),
  primary key(id)
);

#--This table associates particpants in a ceremony with the ceremony
#--and it gives their role in the ceremony. It is a 'link' table whose key
#--is two attributes: 1.) the person in the ceremony and 2.) the ceremony
#--in which he or she or they participated.
#--This also includes godparents at a baptism.
create table IF NOT EXISTS sponsors (
  id int(11) NOT NULL, 
  personid int(11) not null,
  baptid int(11) not null,
  foreign key (personid) references person(id),
  foreign key (baptid) references event(id),
  primary key(id, cermid)
);

#--The married couple or 'family` consists of a husband husbid and a wife
#--Their children, if any, are in the children table, whose familyid
#--references family(id).
#--Note:
#-- Emgiration is not a church ceremony, but rather an entire family event (all the family emigrated together in this model).
create table IF NOT EXISTS family (
  id int(11) NOT NULL AUTO_INCREMENT,
  husbid int(11) not null,
  wifeid int(11) not null,
  emigdate date not null,
  unique key (husbid, wifeid),
  foreign key (husbid) references person(id), 
  foreign key (wifeid) references person(id), 
  primary key(id)
);

#--The godprents table's role is performed by the participants table.
#--List of Pathen or Taufpathen at baptism
#--create table if not exist godparent (
#--  id int(11) NOT NULL AUTO_INCREMENT,
#--  baptismid int,
#--  foreign key (baptismid) references ceremony(id),
#--  foreign key (id) references person(id),
#--  primary key(id)
#--);

create table IF NOT EXISTS children (
  id int(11) NOT NULL AUTO_INCREMENT,
  famlyid int(11) not null,
  foreign key (id) references person(id),
  foreign key (famlyid) references family(id),
  primary key(id)
);


