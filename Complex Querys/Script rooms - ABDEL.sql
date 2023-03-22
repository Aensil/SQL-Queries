create database if not exists classrooms;
use classrooms;

drop table if exists HISTORY_CHAIRS cascade;
drop table if exists INTERNET;
drop table if exists COMPUTERS;
drop table if exists DESKS;
drop table if exists CHAIRS;

create table DESKS
(
   ID_DESK            		int(15) not null AUTO_INCREMENT,
   DESK_COLOR		  		varchar(20) not null ,
   QUANTITY_FOOTSTANDS		int(2) not null,
   DIMENSIONS		  		varchar(20) not null,
   DESK_MATERIAL			varchar(20) not null,
   primary key (ID_DESK)
);


create table CHAIRS
(
   ID_CHAIR            	int(15) not null AUTO_INCREMENT,
   BACKREST			   	boolean not null,
   CHAIR_COLOR			varchar(20) not null,
   CHAIR_MATERIAL		varchar(20) not null,
   primary key (ID_CHAIR)
);

create table COMPUTERS
(
   SERIAL_COMPUTER          int(15) not null AUTO_INCREMENT,
   ID_DESK            		int(15) not null,
   BRAND_COMPUTER			varchar(20) not null,
   COMPUTER_MODEL			varchar(20) not null,
   CPU_COMPUTER				varchar(20) not null,
   KEYBOARD					varchar(20) not null,
   MOUSE					varchar(20) not null,
   WIRES					INT(20) not null,
   primary key (SERIAL_COMPUTER)
);

create table HISTORY_CHAIRS
(
   ID_DESK      int(15) not null,
   ID_CHAIR   	int(15) not null,
   USE_DATE		datetime not null,
   primary key (ID_DESK, ID_CHAIR, USE_DATE)
);

create table INTERNET
(
   ID_INTERNET            int(15) not null AUTO_INCREMENT,
   SERIAL_COMPUTER        int(15) not null,
   CONNECTION_TYPE   	  varchar(200) not null,
   SPEED				  varchar(200) not null,
   primary key (ID_INTERNET)
);

alter table HISTORY_CHAIRS add constraint FK_HCH_DEK foreign key (ID_DESK)
      references DESKS (ID_DESK) on delete restrict on update restrict;
      
alter table HISTORY_CHAIRS add constraint FK_HCH_CHR foreign key (ID_CHAIR)
      references CHAIRS (ID_CHAIR) on delete restrict on update restrict;

alter table INTERNET add constraint FK_INT_COM foreign key (SERIAL_COMPUTER)
      references COMPUTERS (SERIAL_COMPUTER) on delete restrict on update restrict;
      
alter table COMPUTERS add constraint FK_DEK_COM foreign key (ID_DESK)
      references DESKS (ID_DESK) on delete restrict on update restrict;
      
INSERT INTO DESKS VALUES(null, 'CAFE',4,'90x20x100', 'MADERA');
INSERT INTO DESKS VALUES(NULL,'NEGRO',2,'100x50x100', 'MADERA');
INSERT INTO DESKS VALUES(NULL, 'BLANCO',4,'120x70x90', 'ACERO');
INSERT INTO DESKS VALUES(null, 'AMARILLO',4,'90x20x100', 'MADERA');
INSERT INTO DESKS VALUES(NULL,'CARAMELO',2,'100x50x100', 'MADERA');
INSERT INTO DESKS VALUES(NULL, 'BLANCO',4,'120x70x90', 'ACERO');
INSERT INTO DESKS VALUES(null, 'AZUL',4,'90x20x100', 'MADERA');
INSERT INTO DESKS VALUES(NULL,'NEGRO',2,'100x50x100', 'MADERA');
INSERT INTO DESKS VALUES(NULL, 'ROJO',4,'120x70x90', 'ACERO');
INSERT INTO DESKS VALUES(NULL, 'ROJO',4,'120x70x90', 'ACERO');

