/*

Un consultorio médico en el cual trabajan 3 médicos registra las consultas de los pacientes en una 
tabla llamada "consultas".
1- Elimine la tabla si existe:
 if object_id('consultas') is not null
  drop table consultas;

2- La tabla contiene los siguientes datos:
  - fechayhora: datetime not null, fecha y hora de la consulta,
  - medico: varchar(30), not null, nombre del médico (Perez,Lopez,Duarte),
  - documento: char(8) not null, documento del paciente,
  - paciente: varchar(30), nombre del paciente,
  - obrasocial: varchar(30), nombre de la obra social (IPAM,PAMI, etc.).
 );

3- Un médico sólo puede atender a un paciente en una fecha y hora determianada. En una fecha y hora 
determinada, varios médicos atienden a distintos pacientes. Cree la tabla definiendo una clave 
primaria compuesta:
 create table consultas(
  fechayhora datetime not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 );

4- Ingrese varias consultas para un mismo médico en distintas horas el mismo día.

5- Ingrese varias consultas para diferentes médicos en la misma fecha y hora.

6- Intente ingresar una consulta para un mismo médico en la misma hora el mismo día.

*/

-- 1
IF OBJECT_ID('consultas') IS NOT NULL
	DROP TABLE consultas;

-- 3
CREATE TABLE consultas(
	fechayhora		DATETIME NOT NULL,
	medico			VARCHAR(30) NOT NULL,
	documento		CHAR(8) NOT NULL,
	paciente		VARCHAR(30),
	obrasocial		VARCHAR(30)
	PRIMARY KEY		(fechayhora, medico)
);

-- 4
INSERT INTO consultas
VALUES('2023.10.23 9:30', 'Lopez', '12345678', 'Alberto', 'PAMI')
INSERT INTO consultas
VALUES('2023.10.23 9:35', 'Lopez', '12345678', 'Alberto', 'PAMI')
INSERT INTO consultas
VALUES('2023.10.23 9:40', 'Lopez', '12345678', 'Alberto', 'PAMI')

-- 5
INSERT INTO consultas
VALUES('2023.10.23 9:30', 'Ramirez', '12345678', 'Alberto', 'PAMI')
INSERT INTO consultas
VALUES('2023.10.23 9:30', 'Gonzales', '12345678', 'Alberto', 'PAMI')
INSERT INTO consultas
VALUES('2023.10.23 9:30', 'Alegre', '12345678', 'Alberto', 'PAMI')

-- 6
INSERT INTO consultas
VALUES('2023.10.23 9:30', 'Lopez', '12345678', 'Alberto', 'PAMI')

SELECT * FROM consultas;

/*

Un club dicta clases de distintos deportes. En una tabla llamada "inscriptos" almacena la 
información necesaria.
1- Elimine la tabla "inscriptos" si existe:
 if object_id('inscriptos') is not null
  drop table inscriptos;

2- La tabla contiene los siguientes campos:
 - documento del socio alumno: char(8) not null
 - nombre del socio: varchar(30),
 - nombre del deporte (tenis, futbol, natación, basquet): varchar(15) not null,
 - año de inscripcion: datetime,
 - matrícula: si la matrícula ha sido o no pagada ('s' o 'n').

3- Necesitamos una clave primaria que identifique cada registro. Un socio puede inscribirse en 
varios deportes en distintos años. Un socio no puede inscribirse en el mismo deporte el mismo año. 
Varios socios se inscriben en un mismo deporte en distintos años. Cree la tabla con una clave 
compuesta:
 create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  año datetime,
  matricula char(1),
  primary key(documento,deporte,año)
 );

4- Inscriba a varios alumnos en el mismo deporte en el mismo año:
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s');
 insert into inscriptos
  values ('23333333','Marta Garcia','tenis','2005','s');
 insert into inscriptos
  values ('34444444','Luis Perez','tenis','2005','n');

5- Inscriba a un mismo alumno en varios deportes en el mismo año:
 insert into inscriptos
  values ('12222222','Juan Perez','futbol','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','natacion','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','basquet','2005','n');

6- Ingrese un registro con el mismo documento de socio en el mismo deporte en distintos años:
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2006','s');
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2007','s');

7- Intente inscribir a un socio alumno en un deporte en el cual ya esté inscripto en un año en el 
cual ya se haya inscripto.

8- Intente actualizar un registro para que la clave primaria se repita.

*/

-- 1
IF OBJECT_ID('inscriptos') IS NOT NULL
	DROP TABLE inscriptos;

-- 3
CREATE TABLE inscriptos(
	documento		CHAR(8) NOT NULL,
	nombre			VARCHAR(30),
	deporte			VARCHAR(15) NOT NULL,
	año				DATETIME,
	matricula		CHAR(1),
	PRIMARY KEY		(documento, deporte, año)
);

-- 4
insert into inscriptos
values ('12222222','Juan Perez','tenis','2005','s');
insert into inscriptos
values ('23333333','Marta Garcia','tenis','2005','s');
insert into inscriptos
values ('34444444','Luis Perez','tenis','2005','n');

-- 5
insert into inscriptos
values ('12222222','Juan Perez','futbol','2005','s');
insert into inscriptos
values ('12222222','Juan Perez','natacion','2005','s');
insert into inscriptos
values ('12222222','Juan Perez','basquet','2005','n');

-- 6
insert into inscriptos
values ('12222222','Juan Perez','tenis','2006','s');
insert into inscriptos
values ('12222222','Juan Perez','tenis','2007','s');

-- 7
insert into inscriptos
values ('12222222','Juan Perez','tenis','2006','s');

-- 8
UPDATE inscriptos SET deporte = 'futbol'
WHERE documento = '12222222' AND deporte = 'tenis' AND año = '2006';
