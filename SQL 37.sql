/*

Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.
1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

2- Cree la tabla con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 );

3- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

4- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)

5- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)

6- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)

7- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)

8- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)

9- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas):

10- Realice la misma consulta anterior, pero use la palabra clave "all" para mostrar todos los 
valores de ciudad, incluyendo las que devuelven cero o "null" en la columna de agregado (4 filas)

*/

-- 1
IF OBJECT_ID('visitantes') IS NOT NULL
	DROP TABLE visitantes;

-- 2
CREATE TABLE visitantes(
	nombre			VARCHAR(30),
	edad			TINYINT,
	sexo			CHAR(1) DEFAULT 'f',
	domicilio		VARCHAR(30),
	ciudad			VARCHAR(20) DEFAULT 'Cordoba',
	telefono		VARCHAR(11),
	mail			VARCHAR(50) DEFAULT 'No tiene',
	montocompra		DECIMAL(6,2)
);

-- 3
insert into visitantes
values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
insert into visitantes
values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
insert into visitantes
values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
insert into visitantes (nombre, edad,sexo,telefono, mail)
values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
insert into visitantes (nombre, ciudad, montocompra)
values ('Alejandra Gonzalez','La Falda',280.50);
insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
insert into visitantes
values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
insert into visitantes
values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

-- 4
SELECT ciudad AS Ciudad,
COUNT(*) AS 'Cantidad de Visitantes'
FROM visitantes
GROUP BY ciudad;

-- 5
SELECT ciudad AS Ciudad, 
COUNT(telefono) AS 'Con Telefono'
FROM visitantes
GROUP BY ciudad;

-- 6
SELECT sexo AS Sexo,
SUM(montocompra) AS 'Monto Total'
FROM visitantes
GROUP BY sexo;

-- 7
SELECT sexo AS Sexo, ciudad AS Ciudad,
MAX(montocompra) AS 'Monto Max Compra',
MIN(montocompra) AS 'Monto Min Compra'
FROM visitantes
GROUP BY sexo, ciudad;

-- 8
SELECT ciudad AS Ciudad,
AVG(montocompra) AS 'Compra Promedio'
FROM visitantes
GROUP BY ciudad;

-- 9
SELECT ciudad AS Ciudad,
COUNT(*) AS 'Cantidad Con Mail'
FROM visitantes
WHERE mail IS NOT NULL AND mail <> 'No tiene'
GROUP BY ciudad;

-- 10
SELECT ciudad AS Ciudad,
COUNT(*) AS 'Cantidad Con Mail'
FROM visitantes
WHERE mail IS NOT NULL AND mail <> 'No tiene'
GROUP BY ALL ciudad;

/*

Una empresa almacena los datos de sus empleados en una tabla "empleados".
1- Elimine la tabla, si existe:
 if object_id('empleados') is not null
  drop table empleados;

2- Cree la tabla:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  fechaingreso datetime,
  primary key(documento)
 );

3- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
 insert into empleados
  values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
 insert into empleados
  values('Andres Costa','28444555',default,'Secretaria',null,null,null);

4- Cuente la cantidad de empleados agrupados por sección (5 filas)

5- Calcule el promedio de hijos por sección (5 filas):

6- Cuente la cantidad de empleados agrupados por año de ingreso (6 filas)

7- Calcule el promedio de sueldo por sección de los empleados con hijos (4 filas)

8- Realice la misma consulta anterior pero esta vez incluya las secciones que devuelven cero o 
"null" en la columna de agregado (5 filas)

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE empleados(
	nombre			VARCHAR(30),
	documento		CHAR(8),
	domicilio		VARCHAR(30),
	seccion			VARCHAR(20),
	sueldo			DECIMAL(6,2),
	cantidadhijos	TINYINT,
	fechaingreso	DATETIME,
	PRIMARY KEY		(documento)
);

-- 3
insert into empleados
values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10');
insert into empleados
values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12');
insert into empleados
values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25');
insert into empleados
values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25');
insert into empleados
values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01');
insert into empleados
values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01');
insert into empleados
values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01');
insert into empleados
values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01');
insert into empleados
values('Andres Costa','28444555',default,'Secretaria',null,null,null);

-- 4
SELECT seccion AS Seccion, 
COUNT(*) AS Empleados
FROM empleados
GROUP BY seccion;

-- 5
SELECT seccion AS Seccion,
AVG(cantidadhijos) AS 'Hijos Promedio'
FROM empleados
GROUP BY seccion;

-- 6
SELECT DATEPART(YEAR, fechaingreso) AS 'Año de ingreso',
COUNT(*) AS Empleados
FROM empleados
GROUP BY DATEPART(YEAR, fechaingreso);

-- 7
SELECT seccion AS Seccion,
AVG(sueldo) AS 'Sueldo Promedio'
FROM empleados
WHERE cantidadhijos > 0 AND cantidadhijos IS NOT NULL
GROUP BY seccion;

-- 8
SELECT seccion AS Seccion,
AVG(sueldo) AS 'Sueldo Promedio'
FROM empleados
WHERE cantidadhijos > 0 AND cantidadhijos IS NOT NULL
GROUP BY ALL seccion;