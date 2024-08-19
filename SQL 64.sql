/*

Un profesor guarda algunos datos de sus alumnos en una tabla llamada "alumnos".
1- Elimine la tabla si existe y cr�ela con la siguiente estructura:
 if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 );

2- Cree un �ndice no agrupado para el campo "apellido".

3- Establezca una restricci�n "primary" para el campo "legajo" y especifique que cree un �ndice 
"agrupado".

4- Vea la informaci�n que muestra "sp_helpindex":
  exec sp_helpindex alumnos;

5- Intente eliminar el �ndice "PK_alumnos_legajo" con "drop index":
 drop index PK_alumnos_legajo;
No se puede.

6- Intente eliminar el �ndice "I_alumnos_apellido" sin especificar el nombre de la tabla:
 drop index I_alumnos_apellido;
Mensaje de error.

7- Elimine el �ndice "I_alumnos_apellido" especificando el nombre de la tabla.

8- Verifique que se elimin�:
 exec sp_helpindex alumnos;

9- Solicite que se elimine el �ndice "I_alumnos_apellido" si existe:
 if exists (select name from sysindexes
  where name = 'I_alumnos_apellido')
   drop index alumnos.I_alumnos_apellido;

10- Elimine el �ndice "PK_alumnos_legajo" (quite la restricci�n).

11- Verifique que el �ndice "PK_alumnos_legajo" ya no existe:
 exec sp_helpindex alumnos;

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
CREATE NONCLUSTERED INDEX I_alumnos_apellidos
ON alumnos(apellido);

-- 3
ALTER TABLE alumnos
ADD CONSTRAINT PK_alumnos_legajo
PRIMARY KEY CLUSTERED (legajo);

-- 4
exec sp_helpindex alumnos;

-- 5
DROP INDEX PK_alumnos_legajo;

-- 6
DROP INDEX I_alumnos_apellidos;

-- 7
DROP INDEX alumnos.I_alumnos_apellidos;

-- 8
exec sp_helpindex alumnos;

-- 9
IF EXISTS(SELECT NAME FROM SYSINDEXES
WHERE NAME = 'I_alumnos_apellidos')
DROP INDEX alumnos.I_alumnos_apellidos;

-- 10
ALTER TABLE alumnos
DROP PK_alumnos_legajo;

-- 11
exec sp_helpindex alumnos;