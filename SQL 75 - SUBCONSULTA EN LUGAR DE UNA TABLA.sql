/*

Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de los 
socios, en una tabla llamada "deportes" la información referente a los diferentes deportes que se 
dictan y en una tabla denominada "inscriptos", las inscripciones de los socios a los distintos 
deportes.
Un socio puede inscribirse en varios deportes el mismo año. Un socio no puede inscribirse en el 
mismo deporte el mismo año. Distintos socios se inscriben en un mismo deporte en el mismo año.

1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
 if object_id('deportes') is not null
  drop table deportes;

2- Cree las tablas con las siguientes estructuras:
 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
 create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 );
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año),
  constraint FK_inscriptos_socio
   foreign key (documento)
   references socios(documento)
   on update cascade
   on delete cascade
 );

3- Ingrese algunos registros en las 3 tablas:
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');
 insert into deportes values('tenis','Marina Morales');

 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

4- Realice una consulta en la cual muestre todos los datos de las inscripciones, incluyendo el 
nombre del deporte y del profesor.
Esta consulta es un join.

5- Utilice el resultado de la consulta anterior como una tabla derivada para emplear en lugar de una 
tabla para realizar un "join" y recuperar el nombre del socio, el deporte en el cual está inscripto, 
el año, el nombre del profesor y la matrícula.

*/

-- 1
IF OBJECT_ID('inscriptos') IS NOT NULL
	DROP TABLE inscriptos;

IF OBJECT_ID('socios') IS NOT NULL
	DROP TABLE socios;

IF OBJECT_ID('deportes') IS NOT NULL
	DROP TABLE deportes;

-- 2
CREATE TABLE socios(
	documento		CHAR(8) NOT NULL,
	nombre			VARCHAR(30),
	domicilio		VARCHAR(30),
	PRIMARY KEY		(documento)
);

CREATE TABLE deportes(
	codigo			TINYINT IDENTITY,
	nombre			VARCHAR(20),
	profesor		VARCHAR(30),
	PRIMARY KEY		(codigo)
);

CREATE TABLE inscriptos(
	documento		CHAR(8) NOT NULL,
	codigodeporte	TINYINT NOT NULL,
	anio			CHAR(4),
	matricula		CHAR(1),
	PRIMARY KEY		(documento, codigodeporte, anio),
	CONSTRAINT FK_inscriptos_socio
	FOREIGN KEY		(documento)
	REFERENCES socios(documento)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

-- 3
insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
insert into deportes values('natacion','Marina Morales');
insert into deportes values('tenis','Marina Morales');

insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

-- 4
SELECT i.documento AS Documento,
i.codigodeporte AS 'Codigo del Deporte',
d.nombre AS Deporte,
i.anio AS Año,
i.matricula AS Matricula,
d.profesor AS Profesor
FROM deportes AS d
JOIN inscriptos AS i ON d.codigo = i.codigodeporte;

-- 5
SELECT s.nombre AS Nombre, td.Deporte, td.Profesor, td.Año,td.Matricula
FROM socios AS s
JOIN (SELECT i.documento AS Documento,
i.codigodeporte AS 'Codigo del Deporte',
d.nombre AS Deporte,
i.anio AS Año,
i.matricula AS Matricula,
d.profesor AS Profesor
FROM deportes AS d
JOIN inscriptos AS i ON d.codigo = i.codigodeporte) AS td
ON td.Documento = s.documento;