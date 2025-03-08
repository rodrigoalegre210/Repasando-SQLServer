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

4- Se necesita un listado de todos los socios que incluya nombre y domicilio, la cantidad de 
deportes a los cuales se ha inscripto, empleando subconsulta.
4 registros.

5- Se necesita el nombre de todos los socios, el total de cuotas que debe pagar (10 por cada 
deporte) y el total de cuotas pagas, empleando subconsulta.
4 registros.

6- Obtenga la misma salida anterior empleando join.

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
	PRIMARY KEY		(numerosocio,deporte),
	CONSTRAINT FK_inscriptos_socios
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
SELECT s.nombre AS Nombre,
s.domicilio AS Domicilio,
(SELECT COUNT(*) FROM inscriptos AS i
WHERE s.numero = i.numerosocio) AS Total
FROM socios AS s;

-- 5
SELECT s.nombre AS Nombre,
(SELECT (COUNT(*) * 10)
FROM inscriptos AS i
WHERE s.numero = i.numerosocio) AS Total,
(SELECT SUM(i.cuotas) FROM inscriptos AS i
WHERE s.numero = i.numerosocio) AS Pagas
FROM socios AS s;

-- 6
SELECT s.nombre AS Nombre,
COUNT(i.deporte) * 10 AS Total,
SUM(i.cuotas) AS Pagas
FROM socios AS s
JOIN inscriptos AS i ON s.numero = i.numerosocio
GROUP BY s.nombre;