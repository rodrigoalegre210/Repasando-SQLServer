/*

Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada 
"inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
y si la matricula está o no paga, y una tabla denominada "socios" en la que guarda los datos 
personales de cada socio.
1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;

2- Cree las tablas:
 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  matricula char(1),-- 'n' o 's'
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
 );

3- Ingrese algunos registros:
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis','s');
 insert into inscriptos values(1,'basquet','s');
 insert into inscriptos values(1,'natacion','s');
 insert into inscriptos values(2,'tenis','s');
 insert into inscriptos values(2,'natacion','s');
 insert into inscriptos values(2,'basquet','n');
 insert into inscriptos values(2,'futbol','n');
 insert into inscriptos values(3,'tenis','s');
 insert into inscriptos values(3,'basquet','s');
 insert into inscriptos values(3,'natacion','n');
 insert into inscriptos values(4,'basquet','n');

4- Actualizamos la cuota ('s') de todas las inscripciones de un socio determinado (por documento) 
empleando subconsulta.

5- Elimine todas las inscripciones de los socios que deben alguna matrícula (5 registros eliminados)

*/

-- 1
IF OBJECT_ID('inscriptos') IS NOT NULL
	DROP TABLE inscriptos;

IF OBJECT_ID('socios') IS NOT NULL
	DROP TABLE socios;

-- 2
CREATE TABLE socios(
	numero			INTEGER IDENTITY,
	documento		CHAR(8),
	nombre			VARCHAR(30),
	domicilio		VARCHAR(30),
	PRIMARY KEY		(numero)
);

CREATE TABLE inscriptos(
	numerosocio		INTEGER NOT NULL,
	deporte			VARCHAR(30) NOT NULL,
	matricula		CHAR(1),
	PRIMARY KEY		(numerosocio, deporte),
	CONSTRAINT FK_inscriptos_socio
	FOREIGN KEY		(numerosocio)
	REFERENCES socios(numero)
);

-- 3
insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis','s');
insert into inscriptos values(1,'basquet','s');
insert into inscriptos values(1,'natacion','s');
insert into inscriptos values(2,'tenis','s');
insert into inscriptos values(2,'natacion','s');
insert into inscriptos values(2,'basquet','n');
insert into inscriptos values(2,'futbol','n');
insert into inscriptos values(3,'tenis','s');
insert into inscriptos values(3,'basquet','s');
insert into inscriptos values(3,'natacion','n');
insert into inscriptos values(4,'basquet','n');

-- 4
UPDATE inscriptos SET matricula = 's'
WHERE numerosocio = (SELECT numero FROM socios
WHERE documento = '24444444');

-- 5
DELETE FROM inscriptos
WHERE numerosocio IN (SELECT numero FROM socios AS s
JOIN inscriptos AS i
ON s.numero = i.numerosocio
WHERE matricula = 'n');