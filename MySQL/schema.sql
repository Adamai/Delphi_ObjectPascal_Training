CREATE SCHEMA IF NOT EXISTS equipmaintdb;
USE equipmaintdb;

CREATE TABLE IF NOT EXISTS ADMINGROUP(
admingroupid varchar(30),
description varchar(200),
primary key (admingroupid)
);


CREATE TABLE IF NOT ExISTS SPECiALITY(
specialityid varchar(30),
description varchar(200),
flag_funcao_oper char,
codg_admingroup_fk varchar(30),
primary key (specialityid),
foreign key (codg_admingroup_fk) references ADMINGROUP (admingroupid)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);
