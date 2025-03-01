/*

Una empresa tiene registrados sus clientes en una tabla llamada "clientes", también tiene una tabla 
"provincias" donde registra los nombres de las provincias.
1- Elimine las tablas "clientes" y "provincias", si existen:
 if object_id('clientes') is not null
  drop table clientes;
 if object_id('provincias') is not null
  drop table provincias;

2- Créelas con las siguientes estructuras:
 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint,
  nombre varchar(20),
  primary key (codigo)
 );

3- Ingrese algunos registros para ambas tablas:
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);

4- Establezca una restricción "foreign key" especificando la acción "en cascade" para 
actualizaciones y "no action" para eliminaciones.

5- Intente eliminar el registro con código 3, de "provincias".
No se puede porque hay registros en "clientes" al cual hace referencia y la opción para 
eliminaciones se estableció como "no action".

6- Modifique el registro con código 3, de "provincias".

7- Verifique que el cambio se realizó en cascada, es decir, que se modificó en la tabla "provincias" 
y en "clientes":
 select * from provincias;
 select * from clientes;

8- Intente modificar la restricción "foreign key" para que permita eliminación en cascada.
Mensaje de error, no se pueden modificar las restricciones.

9- Intente eliminar la tabla "provincias".
No se puede eliminar porque una restricción "foreign key" hace referencia a ella.

*/

-- 1
IF OBJECT_ID('clientes') IS NOT NULL
	DROP TABLE clientes;

IF OBJECT_ID('provincias') IS NOT NULL
	DROP TABLE provincias;

-- 2
CREATE TABLE clientes(
	codigo				INTEGER IDENTITY,
	nombre				VARCHAR(30),
	domicilio			VARCHAR(30),
	ciudad				VARCHAR(20),
	codigoprovincia		TINYINT,
	PRIMARY KEY			(codigo)
);

CREATE TABLE provincias(
	codigo			TINYINT,
	nombre			VARCHAR(20),
	PRIMARY KEY		(codigo)
);

-- 3
insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Misiones');
insert into provincias values(4,'Rio Negro');

insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);

-- 4
ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_codigoprovincia
FOREIGN KEY (codigoprovincia)
REFERENCES provincias(codigo)
ON UPDATE CASCADE
ON DELETE NO ACTION;

-- 5
DELETE FROM provincias
WHERE codigo = 3;

-- 6
UPDATE provincias SET codigo = 9
WHERE codigo = 3;

-- 7
SELECT * FROM provincias;
SELECT * FROM clientes;

-- 8
ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_codigoprovincia
FOREIGN KEY (codigoprovincia)
REFERENCES provincia(codigo)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 9
DROP TABLE provincias;

/*

Un club dicta clases de distintos deportes. En una tabla llamada "deportes" guarda la información de 
los distintos deportes que se enseñan; en una tabla "socios", los datos de los socios y en una tabla 
"inscripciones" almacena la información necesaria para las inscripciones de los distintos socios a 
los distintos deportes.
1- Elimine las tablas si existen:
 if object_id('inscripciones') is not null
  drop table inscripciones;
 if object_id('deportes') is not null
  drop table deportes;
 if object_id('socios') is not null
  drop table socios;

2- Cree las tablas:
 create table deportes(
  codigo tinyint,
  nombre varchar(20),
  primary key(codigo)
 );

 create table socios(
  documento char(8),
  nombre varchar(30),
  primary key(documento)
 );

 create table inscripciones(
  documento char(8), 
  codigodeporte tinyint,
  matricula char(1),-- 's' si está paga, 'n' si no está paga
  primary key(documento,codigodeporte)
 );

3- Establezca una restricción "foreign key" para "inscripciones" que haga referencia al campo 
"codigo" de "deportes" que permita la actualización en cascada:
  alter table inscripciones
  add constraint FK_inscripciones_codigodeporte
  foreign key (codigodeporte)
  references deportes(codigo)
  on update cascade;

4- Establezca una restricción "foreign key" para "inscripciones" que haga referencia al campo 
"documento" de "socios" que permita la eliminación en cascada (Recuerde que se pueden establecer 
varias retricciones "foreign key" a una tabla):
  alter table inscripciones
  add constraint FK_inscripciones_documento
  foreign key (documento)
  references socios(documento)
  on delete cascade;

5- Ingrese algunos registros en las tablas:
 insert into deportes values(1,'basquet');
 insert into deportes values(2,'futbol');
 insert into deportes values(3,'natacion');
 insert into deportes values(4,'tenis');

 insert into socios values('30000111','Juan Lopez');
 insert into socios values('31111222','Ana Garcia');
 insert into socios values('32222333','Mario Molina');
 insert into socios values('33333444','Julieta Herrero');

 insert into inscripciones values ('30000111',1,'s');
 insert into inscripciones values ('30000111',2,'s');
 insert into inscripciones values ('31111222',1,'s');
 insert into inscripciones values ('32222333',3,'n');

6- Intente ingresar una inscripción con un código de deporte inexistente:
 insert into inscripciones values('30000111',6,'s');
Mensaje de error.

7- Intente ingresar una inscripción con un documento inexistente en "socios":
 insert into inscripciones values('40111222',1,'s');
Mensaje de error.

8- Elimine un registro de "deportes" que no tenga inscriptos:
 delete from deportes where nombre='tenis';
Se elimina porque no hay inscriptos en dicho deporte.

9- Intente eliminar un deporte para los cuales haya inscriptos:
 delete from deportes where nombre='natacion';
No se puede porque al no especificarse acción para eliminaciones, por defecto es "no action" y hay 
inscriptos en dicho deporte.

10- Modifique el código de un deporte para los cuales haya inscriptos.
La opción para actualizaciones se estableció en cascada, se modifica el código en "deportes" y en 
"inscripciones".

11- Verifique los cambios:
 select * from deportes;
 select * from inscripciones;

12- Elimine el socio que esté inscripto en algún deporte.
Se elimina dicho socio de "socios" y la acción se extiende a la tabla "inscripciones".

13- Verifique que el socio eliminado ya no aparece en "inscripciones":
 select * from socios;
 select * from inscripciones;

14- Modifique el documento de un socio que esté inscripto.
No se puede porque la acción es "no action" para actualizaciones.

15- Intente eliminar la tabla "deportes":
 drop table deportes;
No se puede porque una restricción "foreign key" hace referencia a ella.

16- Vea las restricciones de la tabla "socios":
 exec sp_helpconstraint socios;
Muestra la restricción "primary key" y la referencia de una "foreign key" de la tabla 
"inscripciones".

17- Vea las restricciones de la tabla "deportes":
 exec sp_helpconstraint deportes;
Muestra la restricción "primary key" y la referencia de una "foreign key" de la tabla 
"inscripciones".

18- Vea las restricciones de la tabla "inscripciones":
 exec sp_helpconstraint inscripciones;
Muestra 3 restricciones. Una "primary key" y dos "foreign key", una para el campo "codigodeporte" 
que especifica "no action" en la columna "delete_action" y "cascade" en la columna "update_action"; 
la otra, para el campo "documento" especifica "cascade" en la columna "delete_action" y "no action" 
en "update_action".

*/

