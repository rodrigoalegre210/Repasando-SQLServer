/*

Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla 
llamada "vehiculos".
1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

2- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 );

3- Establezca una restricción "check" que admita solamente los valores "a" y "m" para el campo 
"tipo":
 alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'));

4- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
ingresarse valor para dicho campo:
 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo;

5- Establezca una restricción "check" para el campo "patente" para que acepte 3 letras seguidas de 3 
dígitos:
 alter table vehiculos
 add constraint CK_vehiculos_patente_patron
 check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

6- Agregue una restricción "primary key" que incluya los campos "patente" y "horallegada":
 alter table vehiculos
 add constraint PK_vehiculos_patentellegada
 primary key(patente,horallegada);

7- Ingrese un vehículo:
 insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

8- Intente ingresar un registro repitiendo la clave primaria:
 insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);
No se permite.

9- Ingrese un registro repitiendo la patente pero no la hora de llegada:
 insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

10- Ingrese un registro repitiendo la hora de llegada pero no la patente:
 insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

11- Vea todas las restricciones para la tabla "vehiculos":
 exec sp_helpconstraint vehiculos;
aparecen 4 filas, 2 correspondientes a restricciones "check", 1 a "default" y 1 a "primary key".

12- Elimine la restricción "default" del campo "tipo".

13- Vea si se ha eliminado:
 exec sp_helpconstraint vehiculos;

14- Elimine la restricción "primary key" y "check".

15- Vea si se han eliminado:
 exec sp_helpconstraint vehiculos;

*/

-- 1
IF OBJECT_ID('vehiculos') IS NOT NULL
	DROP TABLE vehiculos;

-- 2
CREATE TABLE vehiculos(
	patente 	CHAR(6) NOT NULL,
	tipo 		CHAR(1), -- A = Auto, M = Moto
	horallegada 	DATETIME NOT NULL,
	horasalida	DATETIME
);

-- 3
ALTER TABLE vehiculos
ADD CONSTRAINT CK_vehiculos_tipo
CHECK (tipo IN('a','m'));

-- 4
ALTER TABLE vehiculos
ADD CONSTRAINT DF_vehiculos_tipo
DEFAULT 'a'
FOR tipo;

-- 5
ALTER TABLE vehiculos
ADD CONSTRAINT CK_vehiculos_patente
CHECK (patente LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9]')

-- 6
ALTER TABLE vehiculos
ADD CONSTRAINT PK_vehiculos_patentellegada
PRIMARY KEY(patente, horallegada);

-- 7
insert into vehiculos values('SDR456','a','2005/10/10 10:10',null);

-- 8
insert into vehiculos values('SDR456','m','2005/10/10 10:10',null);

-- 9
insert into vehiculos values('SDR456','m','2005/10/10 12:10',null);

-- 10
insert into vehiculos values('SDR111','m','2005/10/10 10:10',null);

-- 11
exec sp_helpconstraint vehiculos;

-- 12
ALTER TABLE vehiculos
DROP DF_vehiculos_tipo;

-- 13
exec sp_helpconstraint vehiculos;

-- 14
ALTER TABLE vehiculos
DROP PK_vehiculos_patentellegada, CK_vehiculos_tipo;

exec sp_helpconstraint vehiculos;