INSERT INTO CHAIRS VALUES(null, 1 ,'NEGRO','ACERO');
INSERT INTO CHAIRS VALUES(null, 0 ,'BLANCO','PLASTICO');
INSERT INTO CHAIRS VALUES(null, 1 ,'CAFE','MADERA');
INSERT INTO CHAIRS VALUES(null, 1 ,'NEGRO','ACERO');
INSERT INTO CHAIRS VALUES(null, 1 ,'BLANCO','PLASTICO');
INSERT INTO CHAIRS VALUES(null, 1 ,'CAFE','MADERA');
INSERT INTO CHAIRS VALUES(null, 1 ,'NEGRO','ACERO');
INSERT INTO CHAIRS VALUES(null, 1 ,'BLANCO','PLASTICO');
INSERT INTO CHAIRS VALUES(null, 1 ,'BLANCO','PLASTICO');
INSERT INTO CHAIRS VALUES(null, 1 ,'NEGRO','PLASTICO');
INSERT INTO CHAIRS VALUES(null, 0 ,'NEGRO','PLASTICO');
INSERT INTO CHAIRS VALUES(null, 1 ,'NEGRO','MADERA');
INSERT INTO CHAIRS VALUES(null, 1 ,'NEGRO','ACERO');
INSERT INTO CHAIRS VALUES(null, 1 ,'BLANCO','PLASTICO');
INSERT INTO CHAIRS VALUES(null, 1 ,'GRIS','ACERO');
INSERT INTO CHAIRS VALUES(null, 0 ,'NEGRO','ACERO');
INSERT INTO CHAIRS VALUES(null, 1 ,'ROJO','ACERO');
INSERT INTO CHAIRS VALUES(null, 1 ,'CAFE','ACERO');
INSERT INTO CHAIRS VALUES(null, 1 ,'NEGRO','ACERO');
INSERT INTO CHAIRS VALUES(null, 1 ,'BLANCO','PLASTICO');

INSERT INTO computers VALUES(123450, 1 ,'HP','PAVILION','A257390','A259370','FGLCF0', 7);
INSERT INTO computers VALUES(123451, 2 ,'DELL','D20', 'A257391','A259371','FGLCF1', 8);
INSERT INTO computers VALUES(123452, 3 ,'ACER','ASPIRE 3','A257392','A259372','FGLCF2', 6);
INSERT INTO computers VALUES(123453, 1 ,'HP','PAVILION','A257393','A259373','FGLCF3', 7);
INSERT INTO computers VALUES(123454, 2 ,'DELL','D20', 'A257394','A259374','FGLCF4', 8);
INSERT INTO computers VALUES(123455, 3 ,'ACER','ASPIRE 3','A257395','A259375','FGLCF5', 6);
INSERT INTO computers VALUES(123456, 1 ,'HP','PAVILION','A257396','A259376','FGLCF6', 7);
INSERT INTO computers VALUES(123457, 2 ,'DELL','D20', 'A257397','A259377','FGLCF7', 8);
INSERT INTO computers VALUES(123458, 3 ,'ACER','ASPIRE 3','A257398','A259378','FGLCF8', 6);
INSERT INTO computers VALUES(123459, 3 ,'ACER','ASPIRE 3','A257399','A259379','FGLCF9', 6);


INSERT INTO INTERNET VALUES(1, 123450 ,'WIFI','100 MB'),
(2, 123452 ,'UTP','200 MB'),
(null, 123451 ,'UTP','200 MB'),
(null, 123454 ,'UTP','200 MB'),
(null, 123453 ,'UTP','200 MB'),
(null, 123459 ,'UTP','200 MB'),
(null, 123458 ,'UTP','200 MB'),
(null, 123457 ,'UTP','200 MB'),
(null, 123456 ,'UTP','200 MB'),
(null, 123455 ,'UTP','200 MB');

