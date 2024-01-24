/*
Un videoclub que alquila películas en video almacena la información de sus películas en una tabla 
llamada "peliculas"; para cada película necesita los siguientes datos:
 -nombre, cadena de caracteres de 20 de longitud,
 -actor, cadena de caracteres de 20 de longitud,
 -duración, valor numérico entero.
 -cantidad de copias: valor entero.

1- Elimine la tabla, si existe:
 if object_id('peliculas')is not null
  drop table peliculas;

2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

3- Vea la estructura de la tabla:

4- Ingrese los siguientes registros:
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,2);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

5- Muestre todos los registros.
*/

IF OBJECT_ID('peliculas') IS NOT NULL
	DROP TABLE peliculas;

CREATE TABLE peliculas(
	nombre		VARCHAR(20),
	actor		VARCHAR(20),
	duracion	INTEGER,
	cantidad	INTEGER
);

EXEC sp_columns peliculas;

INSERT INTO peliculas(nombre, actor, duracion, cantidad)
VALUES('Mision imposible','Tom Cruise',128,3);
INSERT INTO peliculas(nombre, actor, duracion, cantidad)
VALUES('Mision imposible 2','Tom Cruise',130,2);
INSERT INTO peliculas(nombre, actor, duracion, cantidad)
VALUES('Mujer bonita','Julia Roberts',118,3);
INSERT INTO peliculas(nombre, actor, duracion, cantidad)
VALUES('Elsa y Fred','China Zorrilla',110,2);

SELECT * FROM peliculas;

/*
Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
datos: nombre, documento, sexo, domicilio, sueldobasico.

1- Elimine la tabla, si existe:
 if object_id('empleados') is not null
  drop table empleados;

2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table empleados(
  nombre varchar(20),
  documento varchar(8),
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float
 );

3- Vea la estructura de la tabla:

4- Ingrese algunos registros:
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Perez','22333444','m','Sarmiento 123',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','24555666','f','Colon 134',650);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',800);

5- Seleccione todos los registros.
*/

IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

CREATE TABLE empleados(
	nombre			VARCHAR(20),
	documento		VARCHAR(8),
	sexo			VARCHAR(1),
	domicilio		VARCHAR(30),
	sueldobasico	FLOAT
);

EXEC sp_columns empleados;

INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Juan Perez','22333444','m','Sarmiento 123',500);
INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Ana Acosta','24555666','f','Colon 134',650);
INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Bartolome Barrios','27888999','m','Urquiza 479',800);

SELECT * FROM empleados;
