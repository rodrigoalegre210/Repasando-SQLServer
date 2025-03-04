/*

Un comercio almacena los datos de sus empleados en una tabla denominada "empleados".
1- Elimine la tabla si existe:
 if object_id ('empleados') is not null
  drop table empleados;

2- Defina un nuevo tipo de dato llamado "tipo_año". Primero debe eliminarlo, si existe para volver a 
crearlo:
 if exists (select *from systypes
  where name = 'tipo_año')
  exec sp_droptype tipo_año;

3- Cree un tipo de dato definido por el usuario llamado "tipo_año" basado en el tipo "int" que 
permita valores nulos:
 exec sp_addtype tipo_año, 'int','null';

4- Elimine la regla llamada "RG_año" si existe:
 if object_id ('RG_año') is not null
   drop rule RG_año;

5- Cree la regla que permita valores integer desde 1990 (fecha en que se inauguró el comercio) y el 
año actual:
 create rule RG_año
  as @año between 1990 and datepart(year,getdate());

6- Asocie la regla al tipo de datos "tipo_año":
 exec sp_bindrule RG_año, 'tipo_año';

7- Cree la tabla "empleados" con un campo del tipo creado anteriormente:
 create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

8- Intente ingresar un registro con un valor inválido para el campo "añoingreso":
 insert into empleados values('22222222','Juan Lopez',1980);
No lo permite.

9- Ingrese un registro con un valor válido para el campo "añoingreso":
 insert into empleados values('22222222','Juan Lopez',2000);

10- Intente eliminar la regla asociada al tipo de datos:
 drop rule RG_año;
No se puede porque está asociada a un tipo de datos.

11- Elimine la asociación:
 exec sp_unbindrule 'tipo_año';

12- Verifique que la asociación ha sido eliminada pero la regla sigue existiendo:
 sp_helpconstraint empleados;
 exec sp_help tipo_año;

13- Elimine la regla:
 drop rule RG_año;

14- Verifique que la regla ya no existe:
 exec sp_help RG_año;

15- Ingrese el registro que no pudo ingresar en el punto 8:
 insert into empleados values('22222222','Juan Lopez',1980);
Lo permite porque el tipo de dato ya no tiene asociada la regla.

16- Intente eliminar el tipo de datos "tipo_año":
 exec sp_droptype tipo_año;
No lo permite porque hay una tabla que lo utiliza.

17- Elimine la tabla "empleados":
 drop table empleados;

18- Verifique que el tipo de dato "tipo_año" aún existe:
 exec sp_help tipo_año;

19- Elimine el tipo de datos:
 exec sp_droptype tipo_año;

20- Verifique que el tipo de dato "tipo_año" ya no existe:
 exec sp_help tipo_año;

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
IF EXISTS(SELECT * FROM SYSTYPES
WHERE NAME = 'tipo_anio')
EXEC sp_droptype tipo_anio;

-- 3
EXEC sp_addtype tipo_anio, 'INTEGER', 'NULL';

-- 4
IF OBJECT_ID('RG_anio') IS NOT NULL
	DROP RULE RG_anio;

-- 5
CREATE RULE RG_anio
AS @año BETWEEN 1990 AND DATEPART(YEAR, GETDATE());

-- 6
EXEC sp_bindrule RG_anio, 'tipo_anio';

-- 7
CREATE TABLE empleados(
	documento		CHAR(8),
	nombre			VARCHAR(30),
	anioingreso		tipo_anio
);

-- 8
insert into empleados values('22222222','Juan Lopez',1980);

-- 9
insert into empleados values('22222222','Juan Lopez',2000);

-- 10
DROP RULE RG_anio;

-- 11
EXEC sp_unbindrule 'tipo_anio';

-- 12
EXEC sp_helpconstraint empleados;

EXEC sp_help tipo_anio;

-- 13
DROP RULE RG_anio;

-- 14
EXEC sp_help RG_anio;

-- 15
insert into empleados values('22222222','Juan Lopez',1980);

-- 16
EXEC sp_droptype tipo_anio;

-- 17
DROP TABLE empleados;

-- 18
EXEC sp_help tipo_anio;

-- 19
EXEC sp_droptype tipo_anio;

-- 20
EXEC sp_help tipo_anio;