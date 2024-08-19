/*

Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20)
 );

3- Ingrese algunos registros, dos de ellos con el mismo número de documento:
 insert into empleados
  values ('22222222','Alberto Lopez','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','Administracion');
 insert into empleados
  values ('23333333','Carlos Fuentes','Administracion');

4- Intente establecer una restricción "primary key" para la tabla para que el documento no se repita 
ni admita valores nulos:
 alter table empleados
 add constraint PK_empleados_documento
 primary key(documento);
No lo permite porque la tabla contiene datos que no cumplen con la restricción, debemos eliminar (o 
modificar) el registro que tiene documento duplicado:
 delete from empleados
  where nombre='Carlos Fuentes';

5- Establezca la restricción "primary key" del punto 4.

6- Intente actualizar un documento para que se repita.
No lo permite porque va contra la restricción.

7-Intente establecer otra restricción "primary key" con el campo "nombre".
No lo permite, sólo puede haber una restricción "primary key" por tabla.

8- Intente ingresar un registro con valor nulo para el documento.
No lo permite porque la restricción no admite valores nulos.

9- Establezca una restricción "default" para que almacene "00000000" en el documento en caso de 
omitirlo en un "insert".

10- Ingrese un registro sin valor para el documento.

11- Vea el registro:
 select * from empleados;

12- Intente ingresar otro empleado sin documento explícito.
No lo permite porque se duplicaría la clave.

13- Vea las restricciones de la tabla empleados (2 filas):
 exec sp_helpconstraint empleados;

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE empleados(
	documento		CHAR(8) NOT NULL,
	nombre			VARCHAR(30),
	seccion			VARCHAR(20)
);

-- 3
insert into empleados
values ('22222222','Alberto Lopez','Sistemas');
insert into empleados
values ('23333333','Beatriz Garcia','Administracion');
insert into empleados
values ('23333333','Carlos Fuentes','Administracion');

-- 4
ALTER TABLE empleados
ADD CONSTRAINT PK_empleados_documento
PRIMARY KEY (documento);

DELETE FROM empleados
WHERE nombre = 'Carlos Fuentes';

-- 5
ALTER TABLE empleados
ADD CONSTRAINT PK_empleados_documento
PRIMARY KEY (documento);

-- 6
UPDATE empleados SET documento = '23333333'
WHERE nombre = 'Alberto Lopez';

-- 7
ALTER TABLE empleados
ADD CONSTRAINT PK_empleados_nombre
PRIMARY KEY (nombre);

-- 8
insert into empleados
values (NULL,'Carlos Fuentes','Administracion');

-- 9
ALTER TABLE empleados
ADD CONSTRAINT DF_empleados_documento
DEFAULT '00000000'
FOR documento;

-- 10
insert into empleados(nombre, seccion)
values ('Carlos Fuentes','Administracion');

-- 11
SELECT * FROM empleados;

-- 12
insert into empleados(nombre, seccion)
values ('Lucas Fuentes','Administracion');

-- 13
exec sp_helpconstraint empleados;

/*

Una empresa de remises tiene registrada la información de sus vehículos en una tabla llamada 
"remis".
1- Elimine la tabla si existe:
 if object_id('remis') is not null
  drop table remis;

2- Cree la tabla con la siguiente estructura:
 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

3- Ingrese algunos registros sin repetir patente:
 insert into remis values('ABC123','Renault 12','1990');
 insert into remis values('DEF456','Fiat Duna','1995');

4- Intente definir una restricción "primary key" para el campo "patente".
No lo permite porque el campo no fue definido "not null".

5- Establezca una restricción "primary key" para el campo "numero".
Si bien "numero" no fue definido explícitamente "not null", no acepta valores nulos por ser 
"identity".

6- Vea la información de las restricciones (2 filas):
 exec sp_helpconstraint remis;

*/

-- 1
IF OBJECT_ID('remis') IS NOT NULL
	DROP TABLE remis;

-- 2
CREATE TABLE remis(
	numero		TINYINT IDENTITY,
	patente		CHAR(6),
	marca		VARCHAR(15),
	modelo		CHAR(4)
);

-- 3
insert into remis values('ABC123','Renault 12','1990');
insert into remis values('DEF456','Fiat Duna','1995');

-- 4
ALTER TABLE remis
ADD CONSTRAINT PK_remis_patente
PRIMARY KEY (patente)

-- 5
ALTER TABLE remis
ADD CONSTRAINT PK_remis_numero
PRIMARY KEY (numero);

-- 6
exec sp_helpconstraint remis;
