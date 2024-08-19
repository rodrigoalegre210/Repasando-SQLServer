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

3- Vea la informaci�n de los �ndices de "alumnos".

4- Modif�quelo agregando el campo "nombre".

5- Verifique que se modific�:
 exec sp_helpindex alumnos;

6- Establezca una restricci�n "unique" para el campo "documento".

7- Vea la informaci�n que muestra "sp_helpindex":
  exec sp_helpindex alumnos;

8- Intente modificar con "drop_existing" alguna caracter�stica del �ndice que se cre� 
autom�ticamente al agregar la restricci�n "unique":
 create clustered index UQ_alumnos_documento
  on alumnos(documento)
  with drop_existing;
No se puede emplear "drop_existing" con �ndices creados a partir de una restricci�n.

9- Cree un �ndice no agrupado para el campo "legajo".

10- Muestre todos los �ndices:
 exec sp_helpindex alumnos;

11- Convierta el �ndice creado en el punto 9 a agrupado conservando las dem�s caracter�sticas.

12- Verifique que se modific�:
 exec sp_helpindex alumnos;

13- Intente convertir el �ndice "I_alumnos_legajo" a no agrupado:
 create nonclustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing;
No se puede convertir un �ndice agrupado en no agrupado.

14- Modifique el �ndice "I_alumnos_apellido" quit�ndole el campo "nombre".

15- Intente convertir el �ndice "I_alumnos_apellido" en agrupado:
 create clustered index I_alumnos_apellido
  on alumnos(apellido)
  with drop_existing;
No lo permite porque ya existe un �ndice agrupado.

16- Modifique el �ndice "I_alumnos_legajo" para que sea �nico y conserve todas las otras 
caracter�sticas.

17- Verifique la modificaci�n:
 exec sp_helpindex alumnos;

18- Modifique nuevamente el �ndice "I_alumnos_legajo" para que no sea �nico y conserve las dem�s 
caracter�sticas.

19- Verifique la modificaci�n:
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
CREATE NONCLUSTERED INDEX I_alumnos_apellido
ON alumnos(apellido);

-- 3
exec sp_helpindex alumnos;

-- 4
CREATE NONCLUSTERED INDEX I_alumnos_apellido
ON alumnos(apellido, nombre)
WITH DROP_EXISTING;

-- 5
exec sp_helpindex alumnos;

-- 6
ALTER TABLE alumnos
ADD CONSTRAINT UQ_alumnos_documento
UNIQUE (documento);

-- 7
exec sp_helpindex alumnos;

-- 8
CREATE CLUSTERED INDEX UQ_alumnos_documento
ON alumnos(documento)
WITH DROP_EXISTING;

-- 9
CREATE NONCLUSTERED INDEX I_alumnos_legajo
ON alumnos(legajo);

-- 10
exec sp_helpindex alumnos;

-- 11
CREATE CLUSTERED INDEX I_alumnos_legajo
ON alumnos(legajo)
WITH DROP_EXISTING;

-- 12
exec sp_helpindex alumnos;

-- 13
CREATE NONCLUSTERED INDEX I_alumnos_legajo
ON alumnos(legajo)
WITH DROP_EXISTING;

-- 14
CREATE NONCLUSTERED INDEX I_alumnos_apellido
ON alumnos(apellido)
WITH DROP_EXISTING;

-- 15
CREATE CLUSTERED INDEX I_alumnos_apellido
ON alumnos(apellido)
WITH DROP_EXISTING;

-- 16
CREATE UNIQUE CLUSTERED INDEX I_alumnos_legajo
ON alumnos(legajo)
WITH DROP_EXISTING;

-- 17
exec sp_helpindex alumnos;

-- 18
CREATE CLUSTERED INDEX I_alumnos_legajo
ON alumnos(legajo)
WITH DROP_EXISTING;

-- 19
exec sp_helpindex alumnos;