/*

Trabaje con la tabla "agenda" que registra la información referente a sus amigos.

1- Elimine la tabla si existe:
 if object_id('agenda') is not null
  drop table agenda;

2- Cree la tabla con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11):
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

3- Ingrese los siguientes registros (insert into):
 Alvarez,Alberto,Colon 123,4234567,
 Juarez,Juan,Avellaneda 135,4458787,
 Lopez,Maria,Urquiza 333,4545454,
 Lopez,Jose,Urquiza 333,4545454,
 Salas,Susana,Gral. Paz 1234,4123456.

4- Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)

5- Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados):

6- Muestre la tabla.

7- Elimine todos los registros (2 registros afectados):

8- Muestre la tabla.

*/

-- 1
IF OBJECT_ID('agenda') IS NOT NULL
	DROP TABLE agenda;

-- 2
CREATE TABLE agenda(
	apellido	VARCHAR(30),
	nombre		VARCHAR(20),
	domicilio	VARCHAR(30),
	telefono	VARCHAR(11)
);

EXEC sp_columns agenda;

-- 3
insert into agenda (apellido,nombre,domicilio,telefono)
values('Alvarez','Alberto','Colon 123','4234567');
insert into agenda (apellido,nombre,domicilio,telefono)
values('Juarez','Juan','Avellaneda 135','4458787');
insert into agenda (apellido,nombre,domicilio,telefono)
values('Lopez','Maria','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono)
values('Lopez','Jose','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono)
values('Salas','Susana','Gral. Paz 1234','4123456');

-- 4
DELETE FROM agenda
WHERE nombre = 'Juan';

-- 5
DELETE FROM agenda
WHERE telefono = '4545454';

-- 6
SELECT * FROM agenda;

-- 7
DELETE FROM agenda;

-- 8
SELECT * FROM agenda;

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

3- Vea la estructura de la tabla.

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

5- Elimine los artículos cuyo precio sea mayor o igual a 500 (2 registros)
 delete from articulos
  where precio>=500;

6- Muestre la tabla.

7- Elimine todas las impresoras (1 registro)
 delete from articulos
  where nombre='impresora';

8- Elimine todos los artículos cuyo código sea diferente a 4 (1 registro)
 delete from articulos
  where codigo<>4;

9- Mostrar la tabla después que borra cada registro.

*/

-- 1 
IF OBJECT_ID('articulos') IS NOT NULL
	DROP TABLE articulos;

-- 2
CREATE TABLE articulos(
	codigo			INT,
	nombre			VARCHAR(20),
	descripcion		VARCHAR(30),
	precio			FLOAT,
	cantidad		INT
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
DELETE FROM articulos
WHERE precio >= 500;

-- 6
SELECT * FROM articulos;

-- 7
DELETE FROM articulos
WHERE nombre = 'impresora';

-- 8
DELETE FROM articulos
WHERE codigo <> 4;

-- 9
SELECT * FROM articulos;
