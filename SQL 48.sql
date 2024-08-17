/*

Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
1- Elimine la tabla (si existe):
 if object_id('empleados') is not null
  drop table empleados;

2- Créela con la siguiente estructura e ingrese los registros siguientes:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2)
 );

 insert into empleados
  values ('22222222','Alberto Acosta','Sistemas',-10);
 insert into empleados
  values ('33333333','Beatriz Benitez','Recursos',3000);
 insert into empleados
  values ('34444444','Carlos Caseres','Contaduria',4000);

3- Intente agregar una restricción "check" para asegurarse que no se ingresen valores negativos para 
el sueldo:
 alter table empleados
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0);
No se permite porque hay un valor negativo almacenado.

5- Vuelva a intentarlo agregando la opción "with nocheck":
 alter table empleados
 with nocheck
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0);

6- Intente ingresar un valor negativo para sueldo:
 insert into empleados
  values ('35555555','Daniel Duarte','Administracion',-2000);
No es posible a causa de la restricción.

7- Deshabilite la restricción e ingrese el registro anterior:
 alter table empleados
  nocheck constraint CK_empleados_sueldo_positivo;
 insert into empleados
  values ('35555555','Daniel Duarte','Administracion',2000);

8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
"Administracion" y "Contaduría":
 alter table empleados
 add constraint CK_empleados_seccion_lista
 check (seccion in ('Sistemas','Administracion','Contaduria'));
No lo permite porque existe un valor fuera de la lista.

9- Establezca la restricción anterior evitando que se controlen los datos existentes.

10- Vea si las restricciones de la tabla están o no habilitadas:
 exec sp_helpconstraint empleados;
Muestra 2 filas, una por cada restricción.

11- Habilite la restricción deshabilitada.

12- Intente modificar la sección del empleado "Carlos Caseres" a "Recursos".
No lo permite.

13- Deshabilite la restricción para poder realizar la actualización del punto precedente.

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE empleados(
	documento	CHAR(8),
	nombre		VARCHAR(30),
	seccion		VARCHAR(20),
	sueldo		DECIMAL(6,2)
);

insert into empleados
values ('22222222','Alberto Acosta','Sistemas',-10);
insert into empleados
values ('33333333','Beatriz Benitez','Recursos',3000);
insert into empleados
values ('34444444','Carlos Caseres','Contaduria',4000);

-- 3
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_sueldo_negativo
CHECK (sueldo >= 0);

-- 4
ALTER TABLE empleados
WITH NOCHECK
ADD CONSTRAINT CK_empleados_sueldo_negativo
CHECK (sueldo >= 0);

SELECT * FROM empleados;

-- 5
insert into empleados
values ('35555555','Daniel Duarte','Administracion',-2000);

-- 6
ALTER TABLE empleados
NOCHECK CONSTRAINT CK_empleados_sueldo_negativo;

insert into empleados
values ('35555555','Daniel Duarte','Administracion',-2000);

-- 7
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_secciones
CHECK (seccion IN('Sistemas', 'Administracion', 'Contaduría'))

-- 8
ALTER TABLE empleados
WITH NOCHECK
ADD CONSTRAINT CK_empleados_secciones
CHECK (seccion IN('Sistemas', 'Administracion', 'Contaduría'))

-- 9
exec sp_helpconstraint empleados;

-- 10
ALTER TABLE empleados
CHECK CONSTRAINT CK_empleados_sueldo_negativo;

-- 11
UPDATE empleados SET seccion = 'Recursos'
WHERE nombre = 'Carlos Caseres'

-- 12
ALTER TABLE empleados
NOCHECK CONSTRAINT CK_empleados_secciones;

UPDATE empleados SET seccion = 'Recursos'
WHERE nombre = 'Carlos Caseres'

SELECT * FROM empleados;