/*

Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".
1- Elimine la tabla si existe:
 if object_id ('empleados') is not null
  drop table empleados;

2- Cree la tabla:
 create table empleados(
  nombre varchar(30) not null,
  apellido varchar(20) not null,
  documento char(8),
  fechanacimiento datetime,
  fechaingreso datetime,
  sueldo decimal(6,2),
  primary key(documento)
 );

3- Ingrese algunos registros:
 insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
 insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
 insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
 insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
 insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

4- Muestre nombre y apellido concatenados, con el apellido en letras mayúsculas, el documento 
precedido por "DNI Nº " y el sueldo precedido por "$ ".

5- Muestre el documento y el sueldo redondeado hacia arriba y precedido por "$ ".

6- Muestre los nombres y apellidos de los empleados que cumplen años en el mes "october" (3 
registros)

7- Muestre los nombres y apellidos de los empleados que ingresaron en un determinado año (2 
registros).

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE empleados(
	nombre				VARCHAR(30) NOT NULL,
	apellido			VARCHAR(30) NOT NULL,
	documento			CHAR(8),
	fechanacimiento		DATETIME,
	fechaingreso		DATETIME,
	sueldo				DECIMAL(6, 2),
	PRIMARY KEY			(documento)
);

-- 3
insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98);

-- 4
SELECT nombre + SPACE(1) + UPPER(apellido) AS 'Nombre completo',
STUFF(documento, 1, 0, 'DNI Nº ') AS Documento,
STUFF(sueldo, 1, 0, '$ ') AS Sueldo
FROM empleados;

-- 5
SELECT documento, STUFF(CEILING(sueldo), 1, 0, '$ ')
FROM empleados;

-- 6
SELECT nombre, apellido FROM empleados
WHERE DATENAME(MONTH, fechanacimiento) = 'october';

-- 7
SELECT nombre, apellido FROM empleados
WHERE DATEPART(YEAR, fechaingreso) = 2000;