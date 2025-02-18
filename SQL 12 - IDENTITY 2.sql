/*

Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".
1- Elimine la tabla,si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente comenzando en 
10 e incrementándose en 1:
 create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

3- Ingrese los siguientes registros:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

4- Verifique que SQL Server generó valores para el campo "código" de modo automático:
 select *from medicamentos;

5- Intente ingresar un registro con un valor para el campo "codigo".

6- Setee la opción "identity_insert" en "on"

7- Ingrese un nuevo registro sin valor para el campo "codigo" (no lo permite):
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

8- Ingrese un nuevo registro con valor para el campo "codigo" repetido.

9- Use la función "ident_seed()" para averiguar el valor de inicio del campo "identity" de la tabla 
"medicamentos"

10- Emplee la función "ident_incr()" para saber cuál es el valor de incremento del campo "identity" 
de "medicamentos"

*/

-- 1
IF OBJECT_ID('medicamentos') IS NOT NULL
	DROP TABLE medicamentos;

-- 2
CREATE TABLE medicamentos(
	codigo			INTEGER IDENTITY(10, 1),
	nombre			VARCHAR(20) NOT NULL,
	laboratorio		VARCHAR(20),
	precio			FLOAT,
	cantidad		INTEGER
);

-- 3
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Amoxidal 500','Bayer',15.60,100);

-- 4
SELECT * FROM medicamentos;

-- 5
insert into medicamentos (codigo, nombre, laboratorio,precio,cantidad)
values(13, 'Amoxidal 500','Bayer',15.60,100);

-- 6
SET IDENTITY_INSERT medicamentos ON;

-- 7
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Amoxilina 500','Bayer',15.60,100);

-- 8
insert into medicamentos (codigo, nombre, laboratorio,precio,cantidad)
values(12, 'Amoxidal 500','Bayer',15.60,100);

-- 9
SELECT IDENT_SEED('medicamentos');

-- 10
SELECT IDENT_INCR('medicamentos');

SET IDENTITY_INSERT medicamentos OFF;

/*

Un videoclub almacena información sobre sus películas en una tabla llamada "peliculas".
1- Elimine la tabla si existe:
 if object_id('peliculas') is not null
  drop table peliculas;

2- Créela definiendo un campo "codigo" autoincrementable que comience en 50 y se incremente en 3:
 create table peliculas(
  codigo int identity (50,3),
  titulo varchar(40),
  actor varchar(20),
  duracion int
 );

3- Ingrese los siguientes registros:
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);

4- Seleccione todos los registros y verifique la carga automática de los códigos:
 select *from peliculas;

5- Setee la opción "identity_insert" en "on"

6- Ingrese un registro con valor de código menor a 50.

7- Ingrese un registro con valor de código mayor al último generado.

8- Averigue el valor de inicio del campo "identity" de la tabla "peliculas".

9- Averigue el valor de incremento del campo "identity" de "peliculas".

10- Intente ingresar un registro sin valor para el campo código.

11- Desactive la opción se inserción para el campo de identidad.

12- Ingrese un nuevo registro y muestre todos los registros para ver cómo SQL Server siguió la 
secuencia tomando el último valor del campo como referencia.

*/

-- 1
IF OBJECT_ID('peliculas') IS NOT NULL
	DROP TABLE peliculas;

-- 2
CREATE TABLE peliculas(
	codigo		INTEGER IDENTITY(50, 3),
	titulo		VARCHAR(40),
	actor		VARCHAR(20),
	duracion	INTEGER
);

-- 3
insert into peliculas (titulo,actor,duracion)
values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la camara secreta','Daniel R.',190);

-- 4
SELECT * FROM peliculas;

-- 5
SET IDENTITY_INSERT peliculas ON;

-- 6
insert into peliculas (codigo, titulo,actor,duracion)
values(49, 'Harry Potter y la camara secreta','Daniel R.',190);

-- 7
insert into peliculas (codigo, titulo,actor,duracion)
values(57, 'Harry Potter y la piedra filosofal','Daniel R.',180);

-- 8
SELECT IDENT_SEED('peliculas');

-- 9
SELECT IDENT_INCR('peliculas');

-- 10
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la piedra filosofal','Daniel R.',180);

-- 11
SET IDENTITY_INSERT peliculas OFF;

-- 12
insert into peliculas (titulo,actor,duracion)
values('Mision imposible','Tom Cruise',120);

SELECT * FROM peliculas;