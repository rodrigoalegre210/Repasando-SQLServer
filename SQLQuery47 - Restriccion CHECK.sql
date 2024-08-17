/*

Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento datetime,
  cantidadhijos tinyint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

3- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el 
sueldo:
 alter table empleados
   add constraint CK_empleados_sueldo_positivo
   check (sueldo>0);

4- Ingrese algunos registros válidos:
 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

5- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el 
valor 5000:
 alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000);
La sentencia no se ejecuta porque hay un sueldo que no cumple la restricción.

6- Elimine el registro infractor y vuelva a crear la restricción:
 delete from empleados where sueldo=6000;

 alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000); 

7- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la 
fecha actual:
 alter table empleados
   add constraint CK_fechanacimiento_actual
   check (fechanacimiento<getdate());

8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
"Administracion" y "Contaduría":
 alter table empleados
   add constraint CK_empleados_seccion_lista
   check (seccion in ('Sistemas','Administracion','Contaduria'));

9- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 
15.

10- Vea todas las restricciones de la tabla (5 filas):
 exec sp_helpconstraint empleados;

11- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo".
Mensaje de error porque se infringe la restricción "CK_empleados_sueldo_positivo".

12- Intente agregar un registro con fecha de nacimiento futura.
Mensaje de error.

13- Intente modificar un registro colocando en "cantidadhijos" el valor "21".
Mensaje de error.

14- Intente modificar el valor de algún registro en el campo "seccion" cambiándolo por uno que no 
esté incluido en la lista de permitidos.
Mensaje de error.

15- Intente agregar una restricción al campo sección para aceptar solamente valores que comiencen 
con la letra "B":
 alter table empleados
   add constraint CK_seccion_letrainicial
   check (seccion like '%B');
Note que NO se puede establecer esta restricción porque va en contra de la establecida anteriormente 
para el mismo campo, si lo permitiera, no podríamos ingresar ningún valor para "seccion".

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE empleados(
	documento			CHAR(8),
	nombre				VARCHAR(30),
	fechanacimiento		DATETIME,
	cantidadhijos		TINYINT,
	seccion				VARCHAR(20),
	sueldo				DECIMAL(6,2)
);

-- 3
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_sueldo_positivo
CHECK (sueldo > 0);

-- 4
insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduria',6000);

-- 5
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_sueldo_maximo
CHECK (sueldo <= 5000);

-- 6
DELETE FROM empleados
WHERE sueldo = 6000;

ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_sueldo_maximo
CHECK (sueldo <= 5000);

-- 7
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_fecha_limite
CHECK  (fechanacimiento < GETDATE())

-- 8
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_seccion
CHECK (seccion IN('Sistemas', 'Administracion', 'Contaduria'));

-- 9
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_hijos
CHECK (cantidadhijos BETWEEN 0 AND 15);

-- 10
exec sp_helpconstraint empleados;

-- 11
insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduria',6000);

-- 12
insert into empleados values ('34444444','Carlos Caseres','2025/10/05',0,'Contaduria',5000);

-- 13
UPDATE empleados SET cantidadhijos = 21
WHERE documento = '22222222';

-- 14
UPDATE empleados SET seccion = 'Ventas'
WHERE documento = '33333333';

SELECT * FROM empleados;

-- 15
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_seccion_B
CHECK (seccion LIKE 'B%');

/*

Una playa de estacionamiento almacena los datos de los vehículos que ingresan en la tabla llamada 
"vehiculos".
1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

2- Cree la tabla:
 create table vehiculos(
  numero int identity,
  patente char(6),
  tipo char(4),
  fechahoraentrada datetime,
  fechahorasalida datetime
 );

3- Ingresamos algunos registros:
 insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
 insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null);
 insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

4- Agregue una restricción "check" que especifique un patrón de 3 letras y 3 dígitos para "patente":
 alter table vehiculos
   add constraint CK_vehiculos_patente_patron
   check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

5- Intente ingresar un registro con un valor inapropiado para "patente":
 insert into vehiculos values('AB1234','auto',getdate(),null);
No lo permite.

6- Agregue una restricción "check" que especifique que el campo "tipo" acepte solamente los valores 
"auto" y "moto":
 alter table vehiculos
   add constraint CK_vehiculos_tipo_valores
   check (tipo in ('auto','moto'));

7- Intente modificar el valor del campo "tipo" ingresando un valor inexistente en la lista de 
valores permitidos por la restricción establecida a dicho campo:
 update vehiculos set tipo='bici' where patente='AIC124';
No lo permite.

8- Agregue una restricción "default" para el campo "tipo" que almacene el valor "bici":
 alter table vehiculos
   add constraint DF_vehiculos_tipo
   default 'bici'
   for tipo;
Lo acepta. Pero, note que va en contra de la restricción "check" impuesta en el punto 6.

9- Intente ingresar un registro sin valor para "tipo":
  insert into vehiculos values('SDF134',default,null,null);
No lo permite porque va contra la restricción "check" del campo.

10- Agregue una restricción "check" para asegurarse que la fecha de entrada a la playa no sea 
posterior a la fecha y hora actual:
 alter table vehiculos
   add constraint CK_vehiculos_fechahoraentrada_actual
   check (fechahoraentrada<=getdate());

11- Agregue otra restricción "check" al campo "fechahoraentrada" que establezca que sus valores no 
sean posteriores a "fechahorasalida":
 alter table vehiculos
   add constraint CK_vehiculos_fechahoraentradasalida
   check (fechahoraentrada<=fechahorasalida);

12- Intente ingresar un valor que no cumpla con la primera restricción establecida en el campo 
"fechahoraentrada":
 insert into vehiculos values('ABC123','auto','2007/05/05 10:10',null);
La inserción no se realiza.

13- Intente modificar un registro para que la salida sea anterior a la entrada:
 update vehiculos set fechahorasalida='2007/01/17 7:30'
   where patente='CAA258';
Mensaje de error.

14- Vea todas las restricciones para la tabla "vehiculos":
 exec sp_helpconstraint vehiculos;
aparecen 5 filas, 4 correspondientes a restricciones "check" y 1 a "default".

15- Establezca una restricción "default" para el campo "fechahoraentrada" para que almacene la fecha 
actual del sistema:
 alter table vehiculos
   add constraint DF_vehiculos_fechahoraentrada
   default getdate()
   for fechahoraentrada;

16- Ingrese un registro sin valor para "fechahoraentrada":
 insert into vehiculos values('DFR156','moto',default,default);

17- Vea todos los registros:
 select * from vehiculos;

18- Vea las restricciones:
 exec sp_helpconstraint vehiculos;
4 restricciones "check" y 2 "default".

*/

