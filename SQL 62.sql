/*

Un profesor guarda algunos datos de sus alumnos en una tabla llamada "alumnos".
1- Elimine la tabla si existe y créela con la siguiente estructura:
 if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

2- Ingresamos algunos registros:
 insert into alumnos values ('A123','22222222','Perez','Patricia',5.50);
 insert into alumnos values ('A234','23333333','Lopez','Ana',9);
 insert into alumnos values ('A345','24444444','Garcia','Carlos',8.5);
 insert into alumnos values ('A348','25555555','Perez','Daniela',7.85);
 insert into alumnos values ('A457','26666666','Perez','Fabian',3.2);
 insert into alumnos values ('A589','27777777','Gomez','Gaston',6.90);

3- Intente crear un índice agrupado único para el campo "apellido".
No lo permite porque hay valores duplicados.

4- Cree un índice agrupado, no único, para el campo "apellido".

5- Intente establecer una restricción "primary key" al campo "legajo" especificando que cree un 
índice agrupado.
No lo permite porque ya existe un índice agrupado y solamente puede haber uno por tabla.

6- Establezca la restricción "primary key" al campo "legajo" especificando que cree un índice NO 
agrupado.

7- Vea los índices de "alumnos":
 exec sp_helpindex alumnos;
2 índices: uno "I_alumnos_apellido", agrupado, con "apellido" y otro "PK_alumnos_legajo", no 
agrupado, unique, con "legajo" que se creó automáticamente al crear la restricción "primary key".

8- Analice la información que muestra "sp_helpconstraint":
 exec sp_helpconstraint libros;
En la columna "constraint_type" aparece "PRIMARY KEY" y entre paréntesis, el tipo de índice creado.

9- Cree un índice unique no agrupado para el campo "documento".

10- Intente ingresar un alumno con documento duplicado.
No lo permite.

11- Veamos los indices de "alumnos".
Aparecen 3 filas, uno por cada índice.

12- Cree un índice compuesto para el campo "apellido" y "nombre".
Se creará uno no agrupado porque no especificamos el tipo, además, ya existe uno agrupado y 
solamente puede haber uno por tabla.

13- Consulte la tabla "sysindexes", para ver los nombres de todos los índices creados para 
"alumnos":
 select name from sysindexes
  where name like '%alumnos%';
4 índices.

14- Cree una restricción unique para el campo "documento".

15- Vea la información de "sp_helpconstraint".

16- Vea los índices de "alumnos".
Aparecen 5 filas, uno por cada índice.

17- Consulte la tabla "sysindexes", para ver los nombres de todos los índices creados para 
"alumnos":
 select name from sysindexes
  where name like '%alumnos%';
5 índices.

18- Consulte la tabla "sysindexes", para ver los nombres de todos los índices creados por usted:
 select name from sysindexes
  where name like 'I_%';
3 índices. Recuerde que los índices que crea SQL Server automáticamente al agregarse una restricción 
"primary" o "unique" no comienzan con "I_".

*/

-- 1
IF OBJECT_ID('alumnos') IS NOT NULL
	DROP TABLE alumnos;

CREATE TABLE alumnos(
	legajo			CHAR(5) NOT NULL,
	documento		CHAR(8) NOT NULL,
	apellido		VARCHAR(30),
	nombre			VARCHAR(30),
	notafinal		DECIMAL(4,2)
);

-- 2
insert into alumnos values ('A123','22222222','Perez','Patricia',5.50);
insert into alumnos values ('A234','23333333','Lopez','Ana',9);
insert into alumnos values ('A345','24444444','Garcia','Carlos',8.5);
insert into alumnos values ('A348','25555555','Perez','Daniela',7.85);
insert into alumnos values ('A457','26666666','Perez','Fabian',3.2);
insert into alumnos values ('A589','27777777','Gomez','Gaston',6.90);

-- 3
CREATE UNIQUE CLUSTERED INDEX I_alumnos_apellido
ON alumnos(apellido);

-- 4
CREATE CLUSTERED INDEX I_alumnos_apellido
ON alumnos(apellido);

-- 5
ALTER TABLE alumnos
ADD CONSTRAINT PK_alumnos_legajo
PRIMARY KEY CLUSTERED (legajo);

-- 6
ALTER TABLE alumnos
ADD CONSTRAINT PK_alumnos_legajo
PRIMARY KEY NONCLUSTERED (legajo);

-- 7
exec sp_helpindex alumnos;

-- 8
exec sp_helpconstraint alumnos;

-- 9
CREATE UNIQUE NONCLUSTERED INDEX I_alumnos_documento
ON alumnos(documento);

-- 10
insert into alumnos values ('A331','25555555','Perez','Daniela',7.85);

-- 11
exec sp_helpindex alumnos;

-- 12
CREATE INDEX I_alumnos_apellidonombre
ON alumnos(apellido, nombre);

-- 13
SELECT NAME FROM SYSINDEXES
WHERE NAME LIKE '%alumnos%';

-- 14
ALTER TABLE alumnos
ADD CONSTRAINT UQ_alumnos_documento
UNIQUE (documento);

-- 15
exec sp_helpconstraint alumnos;

-- 16
exec sp_helpindex alumnos;

-- 17
SELECT NAME FROM SYSINDEXES
WHERE NAME LIKE '%alumnos%';

-- 18
SELECT NAME FROM SYSINDEXES
WHERE NAME LIKE 'I_%';