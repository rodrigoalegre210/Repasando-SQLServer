/*

Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada 
"inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.
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
  cuotas tinyint
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade,
 );

3- Ingrese algunos registros:
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

4- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de 
ambas tablas.

5- Muestre los socios que se serán compañeros en tenis y también en natación (empleando 
subconsulta)
3 filas devueltas.

6- vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio 2.
3 filas.

7- Obtenga el mismo resultado anterior pero empleando join.

8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que ALGUN deporte en los que se 
inscribió el socio 1.
2 registros.

9- Muestre los deportes en los cuales el socio 2 pagó más cuotas que TODOS los deportes en que se 
inscribió el socio 1.
1 registro.

10- Cuando un socio no ha pagado la matrícula de alguno de los deportes en que se ha inscripto, se 
lo borra de la inscripción de todos los deportes. Elimine todos los socios que no pagaron ninguna 
cuota en algún deporte.
7 registros.

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
	deporte			VARCHAR(20) NOT NULL,
	cuotas			TINYINT
	CONSTRAINT CK_inscriptos_cuotas
	CHECK (cuotas >= 0 AND cuotas <= 10)
	CONSTRAINT DF_inscriptos_cuotas DEFAULT 0,
	PRIMARY KEY		(numerosocio, deporte),
	CONSTRAINT FK_inscriptos_socio
	FOREIGN KEY		(numerosocio)
	REFERENCES socios(numero)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

-- 3
insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

-- 4
SELECT s.numero AS Numero,
s.nombre AS Nombre,
i.deporte AS Deporte
FROM socios AS s
JOIN inscriptos AS i ON s.numero = i.numerosocio;

-- 5
SELECT s.nombre AS Nombre
FROM socios AS s
JOIN inscriptos AS i ON s.numero = i.numerosocio
WHERE i.deporte = 'natacion' AND
s.numero = ANY (SELECT numerosocio FROM inscriptos AS i WHERE deporte = 'tenis');

-- 6
SELECT deporte FROM inscriptos
WHERE numerosocio = 1 AND
deporte = ANY (SELECT deporte FROM inscriptos WHERE numerosocio = 2);

-- 7
SELECT i1.deporte AS Deporte
FROM inscriptos AS i1
JOIN inscriptos AS i2 ON i1.deporte = i2.deporte
WHERE i1.numerosocio = 1 AND i2.numerosocio = 2;

-- 8
SELECT deporte AS Deporte
FROM inscriptos
WHERE numerosocio = 2 AND
cuotas > ANY (SELECT cuotas FROM inscriptos WHERE numerosocio = 1);

-- 9
SELECT deporte AS Deporte
FROM inscriptos
WHERE numerosocio = 2 AND
cuotas > ALL (SELECT cuotas FROM inscriptos WHERE numerosocio = 1);

-- 10
DELETE FROM inscriptos
WHERE numerosocio = ANY (SELECT numerosocio FROM inscriptos WHERE cuotas = 0);

SELECT * FROM inscriptos;