-- 1
IF OBJECT_ID('vehiculos') IS NOT NULL
	DROP TABLE vehiculos;

-- 2
CREATE TABLE vehiculos(
	numero				INTEGER IDENTITY,
	patente				CHAR(6),
	tipo				CHAR(4),
	fechahoraentrada	DATETIME,
	fechahorasalida		DATETIME
);

-- 3
insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null);
insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

-- 4
ALTER TABLE vehiculos
ADD CONSTRAINT CK_vehiculos_patente
CHECK (patente LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

-- 5
insert into vehiculos values('AB1234','auto',getdate(),null);

-- 6
ALTER TABLE vehiculos
ADD CONSTRAINT CK_vehiculos_tipo
CHECK (tipo IN('auto', 'moto'));

-- 7
UPDATE vehiculos SET tipo = 'bici'
WHERE patente = 'AIC124';

-- 8
ALTER TABLE vehiculos
ADD CONSTRAINT DF_vehiculo_tipo_default
DEFAULT 'bici'
FOR tipo;

-- 9
insert into vehiculos values('SDF134',default,null,null);

-- 10
ALTER TABLE vehiculos
ADD CONSTRAINT CK_vehiculos_fechalimite
CHECK (fechahoraentrada <= GETDATE());

-- 11
ALTER TABLE vehiculos
ADD CONSTRAINT CK_vehiculos_fechahoranetradasalida
CHECK (fechahoraentrada <= fechahorasalida);

-- 12
insert into vehiculos values('ABC123','auto','2025/05/05 10:10',null);

-- 13
UPDATE vehiculos SET fechahorasalida = '2006/01/17 12:30'
WHERE patente = 'AIC124';

-- 14
exec sp_helpconstraint vehiculos;

-- 15
ALTER TABLE vehiculos
ADD CONSTRAINT DF_vehiculos_fechaentrada_default
DEFAULT GETDATE()
FOR fechahoraentrada;

-- 16
insert into vehiculos values('DFR156','moto',default,default);

-- 17
SELECT * FROM vehiculos;

-- 18
exec sp_helpconstraint vehiculos;