insert into HISTORY_CHAIRS values(1, 1, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(2, 2, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(3, 3, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(4, 4, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(5, 5, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(6, 6, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(7, 7, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(8, 8, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(9, 9, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(10, 10, '2023-02-24 14:00:00'); 
insert into HISTORY_CHAIRS values(1, 11, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(2, 12, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(3, 13, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(4, 14, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(5, 15, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(6, 16, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(7, 17, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(8, 18, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(9, 19, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(1, 20, '2023-02-24 15:30:00'); 
insert into HISTORY_CHAIRS values(10, 1, '2023-02-24 15:00:00'); 
insert into HISTORY_CHAIRS values(1, 2, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(2, 3, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(3, 4, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(4, 5, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(5, 6, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(6, 7, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(7, 8, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(8, 9, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(9, 10, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(10, 11, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(1, 12, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(2, 13, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(3, 14, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(4, 15, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(5, 16, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(6, 17, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(7, 18, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(8, 19, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(9, 20, '2023-02-24 17:00:00'); 
insert into HISTORY_CHAIRS values(10, 1, '2023-02-24 16:00:00'); 
insert into HISTORY_CHAIRS values(2, 13, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(3, 14, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(1, 15, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(4, 16, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(5, 17, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(6, 18, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(7, 19, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(8, 20, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(9, 1, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(10, 12, '2023-02-24 18:00:00'); 
insert into HISTORY_CHAIRS values(1, 13, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(2, 4, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(3, 5, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(4, 6, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(5, 7, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(6, 8, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(7, 9, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(8, 10, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(9, 14, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(10, 15, '2023-02-24 19:00:00'); 
insert into HISTORY_CHAIRS values(1, 14, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(2, 17, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(3, 18, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(4, 19, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(5, 20, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(6, 1, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(7, 2, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(8, 3, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(9, 4, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(10, 5, '2023-02-24 20:00:00'); 
insert into HISTORY_CHAIRS values(1, 6, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(2, 7, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(3, 8, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(4, 9, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(5, 10, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(6, 11, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(7, 12, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(8, 13, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(9, 14, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(10, 15, '2023-02-24 21:00:00'); 
insert into HISTORY_CHAIRS values(1, 16, '2023-02-25 08:00:00'); 
insert into HISTORY_CHAIRS values(2, 17, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(3, 18, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(4, 19, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(5, 12, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(6, 13, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(7, 14, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(8, 15, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(9, 16, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(10, 17, '2023-02-24 08:00:00'); 
insert into HISTORY_CHAIRS values(1, 18, '2023-02-24 09:00:00'); 
insert into HISTORY_CHAIRS values(2, 19, '2023-02-24 09:00:00'); 
insert into HISTORY_CHAIRS values(3, 1, '2023-02-24 09:00:00'); 
insert into HISTORY_CHAIRS values(4, 3, '2023-02-24 09:00:00'); 
insert into HISTORY_CHAIRS values(5, 4, '2023-02-24 09:00:00'); 
insert into HISTORY_CHAIRS values(6, 5, '2023-02-24 09:00:00'); 
insert into HISTORY_CHAIRS values(7, 6, '2023-02-24 09:00:00'); 
insert into HISTORY_CHAIRS values(8, 7, '2023-02-24 09:00:00'); 
insert into HISTORY_CHAIRS values(9, 8, '2023-02-24 08:00:00'); 


SELECT * FROM DESKS;
DESC HISTORY_CHAIRS;
DESC DESKS;
DESC COMPUTERS;
DESC INTERNET;

select count(*) from HISTORY_CHAIRS;
select count(*) from DESKS;
select count(*) from CHAIRS;
select count(*) from INTERNET;
select count(*) from COMPUTERS;


create table USUARIO
(
   ID_USER        			int(15) not null AUTO_INCREMENT,
   NOMBRE			  		varchar(20) not null,
   APELLIDO					varchar(20) not null,
   EDAD				  		varchar(20) not null,
   primary key (ID_USER)
);

create table HIST
(
   ID_USER        			int(15) not null,
   SERIAL_COMPUTER			int(15) not null,
   USER_DATE				datetime not null,
   DATE_				  	datetime not null,
   HOUR_					varchar(20) not null
);

create table USER_DESK
(
   ID_USER        			int(15) not null,
   ID_DESK					int(15) not null,
   USER_DATE				datetime not null,
   DATE_				  	datetime not null,
   HOUR_					varchar(20) not null
);




INSERT INTO USUARIO
VALUES (1,'Luis','Diaz',38),
(2,'Carlos','Soler',26),
(3,'Daniel','Moreno',23),
(4,'David','Vargas',32),
(5,'Julian','Perez',26),
(6,'Esteban','Gonzalez',37),
(7,'Oscar','Pineda',28),
(8,'Santiago','Escobar',30),
(9,'Andres','Amezquita',19),
(10,'Felipe','Gomez',38),
(11,'Camila','Medina',38),
(12,'Lorena','Acevedo',33),
(13,'Angie','Alvarado',40),
(14,'Andra','Benitez ',23),
(15,'Fernando','Rodriguez',27),
(16,'Nicol','Alvarez',30),
(17,'Fernando','Amaya',18),
(18,'Jesica','Avila',17),
(19,'Karol','Corredor',17),
(20,'Gaby','Zorro',40);

INSERT INTO HIST
VALUES (9,123450,'2023-02-24 15:00:00','2023-02-24','15:00:00'),
(10,123451,'2023-02-24 15:00:00','2023-02-24','15:00:00'),
(8,123452,'2023-02-24 08:00:00','2023-02-24','08:00:00'),
(15,123453,'2023-02-24 08:00:00','2023-02-24','08:00:00'),
(3,123454,'2023-02-24 14:00:00','2023-02-24','14:00:00'),
(1,123455,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(18,123456,'2023-02-24 16:00:00','2023-02-24','16:00:00'),
(6,123457,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(18,123458,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(10,123459,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(2,123450,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(16,123451,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(20,123452,'2023-02-24 18:00:00','2023-02-24','18:00:00'),
(6,123453,'2023-02-24 18:00:00','2023-02-24','18:00:00'),
(4,123454,'2023-02-24 08:00:00','2023-02-24','08:00:00'),
(13,123455,'2023-02-24 08:00:00','2023-02-24','08:00:00'),
(16,123456,'2023-02-24 14:00:00','2023-02-24','14:00:00'),
(17,123457,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(11,123458,'2023-02-24 16:00:00','2023-02-24','16:00:00'),
(6,123459,'2023-02-24 09:00:00','2023-02-24','09:00:00'),
(1,123450,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(10,123451,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(10,123452,'2023-02-24 08:00:00','2023-02-24','08:00:00'),
(6,123453,'2023-02-24 08:00:00','2023-02-24','08:00:00'),
(3,123454,'2023-02-24 14:00:00','2023-02-24','14:00:00'),
(13,123455,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(16,123456,'2023-02-24 09:00:00','2023-02-24','09:00:00'),
(4,123457,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(2,123458,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(11,123459,'2023-02-24 09:00:00','2023-02-24','09:00:00'),
(8,123450,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(19,123451,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(10,123452,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(4,123453,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(20,123454,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(16,123455,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(6,123456,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(5,123457,'2023-02-24 09:00:00','2023-02-24','09:00:00'),
(5,123458,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(8,123459,'2023-02-24 09:00:00','2023-02-24','09:00:00'),
(19,123.450,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(14,123451,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(19,123452,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(15,123453,'2023-02-24 09:00:00','2023-02-24','09:00:00'),
(2,123454,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(18,123455,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(18,123456,'2023-02-24 21:00:00','2023-02-24','21:00:00'),
(20,123457,'2023-02-24 20:00:00','2023-02-24','20:00:00'),
(20,123458,'2023-02-24 19:00:00','2023-02-24','19:00:00'),
(1,123459,'2023-02-24 20:00:00','2023-02-24','20:00:00');


alter table HIST add constraint FK_HIS_USER foreign key (ID_USER)
      references USUARIO(ID_USER) on delete restrict on update restrict;
      
alter table HIST add constraint FK_HIS_COMP foreign key (SERIAL_COMPUTER)
      references COMPUTERS (SERIAL_COMPUTER) on delete restrict on update restrict;
      
alter table USER_DESK add constraint FK_USER_USER foreign key (ID_USER)
      references USUARIO (ID_USER) on delete restrict on update restrict;

alter table USER_DESK add constraint FK_USER_DESK foreign key (ID_DESK)
      references DESKS (ID_DESK) on delete restrict on update restrict;


--1   #Sillas por cada material


SELECT DISTINCT CHAIR_MATERIAL, COUNT(*)
FROM CHAIRS
GROUP BY CHAIR_MATERIAL
ORDER BY 2 DESC;



--2 #Sillas del mismo material y color


SELECT DISTINCT CHAIR_COLOR, CHAIR_MATERIAL,  COUNT(*)
FROM CHAIRS
GROUP BY CHAIR_MATERIAL, CHAIR_COLOR
ORDER BY 3 DESC;

--3 #Sillas sin espaldar asignadas a una mesa del mismo color

SELECT COUNT(*)
FROM CHAIRS c, DESKS d, HISTORY_CHAIRS hc
WHERE hc.ID_CHAIR = c.ID_CHAIR
AND hc.ID_DESK = d.ID_DESK
AND c.CHAIR_COLOR = d.DESK_COLOR
AND c.BACKREST = 0;

--4 #computadores asignados a mesas con sillas grises

SELECT count(*)
FROM DESKS d, COMPUTERS pc, HISTORY_CHAIRS hc, CHAIRS c
WHERE pc.ID_DESK = d.ID_DESK
AND hc.ID_CHAIR = c.ID_CHAIR
AND hc.ID_DESK = d.ID_DESK
AND c.CHAIR_COLOR = 'GRIS';

--5 #Marca de computadores mas usada

SELECT pc.BRAND_COMPUTER
FROM COMPUTERS pc, HIST h
WHERE pc.SERIAL_COMPUTER = h.SERIAL_COMPUTER
ORDER BY BRAND_COMPUTER
LIMIT 1;



