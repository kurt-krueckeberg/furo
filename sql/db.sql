#--The specific problem with German umlauts is often described as 'dictionary order' or 'phone-book order'. 
#--The Unicode default is okay for the former but if you want 'Ü' = 'UE', then you could consider 
#--utf8mb4_de_pb_0900_ai_ci or utf8mb4_german2_ci, assuming character set is utf8mb4.

CREATE DATABASE IF NOT EXISTS petzen CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_german2_ci';

#--Create user and grant privileges to the database:
GRANT ALL PRIVILEGES ON petzen.* TO 'kurt'@'localhost' identified by 'kk0457';

use petzen;

# -- The first person insert into the database will be used for the UNKNOWN person: if mid or fid is 1 -> they are unknown.
# -- If these person values are unkonwn, these defaults are used:
# -- bdate - '0000-00-00' 
# -- bdorf - 'unkown'
# -- fid - 1
# -- mid - 1

create table IF NOT EXISTS person (
 id int NOT NULL AUTO_INCREMENT,
 fname varchar(45) not null,
 lname varchar(20) not null,
 sex ENUM('m', 'f', 'u') not null, 
 fid int, 
 mid int,
 bdate date not null,
 bdorf varchar(15) not null,
 foreign key (fid) references person(id) on delete set null, 
 foreign key (mid) references person(id) on delete set null,
 primary key(id)
);

# -- Insert UNKONWN person into the person table. The unknown person has person(id) of 1, the first auto_increment value, and the fid and mid are also 1, referring this same all-purpose unknown person.
INSERT INTO person (id, fname, lname, sex, fid, mid, bdate, founder, bdorf, bkreis, bland) VALUES (1, "unknown", "unknown", "u", 1, 1, "0000-00-00", "unknown");

DECLARE unknown INTEGER;
SET unknown = 1;

#-- citations for events
#-- NOTE: If citations can apply to more than one event, we would use this table and remove
#-- event(cite) foreign reference from the event table.
#-- create table if not exists cite_events (
#--  cid int not null,
#--  eid int not null,
#--  primary key (cid, eid),
#--  foreign key cid reference cite(id),
#--  foreign key eid reference event(id)
#--);
create table if not exists cite (
 id int NOT NULL AUTO_INCREMENT,
 text varchar(200),
 comment varchar(400),
 primary key(id)
);

#-- pid is the person id.  Does a marriage creates two events to be created, one for each spouse. We can solve this
#-- with a person_events table?
#-- How does GedcomX handle this?
create table IF NOT EXISTS event (
  id int NOT NULL AUTO_INCREMENT, 
  edate date not null,
  type ENUM('baptize','confirm','marry', 'birth', 'death') not null,
  cid int not null,
  primary key(id),
  foreign key (cite) references cite(id)
);

#--The married couple, husband and wife, constitute a 'family', even if they neve have children.
create table IF NOT EXISTS family (
  id int NOT NULL AUTO_INCREMENT,
  husbid int not null,
  wifeid int not null,
  primary key(id),
  unique key (husbid, wifeid),
  foreign key (husbid) references person(id), 
  foreign key (wifeid) references person(id), 
);

create table IF NOT EXISTS participants (
  pid int not null,
  eid int not null,
  role enum('principle','pastor','sponsor','parent'),
  primary key (pid, eid),
  foreign key (pid) references person(id),
  foreign key (eid) references event(id)
);

#-- fid is family id.
create table IF NOT EXISTS children (
  id int NOT NULL AUTO_INCREMENT,
  fid int not null,
  foreign key (id) references person(id),
  foreign key (fid) references family(id),
  primary key(id)
);
