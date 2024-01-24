/*

Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".
1- Elimine la tabla,si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

2- Cree la tabla con un campo "codigo" que genere valores secuenciales automáticamente:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

3- Visualice la estructura de la tabla "medicamentos":
 exec sp_columns medicamentos;

4- Ingrese los siguientes registros:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

5- Verifique que SQL Server generó valores para el campo "código" de modo automático:
 select * from medicamentos;

6- Intente ingresar un registro con un valor para el campo "codigo"

7- Intente actualizar un valor de código (aparece un mensaje de error)

8- Elimine el registro con codigo "3" (1 registro eliminado)

9- Ingrese un nuevo registro:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

10- Seleccione todos los registros para ver qué valor guardó SQL Server en el campo código:
 select * from medicamentos;

*/

-- 1
IF OBJECT_ID('medicamentos') IS NOT NULL
	DROP TABLE medicamentos;

-- 2
CREATE TABLE medicamentos(
	codigo			INT IDENTITY,
	nombre			VARCHAR(20) NOT NULL,
	laboratorio		VARCHAR(30),
	precio			FLOAT,
	cantidad		INT
);

-- 3
EXEC sp_columns medicamentos;

-- 4
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Amoxidal 500','Bayer',15.60,100);

-- 5
SELECT * FROM medicamentos;

-- 6
INSERT INTO medicamentos (codigo, nombre, laboratorio,precio,cantidad)
VALUES (4, 'Amoxidal 500', 'Bayer', 15.60, 100);

-- 7
UPDATE medicamentos SET codigo = 2
WHERE codigo = 2;

-- 8
DELETE FROM medicamentos
WHERE codigo = 3;

-- 9
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Amoxilina 500','Bayer',15.60,100);

-- 10
SELECT * FROM medicamentos;

/*

Un videoclub almacena información sobre sus películas en una tabla llamada "peliculas".
1- Elimine la tabla si existe:
 if object_id('peliculas') is not null
  drop table peliculas;

2- Créela definiendo un campo "codigo" autoincrementable y como clave primaria:
 create table peliculas(
  codigo int identity,
  titulo varchar(40),
  actor varchar(20),
  duracion int,
  primary key(codigo)
 );

3- Ejecute el procedimiento almacenado para visualizar la estructura de la tabla:
 exec sp_columns peliculas;

4- Ingrese los siguientes registros:
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('La vida es bella','zzz',220);

5- Seleccione todos los registros y verifique la carga automática de los códigos:
 select * from peliculas;

6- Intente actualizar el codigo de una película (aparece un mensaje de error)

7- Elimine la película "La vida es bella".

8- Ingrese un nuevo registro.

9- Visualice los registros para ver el valor almacenado en codigo (valor 6):
 select * from peliculas;

*/

-- 1
IF OBJECT_ID('peliculas') IS NOT NULL
	DROP TABLE peliculas;

-- 2
CREATE TABLE peliculas(
	codigo			INT IDENTITY,
	titulo			VARCHAR(40),
	actor			VARCHAR(20),
	duracion		INT,
	PRIMARY KEY		(codigo)
);

-- 3
EXEC sp_columns peliculas;

-- 4
insert into peliculas (titulo,actor,duracion)
values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas (titulo,actor,duracion)
values('Mision imposible 2','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
values('La vida es bella','zzz',220);

-- 5
SELECT * FROM peliculas;

-- 6
UPDATE peliculas SET codigo = 6
WHERE codigo = 5;

-- 7
DELETE FROM peliculas
WHERE titulo = 'La vida es bella';

-- 8
INSERT INTO peliculas (titulo,actor,duracion)
VALUES ('La vida es bella','zzz',220);

-- 9
SELECT * FROM peliculas;