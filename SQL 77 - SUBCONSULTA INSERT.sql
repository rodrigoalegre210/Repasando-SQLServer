/*

Un comercio que vende artículos de librería y papelería almacena la información de sus ventas en una 
tabla llamada "facturas" y otra "clientes".
1- Elimine las tablas si existen:
 if object_id('facturas') is not null
  drop table facturas;
 if object_id('clientes') is not null
  drop table clientes;

2-Créelas:
 create table clientes(
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  primary key(codigo)
 );

 create table facturas(
  numero int not null,
  fecha datetime,
  codigocliente int not null,
  total decimal(6,2),
  primary key(numero),
  constraint FK_facturas_cliente
   foreign key (codigocliente)
   references clientes(codigo)
   on update cascade
 );

3-Ingrese algunos registros:
 insert into clientes values('Juan Lopez','Colon 123');
 insert into clientes values('Luis Torres','Sucre 987');
 insert into clientes values('Ana Garcia','Sarmiento 576');
 insert into clientes values('Susana Molina','San Martin 555');

 insert into facturas values(1200,'2007-01-15',1,300);
 insert into facturas values(1201,'2007-01-15',2,550);
 insert into facturas values(1202,'2007-01-15',3,150);
 insert into facturas values(1300,'2007-01-20',1,350);
 insert into facturas values(1310,'2007-01-22',3,100);

4- El comercio necesita una tabla llamada "clientespref" en la cual quiere almacenar el nombre y 
domicilio de aquellos clientes que han comprado hasta el momento más de 500 pesos en mercaderías. 
Elimine la tabla si existe y créela con esos 2 campos:
 if object_id ('clientespref') is not null
  drop table clientespref;
 create table clientespref(
  nombre varchar(30),
  domicilio varchar(30)
 );

5- Ingrese los registros en la tabla "clientespref" seleccionando registros de la tabla "clientes" y 
"facturas".

6- Vea los registros de "clientespref":
 select * from clientespref;

*/

-- 1
IF OBJECT_ID('facturas') IS NOT NULL
	DROP TABLE facturas;

IF OBJECT_ID('clientes') IS NOT NULL
	DROP TABLE clientes;

-- 2
CREATE TABLE clientes(
	codigo			INTEGER IDENTITY,
	nombre			VARCHAR(30),
	domicilio		VARCHAR(30),
	PRIMARY KEY		(codigo)
);

CREATE TABLE facturas(
	numero			INTEGER NOT NULL,
	fecha			DATETIME,
	codigocliente	INTEGER NOT NULL,
	total DECIMAL(6,2),
	PRIMARY KEY		(numero),
	CONSTRAINT FK_facturas_cliente
	FOREIGN KEY		(codigocliente)
	REFERENCES clientes(codigo)
	ON UPDATE CASCADE
);

-- 3
insert into clientes values('Juan Lopez','Colon 123');
insert into clientes values('Luis Torres','Sucre 987');
insert into clientes values('Ana Garcia','Sarmiento 576');
insert into clientes values('Susana Molina','San Martin 555');

insert into facturas values(1200,'2007-01-15',1,300);
insert into facturas values(1201,'2007-01-15',2,550);
insert into facturas values(1202,'2007-01-15',3,150);
insert into facturas values(1300,'2007-01-20',1,350);
insert into facturas values(1310,'2007-01-22',3,100);

-- 4
IF OBJECT_ID('clientespref') IS NOT NULL
	DROP TABLE clientespref;

CREATE TABLE clientespref(
	nombre		VARCHAR(30),
	domicilio	VARCHAR(30)
);

-- 5
INSERT INTO clientespref
SELECT nombre, domicilio
FROM clientes
WHERE codigo IN (SELECT f.codigocliente FROM clientes AS c
JOIN facturas AS f
ON c.codigo = f.codigocliente
GROUP BY codigocliente
HAVING SUM(total) > 500);

-- 6
SELECT * FROM clientespref;