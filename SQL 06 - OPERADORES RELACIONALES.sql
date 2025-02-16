/*

Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.

1- Elimine "articulos", si existe:
 if object_id('articulos') is not null
  drop table articulos;

2- Cree la tabla, con la siguiente estructura:
 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

3- Vea la estructura de la tabla (sp_columns).

4- Ingrese algunos registros:
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

5- Seleccione los datos de las impresoras (2 registros)

6- Seleccione los artículos cuyo precio sea mayor o igual a 400 (3 registros)

7- Seleccione el código y nombre de los artículos cuya cantidad sea menor a 30 (2 registros)

8- Selecciones el nombre y descripción de los artículos que NO cuesten $100 (4 registros)

*/

-- 1
IF OBJECT_ID('articulos') IS NOT NULL
	DROP TABLE articulos;

-- 2
CREATE TABLE articulos(
	codigo			INTEGER,
	nombre			VARCHAR(20),
	descripcion		VARCHAR(30),
	precio			FLOAT,
	cantidad		INTEGER
);

-- 3
EXEC sp_columns articulos;

-- 4
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (1,'impresora','Epson Stylus C45',400.80,20);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (2,'impresora','Epson Stylus C85',500,30);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (3,'monitor','Samsung 14',800,10);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (4,'teclado','ingles Biswal',100,50);
insert into articulos (codigo, nombre, descripcion, precio,cantidad)
values (5,'teclado','español Biswal',90,50);

-- 5
SELECT * FROM articulos
WHERE nombre = 'impresora';

-- 6
SELECT * FROM articulos
WHERE precio >= 400;

-- 7
SELECT codigo, nombre FROM articulos
WHERE cantidad < 30;

-- 8
SELECT nombre, descripcion FROM articulos
WHERE precio <> 100;

/*

Un video club que alquila películas en video almacena la información de sus películas en alquiler en 
una tabla denominada "peliculas".

1- Elimine la tabla, si existe.

2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table peliculas(
  titulo varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

3- Ingrese los siguientes registros:
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',120,3);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',180,4);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Mujer bonita','Julia R.',90,1);
 insert into peliculas (titulo, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',80,2);

4- Seleccione las películas cuya duración no supere los 90 minutos (2 registros)

5- Seleccione el título de todas las películas en las que el actor NO sea "Tom Cruise" (2 
registros)

6- Muestre todos los campos, excepto "duracion", de todas las películas de las que haya más de 2 
copias (2 registros)

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
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mision imposible','Tom Cruise',120,3);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mision imposible 2','Tom Cruise',180,4);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Mujer bonita','Julia R.',90,1);
insert into peliculas (titulo, actor, duracion, cantidad)
values ('Elsa y Fred','China Zorrilla',80,2);

-- 4
SELECT * FROM peliculas
WHERE duracion <= 90;

-- 5
SELECT titulo FROM peliculas
WHERE actor <> 'Tom Cruise';

-- 6
SELECT titulo, actor, cantidad FROM peliculas
WHERE cantidad > 2;