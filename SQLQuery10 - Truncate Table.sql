/*

Un instituto de enseñanza almacena los datos de sus estudiantes en una tabla llamada "alumnos".
1- Elimine la tabla "alumnos" si existe:
 if object_id('alumnos') is not null
  drop table alumnos;

2- Cree la tabla con la siguiente estructura:
 create table alumnos(
  legajo int identity,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30)
 );

3- Ingrese los siguientes registros y muéstrelos para ver la secuencia de códigos:
 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');

4- Elimine todos los registros con "delete".

5- Ingrese los siguientes registros y selecciónelos para ver cómo SQL Server generó los códigos:
 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
 select * from alumnos;

6- Elimine todos los registros con "truncate table".

7- Ingrese los siguientes registros y muestre todos los registros para ver que SQL Server reinició 
la secuencia del campo "identity":
 insert into alumnos (documento,nombre,domicilio)
  values('22345345','Perez Mariana','Colon 234');
 insert into alumnos (documento,nombre,domicilio)
  values('23545345','Morales Marcos','Avellaneda 348');
 insert into alumnos (documento,nombre,domicilio)
  values('24356345','Gonzalez Analia','Caseros 444');
 insert into alumnos (documento,nombre,domicilio)
  values('25666777','Torres Ramiro','Dinamarca 209');
 select * from alumnos;

*/

-- 1
IF OBJECT_ID('alumnos') IS NOT NULL
	DROP TABLE alumnos;

-- 2
CREATE TABLE alumnos(
	legajo		INT IDENTITY,
	documento	VARCHAR(8),
	nombre		VARCHAR(30),
	domicilio	VARCHAR(30)
);

EXEC sp_columns alumnos;

-- 3
insert into alumnos (documento,nombre,domicilio)
values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
values('25666777','Torres Ramiro','Dinamarca 209');

-- 4
DELETE FROM alumnos;

-- 5
insert into alumnos (documento,nombre,domicilio)
values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
values('25666777','Torres Ramiro','Dinamarca 209');

SELECT * FROM alumnos;

-- 6
TRUNCATE TABLE alumnos;

-- 7
insert into alumnos (documento,nombre,domicilio)
values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
values('25666777','Torres Ramiro','Dinamarca 209');

SELECT * FROM alumnos;

/*

Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.
1- Elimine "articulos", si existe:
 if object_id('articulos') is not null
  drop table articulos;

2- Cree la tabla, con la siguiente estructura:
 create table articulos(
  codigo integer identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio float
 );

3- Ingrese algunos registros:
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C45',400.80);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);

4- Elimine todos los registros con "truncate table".

5- Ingrese algunos registros y muéstrelos para ver que la secuencia de códigos se reinicia:
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','ingles Biswal',100);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','español Biswal',90);
 select * from articulos;

6- Elimine todos los registros con "delete".

7- Ingrese algunos registros y muéstrelos para ver que la secuencia de códigos continua:
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','ingles Biswal',100);
 insert into articulos (nombre, descripcion, precio)
  values ('teclado','español Biswal',90);
 select * from articulos;

*/

-- 1
IF OBJECT_ID('articulos') IS NOT NULL
	DROP TABLE articulos;

-- 2
CREATE TABLE articulos(
	codigo			INT IDENTITY,
	nombre			VARCHAR(20),
	descripcion		VARCHAR(30),
	precio			FLOAT
);

EXEC sp_columns articulos;

-- 3
insert into articulos (nombre, descripcion, precio)
values ('impresora','Epson Stylus C45',400.80);
insert into articulos (nombre, descripcion, precio)
values ('impresora','Epson Stylus C85',500);

-- 4
TRUNCATE TABLE articulos;

-- 5
insert into articulos (nombre, descripcion, precio)
values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio)
values ('teclado','ingles Biswal',100);
insert into articulos (nombre, descripcion, precio)
values ('teclado','español Biswal',90);

SELECT * FROM articulos;

-- 6
DELETE FROM articulos;

-- 7
insert into articulos (nombre, descripcion, precio)
values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio)
values ('teclado','ingles Biswal',100);
insert into articulos (nombre, descripcion, precio)
values ('teclado','español Biswal',90);
 
SELECT * FROM articulos;
