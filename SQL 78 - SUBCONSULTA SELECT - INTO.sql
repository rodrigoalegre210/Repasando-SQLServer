/*

Un supermercado almacena los datos de sus empleados en una tabla denominada "empleados" y en una 
tabla llamada "sucursales" los códigos y ciudades de las diferentes sucursales.
1- Elimine las tablas "empleados" y "sucursales" si existen:
 if object_id('empleados')is not null
  drop table empleados;
 if object_id('sucursales')is not null
  drop table sucursales;

2- Cree la tabla "sucursales":
 create table sucursales( 
  codigo int identity,
  ciudad varchar(30) not null,
  primary key(codigo)
 ); 

3- Cree la tabla "empleados":
 create table empleados( 
  documento char(8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  codigosucursal int,
  primary key(documento),
  constraint FK_empleados_sucursal
   foreign key (codigosucursal)
   references sucursales(codigo)
   on update cascade
 ); 

4- Ingrese algunos registros para ambas tablas:
 insert into sucursales values('Cordoba');
 insert into sucursales values('Villa Maria');
 insert into sucursales values('Carlos Paz');
 insert into sucursales values('Cruz del Eje');

 insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
 insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
 insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
 insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
 insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
 insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
 insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
 insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

5- Realice un join para mostrar todos los datos de "empleados" incluyendo la ciudad de la sucursal:
 select documento,nombre,domicilio,seccion,sueldo,ciudad
  from empleados
  join sucursales on codigosucursal=codigo;

6-Cree una tabla llamada "secciones" que contenga las secciones de la empresa (primero elimínela, si 
existe):
 if object_id('secciones') is not null
  drop table secciones;

 select distinct seccion as nombre
  into secciones
  from empleados;

7- Recupere la información de "secciones":
 select *from secciones;
3 registros.

8- Se necesita una nueva tabla llamada "sueldosxseccion" que contenga la suma de los sueldos de los 
empleados por sección. Primero elimine la tabla, si existe:
 if object_id('sueldosxseccion') is not null
  drop table sueldosxseccion;

 select seccion, sum(sueldo) as total
  into sueldosxseccion
  from empleados
  group by seccion;

9- Recupere los registros de la nueva tabla:
 select *from sueldosxseccion;

10- Se necesita una tabla llamada "maximossueldos" que contenga los mismos campos que "empleados" y 
guarde los 3 empleados con sueldos más altos. Primero eliminamos, si existe, la tabla 
"maximossueldos":
 if object_id('maximossueldos') is not null
  drop table maximossueldos;

  select top 3 *
  into maximossueldos
  from empleados
  order by sueldo;

11- Vea los registros de la nueva tabla:
 select *from maximossueldos;

12- Se necesita una nueva tabla llamada "sucursalCordoba" que contenga los nombres y sección de los 
empleados de la ciudad de Córdoba. En primer lugar, eliminamos la tabla, si existe. Luego, consulte 
las tablas "empleados" y "sucursales" y guarde el resultado en la nueva tabla:
 if object_id('sucursalCordoba') is not null
  drop table sucursalCordoba;

 select nombre,ciudad
  into sucursalCordoba
  from empleados
  join sucursales
  on codigosucursal=codigo
  where ciudad='Cordoba';

13- Consulte la nueva tabla:
 select *from sucursalCordoba;

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

IF OBJECT_ID('sucursales') IS NOT NULL
	DROP TABLE sucursales;

-- 2
CREATE TABLE sucursales(
	codigo			INTEGER IDENTITY,
	ciudad			VARCHAR(30) NOT NULL,
	PRIMARY KEY		(codigo)
);

-- 3
CREATE TABLE empleados(
	documento		CHAR(8) NOT NULL,
	nombre			VARCHAR(30) NOT NULL,
	domicilio		VARCHAR(30),
	seccion			VARCHAR(20),
	sueldo			DECIMAL(6,2),
	codigosucursal	INTEGER NOT NULL,
	PRIMARY KEY		(documento),
	CONSTRAINT FK_empleados_sucursal
	FOREIGN KEY		(codigosucursal)
	REFERENCES sucursales(codigo)
	ON UPDATE CASCADE
);

-- 4
insert into sucursales values('Cordoba');
insert into sucursales values('Villa Maria');
insert into sucursales values('Carlos Paz');
insert into sucursales values('Cruz del Eje');

insert into empleados values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1);
insert into empleados values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1);
insert into empleados values('24444444','Diana Dominguez','Dinamarca 333','Secretaria',550,2);
insert into empleados values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2);
insert into empleados values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3);
insert into empleados values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4);
insert into empleados values('28888888','Luis Lopez','Lules 888','Sistemas',780,4);
insert into empleados values('29999999','Maria Morales','Marina 999','Contaduria',670,4);

-- 5
SELECT e.nombre AS Nombre,
e.domicilio AS Domicilio,
e.seccion AS Seccion,
s.ciudad AS Sucursal,
e.sueldo AS Sueldo
FROM empleados AS e
JOIN sucursales AS s ON e.codigosucursal = s.codigo;

-- 6
IF OBJECT_ID('secciones') IS NOT NULL
	DROP TABLE secciones;

SELECT DISTINCT seccion AS nombre
INTO secciones
FROM empleados;

-- 7
SELECT * FROM secciones;

-- 8
IF OBJECT_ID('sueldosxseccion') IS NOT NULL
	DROP TABLE sueldosxseccion;

SELECT seccion, SUM(sueldo) AS total
INTO sueldosxseccion
FROM empleados
GROUP BY seccion;

-- 9
SELECT * FROM sueldosxseccion;

-- 10
IF OBJECT_ID('maximossueldos') IS NOT NULL
	DROP TABLE maximossueldos;

SELECT TOP 3 *
INTO maximossueldos
FROM empleados
ORDER BY sueldo DESC;

-- 11
SELECT * FROM maximossueldos;

-- 12
IF OBJECT_ID('sucursalCordoba') IS NOT NULL
	DROP TABLE sucursalCordoba;

SELECT e.nombre AS Nombre,
e.seccion AS Seccion
INTO sucursalCordoba
FROM empleados AS e
JOIN sucursales AS s ON e.codigosucursal = s.codigo
WHERE ciudad = 'Cordoba';

-- 13
SELECT * FROM sucursalCordoba;