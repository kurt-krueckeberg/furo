#--The specific problem with German umlauts is often described as 'dictionary order' or 'phone-book order'. 
#--The Unicode default is okay for the former but if you want 'Ü' = 'UE', then you could consider 
#--utf8mb4_de_pb_0900_ai_ci or utf8mb4_german2_ci, asuming character set is utf8mb4.

CREATE DATABASE IF NOT EXISTS petzen CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_german2_ci';

#--Create user and grant privileges to the database:
GRANT ALL PRIVILEGES ON petzen.* TO 'kurt'@'localhost' identified by 'kk0457';

use petzen;

# -- The first persons insert into the database will be used for the UNKNOWN persons: if mid or fid is 1 -> they are unknown.
# -- If these persons values are unkonwn, these defaults are used:
# -- bdate - '0000-00-00' 
# -- bdorf - 'unkown'
# -- fid - 1
# -- mid - 1

create table IF NOT EXISTS persons (
 id int NOT NULL AUTO_INCREMENT,
 fname varchar(45) not null,
 lname varchar(20) not null,
 sex ENUM('m', 'f', 'u') not null, 
 fid int, 
 mid int,
 bdate date not null,
 bplace varchar(15) not null,
 foreign key (fid) references persons(id) on delete set null, 
 foreign key (mid) references persons(id) on delete set null,
 primary key(id)
);

# -- Insert UNKONWN persons into the persons table. The unknown persons has persons(id) of 1, the first auto_increment value, and the fid and mid are also 1, referring this same all-purpose unknown persons.
INSERT INTO persons (id, fname, lname, sex, fid, mid, bdate, founder, bplace) VALUES (1, "unknown", "unknown", "u", 1, 1, "0000-00-00", "unknown");

DECLARE unknown INTEGER;
SET unknown = 1;


# -- images or possibly pdfs with images. This table gives the path on the harddrive
# -- If we want to allow more than one image per page, then we need a
# -- cite_imgs table instead. See below
# -- Compare to RootsMagic
create table if not exists imgs (
 id int not null,
 path varchar[160] not null,
 primary key(id)
);

#-- citations for events
#-- NOTE: If citations can apply to more than one event, we would use this table and just remove the
#--    event(cite) foreign reference from the event table.
#-- create table if not exists cite_events (
#--  cid int not null,
#--  eid int not null,
#--  primary key (cid, eid),
#--  foreign key cid reference cite(id),
#--  foreign key eid reference event(id)
#--);
create table if not exists cite (
 id int NOT NULL AUTO_INCREMENT,
 int pgno not null,
 text varchar(200),
 comments varchar(400), 
 imgid not null
 primary key(id),
 foreign key (imgid) references imgs(id)
);

cite_imgs(
 cid int not null,
 imgid int not null,
 primary key(cid, ingid),
 foreign key(cid) referecnes cite(id),
 foreign key(imgid) referecnes imgs(id)

#-- pid is the persons id. Events have a single 'principle' person but 
#-- may have other particpants. We only define four participant roles in 
#-- the participant table.
create table IF NOT EXISTS event (
  id int NOT NULL AUTO_INCREMENT, 
  edate date not null,
  type ENUM('baptize','confirm','marry', 'birth', 'death') not null,
  citeid int not null,
  primary key(id),
  foreign key (citeid) references cite(id)
);

#-- The role attribute allows us to find:
#-- 1.) All baptism event sponsers, who will have role of 'sponsor'
#-- 2.) All pastors whose officiated at events.
#-- The 'other' role serves as a placeholder for yet-to-be-defined roles.
create table IF NOT EXISTS participants (
  epid not null auto_increment,
  pid int not null,
  eid int not null,
  role enum('principle','pastor','sponsor', 'other'),
  primary key (pid, eid),
  foreign key (pid) references persons(id),
  foreign key (eid) references event(id)
);

#--The married couple, husband and wife, constitute a 'family', even if they neve have children.
create table IF NOT EXISTS family (
  id int NOT NULL AUTO_INCREMENT,
  husbid int not null,
  wifeid int not null,
  primary key(id),
  unique key (husbid, wifeid),
  foreign key (husbid) references persons(id), 
  foreign key (wifeid) references persons(id), 
);

#-- fid is family id.
create table IF NOT EXISTS children (
  id int NOT NULL AUTO_INCREMENT,
  fid int not null,
  foreign key (id) references persons(id),
  foreign key (fid) references family(id),
  primary key(id)
);
