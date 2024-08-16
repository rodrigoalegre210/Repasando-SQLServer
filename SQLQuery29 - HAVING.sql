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
  telefono varchar(11),
  primary key(codigo)
);

3- Ingrese algunos registros:
 insert into clientes
  values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
 insert into clientes
  values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
 insert into clientes
  values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
 insert into clientes
  values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
 insert into clientes
  values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
 insert into clientes
  values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
 insert into clientes
  values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
 insert into clientes
  values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
 insert into clientes
  values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

4- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)

5- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen 
menos de 2 clientes (3 filas)

6- Obtenga el total de los clientes que viven en calle "San Martin" (where), agrupados por provincia 
(group by), teniendo en cuenta todos los valores (all), de aquellas ciudades que tengan menos de 2 
clientes (having) y omitiendo la fila correspondiente a la ciudad de "Cordoba" (having) (4 filas 
devueltas)

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
	telefono		VARCHAR(11),
	PRIMARY KEY		(codigo)
);

-- 3
insert into clientes
values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null');
insert into clientes
values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
insert into clientes
values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
insert into clientes
values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
insert into clientes
values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
insert into clientes
values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
insert into clientes
values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
insert into clientes
values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
insert into clientes
values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
insert into clientes
values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

-- 4
SELECT ciudad AS Ciudad,
provincia AS Provincia,
COUNT(*) AS 'Total Clientes'
FROM clientes
GROUP BY ciudad, provincia;

-- 5
SELECT ciudad AS Ciudad,
provincia AS Provincia,
COUNT(*) AS 'Total Clientes'
FROM clientes
GROUP BY ciudad, provincia
HAVING COUNT(*) > 1;

-- 6
SELECT provincia AS Provincia, 
COUNT(*) AS 'Total clientes'
FROM clientes
WHERE domicilio LIKE '%San Martin%'
GROUP BY ALL provincia
HAVING COUNT(*) < 2 AND provincia <> 'Cordoba';

/*

Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.
1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

2- Créela con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 );

3- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

4- Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un 
valor superior a 50 (3 filas)

5- Obtenga el total de las compras agrupados por ciudad y sexo (group by), teniendo en cuenta todos 
los valores (all), considerando sólo los montos de compra superiores a 50 (where), los visitantes 
con teléfono (where), sin considerar la ciudad de "Cordoba" (having), ordenados por ciudad (order 
by) (3 filas)

6- Muestre el monto mayor de compra agrupado por ciudad, siempre que dicho valor supere los 50 pesos 
(having), considerando sólo los visitantes de sexo femenino y domicilio conocido (where) (2 filas)

7- Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras 
y el promedio de compras, ordenado por la suma total y considerando las filas con promedio superior 
a 30 (3 filas)

*/

-- 1
IF OBJECT_ID('visitantes') IS NOT NULL
	DROP TABLE visitantes;

-- 2
CREATE TABLE visitantes(
	nombre			VARCHAR(30),
	edad			TINYINT,
	sexo			CHAR(1),
	domicilio		VARCHAR(30),
	ciudad			VARCHAR(20),
	telefono		VARCHAR(11),
	montocompra		DECIMAL(6,2) NOT NULL
);

-- 3
insert into visitantes
values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitantes
values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
insert into visitantes
values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes
values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
insert into visitantes
values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes
values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
insert into visitantes
values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
insert into visitantes
values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
insert into visitantes
values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes
values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

-- 4
SELECT ciudad AS Ciudad, sexo AS Sexo,
SUM(montocompra) AS 'Total Compra'
FROM visitantes
GROUP BY ciudad, sexo
HAVING SUM(montocompra) > 50;

-- 5
SELECT ciudad AS Ciudad, sexo AS Sexo,
SUM(montocompra) AS 'Total Compra'
FROM visitantes
WHERE montocompra > 50 AND telefono IS NOT NULL
GROUP BY ALL ciudad, sexo
HAVING ciudad <> 'Cordoba'
ORDER BY ciudad;

-- 6
SELECT ciudad AS Ciudad,
MAX(montocompra) AS 'Monto Maximo'
FROM visitantes
WHERE sexo = 'f' AND domicilio IS NOT NULL
GROUP BY ALL ciudad
HAVING MAX(montocompra) > 50;

-- 7
SELECT ciudad AS Ciudad, sexo AS Sexo,
COUNT(*) AS 'Cantidad de Visitantes',
SUM(montocompra) AS 'Monto total',
AVG(montocompra) AS 'Monto Promedio'
FROM visitantes
GROUP BY ciudad, sexo
HAVING AVG(montocompra) > 30
ORDER BY 'Monto total';
