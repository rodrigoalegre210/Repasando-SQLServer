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
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );

3- Ingrese algunos registros:
 insert into empleados
  values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
 insert into empleados
  values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
 insert into empleados
  values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

4- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (3 registros)

5- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)

6- Seleccione todos los empleados cuyo documento finalice en 0,2,4,6 u 8 (4 registros)

7- Seleccione todos los empleados cuyo documento NO comience con 1 ni 3 y cuyo nombre finalice en 
"ez" (2 registros)

8- Recupere todos los nombres que tengan una "y" o una "j" en su nombre o apellido (3 registros)

9- Muestre los nombres y sección de los empleados que pertenecen a secciones que comiencen con "S" o 
"G" y tengan 8 caracteres (3 registros)

10- Muestre los nombres y sección de los empleados que pertenecen a secciones que NO comiencen con 
"S" o "G" (2 registros)

11- Muestre todos los nombres y sueldos de los empleados cuyos sueldos incluyen centavos (3 
registros)

12- Muestre los empleados que hayan ingresado en "1990" (3 registros)

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE empleados(
	nombre			VARCHAR(30),
	documento		CHAR(8),
	domicilio		VARCHAR(30),
	fechaingreso	DATETIME,
	seccion			VARCHAR(20),
	sueldo			DECIMAL(6, 2),
	PRIMARY KEY		(documento)
);

-- 3
insert into empleados
values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50);
insert into empleados
values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30);
insert into empleados
values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790);
insert into empleados
values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550);
insert into empleados
values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70);
insert into empleados
values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400);
insert into empleados
values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

-- 4
SELECT * FROM empleados
WHERE nombre LIKE '%Perez%';

-- 5
SELECT * FROM empleados
WHERE domicilio LIKE 'Co%8%';

-- 6
SELECT * FROM empleados
WHERE documento LIKE '%[0, 2, 4, 6, 8]';

-- 7
SELECT * FROM empleados
WHERE documento LIKE '[^13]%' AND nombre LIKE '%ez';

-- 8
SELECT nombre FROM empleados
WHERE nombre LIKE '%[yj]%'

-- 9
SELECT nombre, seccion FROM empleados
WHERE seccion LIKE '[SG]_______';

-- 10
SELECT nombre, seccion FROM empleados
WHERE seccion NOT LIKE '[SG]%';

-- 11
SELECT nombre, sueldo FROM empleados
WHERE sueldo NOT LIKE '%.00';

-- 12
SELECT * FROM empleados
WHERE fechaingreso LIKE '%1990%';