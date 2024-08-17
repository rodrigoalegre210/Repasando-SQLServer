/*

Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.
1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

2- Cree la tabla con la siguiente estructura:
 create table visitantes(
  numero int identity,
  nombre varchar(30),
  edad tinyint,
  domicilio varchar(30),
  ciudad varchar(20),
  montocompra decimal (6,2) not null
 );

3- Defina una restricción "default" para el campo "ciudad" que almacene el valor "Cordoba" en caso 
de no ingresar valor para dicho campo:
 alter table visitantes
  add constraint DF_visitantes_ciudad
  default 'Cordoba'
  for ciudad;

4- Defina una restricción "default" para el campo "montocompra" que almacene el valor "0" en caso de 
no ingresar valor para dicho campo:
 alter table visitantes
  add constraint DF_visitantes_montocompra
  default 0
  for montocompra;

5- Ingrese algunos registros sin valor para los campos con restricción "default":
 insert into visitantes
  values ('Susana Molina',35,'Colon 123',default,59.80);
 insert into visitantes (nombre,edad,domicilio)
  values ('Marcos Torres',29,'Carlos Paz');
 insert into visitantes
  values ('Mariana Juarez',45,'Carlos Paz',null,23.90);

6- Vea cómo se almacenaron los registros:
 select * from visitantes;

7- Vea las restricciones creadas anteriormente.
aparecen dos filas, una por cada restricción.

8- Intente agregar otra restricción "default" al campo "ciudad".
Aparece un mensaje de error indicando que el campo ya tiene una restricción "default" y sabemos 
que no puede establecerse más de una restricción "default" por campo.

9- Intente establecer una restricción "default" al campo "identity".
No se permite.

*/

-- 1
IF OBJECT_ID('visitantes') IS NOT NULL
	DROP TABLE visitantes;

-- 2
CREATE TABLE visitantes(
	numero			INTEGER IDENTITY,
	nombre			VARCHAR(30),
	edad			TINYINT,
	domicilio		VARCHAR(30),
	ciudad			VARCHAR(20),
	montocompra		DECIMAL(6,2) NOT NULL
);

-- 3
ALTER TABLE visitantes
ADD CONSTRAINT DF_visitantes_ciudad
DEFAULT 'Cordoba'
FOR ciudad;

-- 4
ALTER TABLE visitantes
ADD CONSTRAINT DF_visitantes_montocompra
DEFAULT 0
FOR montocompra;

-- 5
insert into visitantes
values ('Susana Molina',35,'Colon 123',default,59.80);
insert into visitantes (nombre,edad,domicilio)
values ('Marcos Torres',29,'Carlos Paz');
insert into visitantes
values ('Mariana Juarez',45,'Carlos Paz',null,23.90);

-- 6
SELECT * FROM visitantes;

-- 7
exec sp_helpconstraint visitantes;

-- 8
ALTER TABLE visitantes
ADD CONSTRAINT DF_visitantes_ciudad
DEFAULT 'Buenos Aires'
FOR ciudad;

-- 9
ALTER TABLE visitantes
ADD CONSTRAINT DF_visitantes_numero
DEFAULT '20'
FOR numero;

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
  horallegada datetime,
  horasalida datetime
 );

3- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
ingresarse valor para dicho campo.

4- Ingrese un registro sin valor para el campo "tipo":
 insert into vehiculos values('BVB111',default,default,null);

5- Recupere los registros:
 select * from vehiculos;

6- Intente establecer otra restricción "default" para el campo "tipo" que almacene el valor "m" en 
caso de no ingresarse valor para dicho campo.
No lo permite porque un campo solamente admite una restricción "default" y ya tiene una.

7- Establezca una restricción "default" para el campo "horallegada" que almacene la fecha y hora del 
sistema.

8- Ingrese un registro sin valor para los campos de tipo datetime.

9- Recupere los registros:
 select * from vehiculos;

10- Vea las restricciones.
2 restricciones.

*/

-- 1
IF OBJECT_ID('vehiculos') IS NOT NULL
	DROP TABLE vehiculos;

-- 2
CREATE TABLE vehiculos(
	patente			CHAR(6) NOT NULL,
	tipo			CHAR(1), -- A = Auto, M = Moto
	horallegada		DATETIME,
	horasalida		DATETIME
);

-- 3
ALTER TABLE vehiculos
ADD CONSTRAINT DF_vehiculos_tipo
DEFAULT 'a'
FOR tipo;

-- 4
insert into vehiculos values('BVB111',default,default,null);

-- 5
SELECT * FROM vehiculos;

-- 6
ALTER TABLE vehiculos
ADD CONSTRAINT DF_vehiculos_tipo
DEFAULT 'm'
FOR tipo;

-- 7
ALTER TABLE vehiculos
ADD CONSTRAINT DF_vehiculos_horallegada
DEFAULT GETDATE()
FOR horallegada;

-- 8
insert into vehiculos values('BVB111','m',default,null);

-- 9
SELECT * FROM vehiculos;

-- 10
exec sp_helpconstraint vehiculos;