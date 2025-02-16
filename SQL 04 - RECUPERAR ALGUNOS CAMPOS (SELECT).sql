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

-- 1
IF OBJECT_ID('peliculas') IS NOT NULL
	DROP TABLE peliculas;

-- 2
CREATE TABLE peliculas(
	titulo		VARCHAR(20),
	actor		VARCHAR(20),
	duracion	INTEGER,
	cantidad	INTEGER
);

-- 3
EXEC sp_columns peliculas;

-- 4
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mision imposible','Tom Cruise',180,3);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mision imposible 2','Tom Cruise',190,2);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mujer bonita','Julia Roberts',118,3);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Elsa y Fred','China Zorrilla',110,2);

-- 5
SELECT titulo, actor FROM peliculas;

-- 6
SELECT titulo, duracion FROM peliculas;

-- 7
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

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE empleados(
	nombre			VARCHAR(20),
	documento		VARCHAR(8),
	sexo			VARCHAR(1),
	domicilio		VARCHAR(30),
	sueldobasico	FLOAT
);

-- 3
EXEC sp_columns empleados;

-- 4
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
values ('Juan Juarez','22333444','m','Sarmiento 123',500);
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
values ('Ana Acosta','27888999','f','Colon 134',700);
insert into empleados (nombre, documento, sexo, domicilio, sueldobasico)
values ('Carlos Caseres','31222333','m','Urquiza 479',850);

-- 5
SELECT * FROM empleados;

-- 6
SELECT nombre, documento, domicilio FROM empleados;

-- 7
SELECT documento, sexo, sueldobasico FROM empleados;