/*
Un videoclub que alquila películas en video almacena la información de sus películas en alquiler en 
una tabla llamada "peliculas".

1- Elimine la tabla, si existe:
 if object_id('peliculas') is not null
  drop table peliculas;

2- Cree la tabla:
 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

3- Vea la estructura de la tabla (sp_columns).

4- Ingrese alos siguientes registros:
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',180,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',190,2);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

5- Realice un "select" mostrando solamente el título y actor de todas las películas

6- Muestre el título y duración de todas las peliculas

7- Muestre el título y la cantidad de copias
*/

IF OBJECT_ID('peliculas') IS NOT NULL
	DROP TABLE peliculas;

CREATE TABLE peliculas(
	titulo		VARCHAR(20),
	actor		VARCHAR(20),
	duracion	INTEGER,
	cantidad	INTEGER
);

EXEC sp_columns peliculas;

INSERT INTO peliculas(titulo, actor, duracion, cantidad)
VALUES('Mision imposible','Tom Cruise',180,3);
INSERT INTO peliculas(titulo, actor, duracion, cantidad)
VALUES('Mision imposible 2','Tom Cruise',190,2);
INSERT INTO peliculas(titulo, actor, duracion, cantidad)
VALUES('Mujer bonita','Julia Roberts',118,3);
INSERT INTO peliculas(titulo, actor, duracion, cantidad)
VALUES('Elsa y Fred','China Zorrilla',110,2);

SELECT titulo, actor FROM peliculas;

SELECT titulo, duracion FROM peliculas;

SELECT titulo, cantidad FROM peliculas;

/*
 Una empresa almacena los datos de sus empleados en una tabla llamada "empleados".

1- Elimine la tabla, si existe:
 if object_id('empleados') is not null
  drop table empleados;

2- Cree la tabla:
 create table empleados(
  nombre varchar(20),
  documento varchar(8), 
  sexo varchar(1),
  domicilio varchar(30),
  sueldobasico float
 );

3- Vea la estructura de la tabla:
 exec sp_columns empleados;

4- Ingrese algunos registros:
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Juan Juarez','22333444','m','Sarmiento 123',500);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Ana Acosta','27888999','f','Colon 134',700);
 insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
  values ('Carlos Caseres','31222333','m','Urquiza 479',850);

5- Muestre todos los datos de los empleados

6- Muestre el nombre, documento y domicilio de los empleados

7- Realice un "select" mostrando el documento, sexo y sueldo básico de todos los empleados
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
VALUES('Juan Juarez','22333444','m','Sarmiento 123',500);
INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Ana Acosta','27888999','f','Colon 134',700);
INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Carlos Caseres','31222333','m','Urquiza 479',850);

SELECT * FROM empleados;

SELECT nombre, documento, domicilio FROM empleados;

SELECT documento, sexo, sueldobasico FROM empleados;
