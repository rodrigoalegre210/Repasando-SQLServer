/*

Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.
1- Elimine la tabla si existe:
 if object_id ('articulos') is not null
  drop table articulos;

2- Cree la tabla:
 create table articulos(
  codigo int identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
  primary key (codigo)
 );

3- Ingrese algunos registros:
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);

4- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los 
precios empleando operadores aritméticos.

5- Vea el resultado:
 select * from articulos;

6- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos 
separados por coma.

7- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-")

*/

-- 1
IF OBJECT_ID('articulos') IS NOT NULL
	DROP TABLE articulos;

-- 2
CREATE TABLE articulos(
	codigo			INT IDENTITY,
	nombre			VARCHAR(20),
	descripcion		VARCHAR(30),
	precio			SMALLMONEY,
	cantidad		TINYINT DEFAULT 0,
	PRIMARY KEY		(codigo)
);

-- 3
insert into articulos (nombre, descripcion, precio,cantidad)
values ('impresora','Epson Stylus C45',400.80,20);
insert into articulos (nombre, descripcion, precio)
values ('impresora','Epson Stylus C85',500);
insert into articulos (nombre, descripcion, precio)
values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio,cantidad)
values ('teclado','ingles Biswal',100,50);

-- 4
UPDATE articulos SET precio = precio + (precio * 0.15)

-- 5
SELECT * FROM articulos;

-- 6
SELECT nombre + ', ' + descripcion FROM articulos;

-- 7
UPDATE articulos SET cantidad = cantidad - 5
WHERE nombre = 'teclado';

SELECT * FROM articulos;