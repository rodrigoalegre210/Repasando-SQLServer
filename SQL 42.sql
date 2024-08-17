/*

Una empresa tiene registrados sus clientes en una tabla llamada "clientes".
1- Elimine la tabla "clientes", si existe:
 if object_id('clientes') is not null
  drop table clientes;

2- Créela con la siguiente estructura:
 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
);

3- Ingrese algunos registros:
 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

4- Obtenga las provincias sin repetir (3 registros)

5- Cuente las distintas provincias.

6- Se necesitan los nombres de las ciudades sin repetir (6 registros)

7- Obtenga la cantidad de ciudades distintas.

8- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)

9- Contamos las distintas ciudades de cada provincia empleando "group by" (3 registros)

*/

-- 1
IF OBJECT_ID('clientes') IS NOT NULL
	DROP TABLE clientes;

-- 2
CREATE TABLE clientes(
	codigo			INTEGER IDENTITY,
	nombre			VARCHAR(30) NOT NULL,
	domicilio		VARCHAR(30),
	ciudad			VARCHAR(20),
	provincia		VARCHAR(20),
	PRIMARY KEY		(codigo)
);

-- 3
insert into clientes
values ('Lopez Marcos','Colon 111','Cordoba','Cordoba');
insert into clientes
values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba');
insert into clientes
values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba');
insert into clientes
values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe');
insert into clientes
values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba');
insert into clientes
values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe');
insert into clientes
values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba');
insert into clientes
values ('Lopez Carlos',null,'Cruz del Eje','Cordoba');
insert into clientes
values ('Ramos Betina','San Martin 999','Cordoba','Cordoba');
insert into clientes
values ('Lopez Lucas','San Martin 1010','Posadas','Misiones');

-- 4
SELECT DISTINCT provincia AS Provincia
FROM clientes;

-- 5
SELECT COUNT(DISTINCT provincia) AS Cantidad
FROM clientes;

-- 6
SELECT DISTINCT ciudad AS Ciudades
FROM clientes;

-- 7
SELECT COUNT(DISTINCT ciudad) AS Cantidad
FROM clientes;

-- 8
SELECT DISTINCT ciudad AS Ciudades
FROM clientes
WHERE provincia = 'Cordoba';

-- 9
SELECT provincia AS Provincia,
COUNT(DISTINCT ciudad) AS Ciudades
FROM clientes
GROUP BY provincia;

/*

La provincia almacena en una tabla llamada "inmuebles" los siguientes datos de los inmuebles y sus 
propietarios para cobrar impuestos:
1- Elimine la tabla si existe:
 if object_id('inmuebles') is not null
  drop table inmuebles;

2- Créela con la siguiente estructura:
 create table inmuebles (
  documento varchar(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2)
 );

3- Ingrese algunos registros:
 insert into inmuebles
  values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
 insert into inmuebles
  values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
 insert into inmuebles
  values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
 insert into inmuebles
  values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
 insert into inmuebles
  values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
 insert into inmuebles
  values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
 insert into inmuebles
  values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
 insert into inmuebles
  values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

4- Muestre los distintos apellidos de los propietarios, sin repetir (3 registros)

5- Muestre los distintos documentos de los propietarios, sin repetir (6 registros)

6- Cuente, sin repetir, la cantidad de propietarios de inmuebles de la ciudad de Cordoba (5)

7- Cuente la cantidad de inmuebles con domicilio en 'San Martin', sin repetir la ciudad (2)

8- Muestre los apellidos y nombres, sin repetir (5 registros)
Note que hay 2 personas con igual nombre y apellido que aparece una sola vez.

9- Muestre la cantidad de inmuebles que tiene cada propietario agrupando por documento, sin repetir 
barrio (6 registros)

*/

-- 1
IF OBJECT_ID('inmuebles') IS NOT NULL
	DROP TABLE inmuebles;

-- 2
CREATE TABLE inmuebles(
	documento		CHAR(8) NOT NULL,
	apellido		VARCHAR(30),
	nombre			VARCHAR(30),
	domicilio		VARCHAR(20),
	barrio			VARCHAR(20),
	ciudad			VARCHAR(20),
	tipo			CHAR(1), -- B = Baldio, E = Edificado
	superficie		DECIMAL(8,2)
);

-- 3
insert into inmuebles
values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
insert into inmuebles
values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
insert into inmuebles
values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
insert into inmuebles
values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
insert into inmuebles
values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
insert into inmuebles
values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
insert into inmuebles
values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
insert into inmuebles
values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
insert into inmuebles
values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

-- 4
SELECT DISTINCT apellido FROM inmuebles;

-- 5
SELECT DISTINCT documento FROM inmuebles;

-- 6
SELECT COUNT(DISTINCT documento) AS Cantidad
FROM inmuebles
WHERE ciudad = 'Cordoba';

-- 7
SELECT COUNT(DISTINCT ciudad) AS Cantidad
FROM inmuebles
WHERE domicilio LIKE '%San Martin%';

-- 8
SELECT DISTINCT apellido AS Apellidos,
nombre AS Nombres
FROM inmuebles;

-- 9
SELECT DISTINCT documento AS Documento,
COUNT(DISTINCT barrio) AS Cantidad
FROM inmuebles
GROUP BY documento;