/*

Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".
La tabla contiene estos datos:

	Número de Cuenta                  Documento       Nombre          Saldo
	________________________________________________________________________________
        1234                          25666777        Pedro Perez     500000.60
        2234                          27888999        Juan Lopez      -250000
        3344                          27888999        Juan Lopez      4000.50
        3346                          32111222        Susana Molina   1000

1- Elimine la tabla "cuentas" si existe:
 if object_id('cuentas') is not null
  drop table cuentas;

2- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos descriptos arriba:

 - Número de cuenta: entero, no nulo, no puede haber valores repetidos, clave primaria;
 - Documento del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8), no nulo;
 - Nombre del propietario de la cuenta: cadena de caracteres de 30 de longitud,
 - Saldo de la cuenta: valores altos con decimales.

3- Ingrese los siguientes registros:
 insert into cuentas(numero,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);
Note que hay dos cuentas, con distinto número de cuenta, de la misma persona.

4- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)

5- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 
registros)

6- Muestre las cuentas con saldo negativo (1 registro)

7- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):

*/

-- 1
IF OBJECT_ID('cuentas') IS NOT NULL
	DROP TABLE cuentas;

-- 2
CREATE TABLE cuentas(
	numero			INT NOT NULL,
	documento		CHAR(8),
	nombre			VARCHAR(30),
	saldo			MONEY,
	PRIMARY KEY		(numero)
);

EXEC sp_columns cuentas;

-- 3
insert into cuentas(numero,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);

-- 4
SELECT * FROM cuentas
WHERE saldo > 4000;

-- 5
SELECT numero, saldo FROM cuentas
WHERE nombre = 'Juan Lopez';

-- 6
SELECT * FROM cuentas
WHERE saldo < 0;

-- 7
SELECT * FROM cuentas
WHERE numero >= 3000;

/*

Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
datos: nombre, documento, sexo, domicilio, sueldobasico.
1- Elimine la tabla, si existe:
 if object_id('empleados') is not null
  drop table empleados;

2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table empleados(
  nombre varchar(30),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  sueldobasico decimal(7,2),--máximo estimado 99999.99
  cantidadhijos tinyint--no superará los 255
 );

3- Ingrese algunos registros:
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Ana Acosta','24555666','f','Colon 134',850,0);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

4- Ingrese un valor de "sueldobasico" con más decimales que los definidos (redondea los decimales al 
valor más cercano 800.89):
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Susana Molina','29000555','f','Salta 876',800.888,3);

5- Intente ingresar un sueldo que supere los 7 dígitos (no lo permite)

6- Muestre todos los empleados cuyo sueldo no supere los 900 pesos (1 registro):

7- Seleccione los nombres de los empleados que tengan hijos (3 registros):

*/

-- 1
IF OBJECT_ID('empleados') IS NOT NULL
	DROP TABLE empleados;

-- 2
CREATE TABLE empleados(
	nombre			VARCHAR(30),
	documento		CHAR(8),
	sexo			CHAR(1),
	domicilio		VARCHAR(30),
	sueldobasico	DECIMAL(7,2),
	cantidadhijos	TINYINT
);

EXEC sp_columns empleados;

-- 3
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Ana Acosta','24555666','f','Colon 134',850,0);
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

-- 4
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Susana Molina','29000555','f','Salta 876',800.888,3);

SELECT * FROM empleados;

-- 5
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Susana Molina','29000555','f','Salta 876',800444444.888,3);

-- 6
SELECT * FROM empleados
WHERE sueldobasico < 900;

-- 7
SELECT nombre FROM empleados
WHERE cantidadhijos > 0;