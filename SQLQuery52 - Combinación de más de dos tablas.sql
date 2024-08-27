/*

Un club dicta clases de distintos deportes. En una tabla llamada "socios" guarda los datos de los 
socios, en una tabla llamada "deportes" la información referente a los diferentes deportes que se 
dictan y en una tabla denominada "inscriptos", las inscripciones de los socios a los distintos 
deportes.
Un socio puede inscribirse en varios deportes el mismo año. Un socio no puede inscribirse en el 
mismo deporte el mismo año. Distintos socios se inscriben en un mismo deporte en el mismo año.
1- Elimine las tablas si existen:
 if object_id('socios') is not null
  drop table socios;
 if object_id('deportes') is not null
  drop table deportes;
 if object_id('inscriptos') is not null
  drop table inscriptos;

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
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 );

3- Ingrese algunos registros en "socios":
 insert into socios values('22222222','Ana Acosta','Avellaneda 111');
 insert into socios values('23333333','Betina Bustos','Bulnes 222');
 insert into socios values('24444444','Carlos Castro','Caseros 333');
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44');
4- Ingrese algunos registros en "deportes":
 insert into deportes values('basquet','Juan Juarez');
 insert into deportes values('futbol','Pedro Perez');
 insert into deportes values('natacion','Marina Morales');
 insert into deportes values('tenis','Marina Morales');

5- Inscriba a varios socios en el mismo deporte en el mismo año:
 insert into inscriptos values ('22222222',3,'2006','s');
 insert into inscriptos values ('23333333',3,'2006','s');
 insert into inscriptos values ('24444444',3,'2006','n');

6- Inscriba a un mismo socio en el mismo deporte en distintos años:
 insert into inscriptos values ('22222222',3,'2005','s');
 insert into inscriptos values ('22222222',3,'2007','n');

7- Inscriba a un mismo socio en distintos deportes el mismo año:
 insert into inscriptos values ('24444444',1,'2006','s');
 insert into inscriptos values ('24444444',2,'2006','s');

8- Ingrese una inscripción con un código de deporte inexistente y un documento de socio que no 
exista en "socios":
 insert into inscriptos values ('26666666',0,'2006','s');

9- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando 
diferentes tipos de join.

10- Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas 
inscripciones cuyo código de deporte no existe en "deportes" y cuyo documento de socio no se 
encuentra en "socios".

11- Muestre todas las inscripciones del socio con documento "22222222".

*/

-- 1
IF OBJECT_ID('socios') IS NOT NULL
	DROP TABLE socios;

IF OBJECT_ID('deportes') IS NOT NULL
	DROP TABLE deportes;

IF OBJECT_ID('inscriptos') IS NOT NULL
	DROP TABLE inscriptos;

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
	profesor		VARCHAR(15),
	PRIMARY KEY		(codigo)
);

CREATE TABLE inscriptos(
	documento		CHAR(8) NOT NULL,
	codigodeporte	TINYINT NOT NULL,
	anio			CHAR(4),
	matricula		CHAR(1), -- S = Paga, N = Impaga
	PRIMARY KEY		(documento, codigodeporte, anio)
);

-- 3
insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

-- 4
insert into deportes values('basquet','Juan Juarez');
insert into deportes values('futbol','Pedro Perez');
insert into deportes values('natacion','Marina Morales');
insert into deportes values('tenis','Marina Morales');

-- 5
insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');

-- 6
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');

-- 7
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');

-- 8
insert into inscriptos values ('26666666',0,'2006','s');

-- 9
SELECT S.nombre AS Nombre,
D.nombre AS Deporte,
I.anio AS Año
FROM socios AS S
JOIN inscriptos AS I
ON S.documento = I.documento
JOIN deportes AS D
ON I.codigodeporte = D.codigo;

SELECT S.nombre AS Nombre,
D.nombre AS Deporte,
I.anio AS Año
FROM deportes AS D
RIGHT JOIN inscriptos AS I
ON I.codigodeporte = D.codigo
LEFT JOIN socios AS S
ON I.documento = S.documento;

-- 10
SELECT S.nombre AS Nombre,
D.nombre AS Deporte,
I.anio AS Año,
I.matricula AS Matricula
FROM deportes AS D
FULL JOIN inscriptos AS I
ON I.codigodeporte = D.codigo
FULL JOIN socios AS S
ON I.documento = S.documento;

-- 11
SELECT S.nombre AS Nombre,
D.nombre AS Deporte,
I.anio AS Año,
I.matricula AS Matricula
FROM deportes AS D
JOIN inscriptos AS I
ON I.codigodeporte = D.codigo
JOIN socios AS S
ON I.documento = S.documento
WHERE S.documento = '22222222';
