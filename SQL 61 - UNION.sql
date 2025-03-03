/*

Un supermercado almacena en una tabla denominada "proveedores" los datos de las compañías que le 
proveen de mercaderías; en una tabla llamada "clientes", los datos de los comercios que le compran y 
en otra tabla "empleados" los datos de los empleados.
1- Elimine las tablas si existen:
 if object_id('clientes') is not null
  drop table clientes;
 if object_id('proveedores') is not null
  drop table proveedores;
 if object_id('empleados') is not null
  drop table empleados;

2- Cree las tablas:
 create table proveedores(
  codigo int identity,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 create table clientes(
  codigo int identity,
  nombre varchar (30),
  domicilio varchar(30),
  primary key(codigo)
 );
 create table empleados(
  documento char(8) not null,
  nombre varchar(20),
  apellido varchar(20),
  domicilio varchar(30),
  primary key(documento)
 );

3- Ingrese algunos registros:
 insert into proveedores values('Bebida cola','Colon 123');
 insert into proveedores values('Carnes Unica','Caseros 222');
 insert into proveedores values('Lacteos Blanca','San Martin 987');
 insert into clientes values('Supermercado Lopez','Avellaneda 34');
 insert into clientes values('Almacen Anita','Colon 987');
 insert into clientes values('Garcia Juan','Sucre 345');
 insert into empleados values('23333333','Federico','Lopez','Colon 987');
 insert into empleados values('28888888','Ana','Marquez','Sucre 333');
 insert into empleados values('30111111','Luis','Perez','Caseros 956');

4- El supermercado quiere enviar una tarjeta de salutación a todos los proveedores, clientes y 
empleados y necesita el nombre y domicilio de todos ellos. Emplee el operador "union" para obtener 
dicha información de las tres tablas.

5- Agregue una columna con un literal para indicar si es un proveedor, un cliente o un empleado y 
ordene por dicha columna.

*/

-- 1
IF OBJECT_ID('clientes') IS NOT NULL
	DROP TABLE clientes;

IF OBJECT_ID('proveedores') IS NOT NULL
	DROP TABLE proveedores;

IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE proveedores(
	codigo			INTEGER IDENTITY,
	nombre			VARCHAR(30),
	domicilio		VARCHAR(30),
	PRIMARY KEY		(codigo)
);

CREATE TABLE clientes(
	codigo			INTEGER IDENTITY,
	nombre			VARCHAR(30),
	domicilio		VARCHAR(30),
	PRIMARY KEY		(codigo)
);

CREATE TABLE empleados(
	documento		CHAR(8) NOT NULL,
	nombre			VARCHAR(20),
	apellido		VARCHAR(20),
	domicilio		VARCHAR(30),
	PRIMARY KEY		(documento)
);

-- 3
insert into proveedores values('Bebida cola','Colon 123');
insert into proveedores values('Carnes Unica','Caseros 222');
insert into proveedores values('Lacteos Blanca','San Martin 987');
insert into clientes values('Supermercado Lopez','Avellaneda 34');
insert into clientes values('Almacen Anita','Colon 987');
insert into clientes values('Garcia Juan','Sucre 345');
insert into empleados values('23333333','Federico','Lopez','Colon 987');
insert into empleados values('28888888','Ana','Marquez','Sucre 333');
insert into empleados values('30111111','Luis','Perez','Caseros 956');

-- 4
SELECT nombre AS Nombre,
domicilio AS Domicilio
FROM proveedores
UNION
SELECT nombre, domicilio
FROM clientes
UNION
SELECT (apellido + ' ' + nombre), domicilio
FROM empleados;

-- 5
SELECT nombre AS Nombre,
domicilio AS Domicilio,
'Proveedor' AS Categoria
FROM proveedores
UNION
SELECT nombre, domicilio, 'Cliente'
FROM clientes
UNION
SELECT (apellido + ' ' + nombre), domicilio, 'Empleado'
FROM empleados
ORDER BY Categoria;