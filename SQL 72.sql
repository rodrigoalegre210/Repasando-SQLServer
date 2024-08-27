/*

Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos y 
en otra tabla llamada "ciudades" los nombres de las ciudades.
1- Elimine las tablas si existen:
 if object_id('visitantes') is not null
  drop table visitantes;
 if object_id('ciudades') is not null
  drop table ciudades;

2- Cree las tablas:
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  codigociudad tinyint not null,
  mail varchar(30),
  montocompra decimal (6,2)
 );

 create table ciudades(
  codigo tinyint identity,
  nombre varchar(20)
 );
 
3- Ingrese algunos registros:
 insert into ciudades values('Cordoba');
 insert into ciudades values('Carlos Paz');
 insert into ciudades values('La Falda');
 insert into ciudades values('Cruz del Eje');

 insert into visitantes values 
   ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
 insert into visitantes values 
   ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
 insert into visitantes values 
   ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
 insert into visitantes values 
   ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
 insert into visitantes values 
   ('Alejandra Garcia',28,'f',null,2,null,280.50);
 insert into visitantes values 
   ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
 insert into visitantes values 
   ('Mariana Juarez',33,'f',null,2,null,90);

4- Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)

5- Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)

6- Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)

7- Obtenga el monto de compra más alto de cada ciudad (3 filas)

*/

-- 1
IF OBJECT_ID('visitantes') IS NOT NULL	
	DROP TABLE visitantes;

IF OBJECT_ID('ciudades') IS NOT NULL
	DROP TABLE ciudades;

-- 2
CREATE TABLE visitantes(
	nombre			VARCHAR(30),
	edad			TINYINT,
	sexo			CHAR(1) DEFAULT 'f',
	domicilio		VARCHAR(30),
	codigociudad	TINYINT NOT NULL,
	mail			VARCHAR(30),
	montocompra		DECIMAL(6,2)
);

CREATE TABLE ciudades(
	codigo		TINYINT IDENTITY,
	nombre		VARCHAR(20)
);

-- 3
insert into ciudades values('Cordoba');
insert into ciudades values('Carlos Paz');
insert into ciudades values('La Falda');
insert into ciudades values('Cruz del Eje');

insert into visitantes values 
('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
insert into visitantes values 
('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
insert into visitantes values 
('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
insert into visitantes values 
('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
insert into visitantes values 
('Alejandra Garcia',28,'f',null,2,null,280.50);
insert into visitantes values 
('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
insert into visitantes values 
('Mariana Juarez',33,'f',null,2,null,90);

-- 4
SELECT C.nombre AS Ciudad,
COUNT(*) AS Visitas
FROM ciudades AS C
JOIN visitantes AS V
ON V.codigociudad = C.codigo
GROUP BY C.nombre;

-- 5
SELECT C.nombre AS Ciudad, V.sexo AS Sexo,
AVG(V.montocompra) AS 'Compra Promedio'
FROM ciudades AS C
JOIN visitantes AS V
ON V.codigociudad = C.codigo
GROUP BY C.nombre, V.sexo;

-- 6
SELECT C.nombre AS Ciudad,
COUNT(V.mail) AS 'Tiene Mail'
FROM ciudades AS C
JOIN visitantes AS V
ON V.codigociudad = C.codigo
GROUP BY C.nombre;

-- 7
SELECT C.nombre AS Ciudad,
MAX(V.montocompra) AS 'Monto Maximo'
FROM ciudades AS C
JOIN visitantes AS V
ON V.codigociudad = C.codigo
GROUP BY C.nombre;