-- 1
IF OBJECT_ID('inscripciones') IS NOT NULL
	DROP TABLE inscripciones;

IF OBJECT_ID('deportes') IS NOT NULL
	DROP TABLE deportes;

IF OBJECT_ID('socios') IS NOT NULL
	DROP TABLE socios;

-- 2
CREATE TABLE deportes(
	codigo			TINYINT,
	nombre			VARCHAR(20),
	PRIMARY KEY		(codigo)
);

CREATE TABLE socios(
	documento		CHAR(8),
	nombre			VARCHAR(30),
	PRIMARY KEY		(documento)
);

CREATE TABLE inscripciones(
	documento		CHAR(8),
	codigodeporte	TINYINT,
	matricula		CHAR(1),
	PRIMARY KEY		(documento, codigodeporte)
);

-- 3
ALTER TABLE inscripciones
ADD CONSTRAINT FK_inscripciones_codigodeporte
FOREIGN KEY (codigodeporte)
REFERENCES deportes(codigo)
ON UPDATE CASCADE;

-- 4
ALTER TABLE inscripciones
ADD CONSTRAINT FK_inscripciones_documento
FOREIGN KEY (documento)
REFERENCES socios(documento)
ON DELETE CASCADE;

-- 5
insert into deportes values(1,'basquet');
insert into deportes values(2,'futbol');
insert into deportes values(3,'natacion');
insert into deportes values(4,'tenis');

insert into socios values('30000111','Juan Lopez');
insert into socios values('31111222','Ana Garcia');
insert into socios values('32222333','Mario Molina');
insert into socios values('33333444','Julieta Herrero');

insert into inscripciones values ('30000111',1,'s');
insert into inscripciones values ('30000111',2,'s');
insert into inscripciones values ('31111222',1,'s');
insert into inscripciones values ('32222333',3,'n');

-- 6
insert into inscripciones values('30000111',6,'s');

-- 7
insert into inscripciones values('40111222',1,'s');

-- 8
DELETE FROM deportes
WHERE codigo = 4;

-- 9
DELETE FROM deportes
WHERE nombre = 'natacion';

-- 10
UPDATE deportes SET codigo = 8
WHERE codigo = 1;

-- 11
SELECT * FROM deportes;
SELECT * FROM inscripciones;

-- 12
DELETE FROM socios
WHERE documento = '30000111';

-- 13
SELECT * FROM socios;
SELECT * FROM inscripciones;

-- 14
UPDATE socios SET documento = '32323232'
WHERE documento = '31111222';

-- 15
DROP TABLE deportes;

-- 16
EXEC sp_helpconstraint socios;

-- 17
EXEC sp_helpconstraint deportes;

-- 18
EXEC sp_helpconstraint inscripciones;