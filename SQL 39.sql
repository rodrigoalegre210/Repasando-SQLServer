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
  estado varchar (20),
  pais varchar(20),
  primary key(codigo)
 );

3- Ingrese algunos registros:
 insert into clientes
  values ('Lopez Marcos','Colon 111', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Perez Ana','San Martin 222', 'Carlos Paz','Cordoba','Argentina');
 insert into clientes
  values ('Garcia Juan','Rivadavia 333', 'Carlos Paz','Cordoba','Argentina');
 insert into clientes
  values ('Perez Luis','Sarmiento 444', 'Rosario','Santa Fe','Argentina');
 insert into clientes
  values ('Gomez Ines','San Martin 987', 'Santa Fe','Santa Fe','Argentina');
 insert into clientes
  values ('Gomez Ines','San Martin 666', 'Santa Fe','Santa Fe','Argentina');
 insert into clientes
  values ('Lopez Carlos','Irigoyen 888', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Ramos Betina','San Martin 999', 'Cordoba','Cordoba','Argentina');
 insert into clientes
  values ('Fernando Salas','Mariano Osorio 1234', 'Santiago','Region metropolitana','Chile');
 insert into clientes
  values ('German Rojas','Allende 345', 'Valparaiso','Region V','Chile');
 insert into clientes
  values ('Ricardo Jara','Pablo Neruda 146', 'Santiago','Region metropolitana','Chile');
 insert into clientes
  values ('Joaquin Robles','Diego Rivera 147', 'Guadalajara','Jalisco','Mexico');

4- Necesitamos la cantidad de clientes por país y la cantidad total de clientes en una sola consulta 
(4 filas)
Note que la consulta retorna los registros agrupados por pais y una fila extra en la que la columna 
"pais" contiene "null" y la columna con la cantidad muestra la cantidad total.

5- Necesitamos la cantidad de clientes agrupados por pais y estado, incluyendo resultados paciales 
(9 filas)
Note que la salida muestra los totales por pais y estado y produce 4 filas extras: 3 muestran los 
totales para cada pais, con la columna "estado" conteniendo "null" y 1 muestra el total de todos los 
clientes, con las columnas "pais" y "estado" conteniendo "null".

6- Necesitamos la cantidad de clientes agrupados por pais, estado y ciudad, empleando "rollup" (16 
filas)
El resultado muestra los totales por pais, estado y ciudad y genera 9 filas extras: 5 muestran los 
totales para cada estado, con la columna correspondiente a "ciudad" conteniendo "null", 3 muestran 
los totales para cada pais, con las columnas "ciudad" y "estado" conteniendo "null" y 1 muestra el 
total de todos los clientes, con las columnas "pais", "estado" y "ciudad" conteniendo "null".

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
	estado			VARCHAR(20),
	pais			VARCHAR(20),
	PRIMARY KEY		(codigo)
);

-- 3
insert into clientes
values ('Lopez Marcos','Colon 111', 'Cordoba','Cordoba','Argentina');
insert into clientes
values ('Perez Ana','San Martin 222', 'Carlos Paz','Cordoba','Argentina');
insert into clientes
values ('Garcia Juan','Rivadavia 333', 'Carlos Paz','Cordoba','Argentina');
insert into clientes
values ('Perez Luis','Sarmiento 444', 'Rosario','Santa Fe','Argentina');
insert into clientes
values ('Gomez Ines','San Martin 987', 'Santa Fe','Santa Fe','Argentina');
insert into clientes
values ('Gomez Ines','San Martin 666', 'Santa Fe','Santa Fe','Argentina');
insert into clientes
values ('Lopez Carlos','Irigoyen 888', 'Cordoba','Cordoba','Argentina');
insert into clientes
values ('Ramos Betina','San Martin 999', 'Cordoba','Cordoba','Argentina');
insert into clientes
values ('Fernando Salas','Mariano Osorio 1234', 'Santiago','Region metropolitana','Chile');
insert into clientes
values ('German Rojas','Allende 345', 'Valparaiso','Region V','Chile');
insert into clientes
values ('Ricardo Jara','Pablo Neruda 146', 'Santiago','Region metropolitana','Chile');
insert into clientes
values ('Joaquin Robles','Diego Rivera 147', 'Guadalajara','Jalisco','Mexico');

-- 4
SELECT pais AS Pais, 
COUNT(*) AS Cantidad
FROM clientes
GROUP BY pais WITH ROLLUP;

-- 5
SELECT pais AS Pais, estado AS Estado,
COUNT(*) AS Cantidad
FROM clientes
GROUP BY pais, estado WITH ROLLUP;

-- 6
SELECT pais AS Pais, estado AS Estado, ciudad AS Ciudad,
COUNT(*) AS Cantidad
FROM clientes
GROUP BY pais, estado, ciudad
WITH ROLLUP;

/*

Un instituto de enseñanza guarda las notas de sus alumnos en una tabla llamada "notas".
1- Elimine la tabla si existe:
 if object_id('notas') is not null
  drop table notas;

2- Cree la tabla con la siguiente estructura:
 create table notas(
  documento char(8) not null,
  materia varchar(30),
  nota decimal(4,2)
 );

3-Ingrese algunos registros:
 insert into notas values ('22333444','Programacion',8);
 insert into notas values ('22333444','Programacion',9);
 insert into notas values ('22333444','Ingles',8);
 insert into notas values ('22333444','Ingles',7);
 insert into notas values ('22333444','Ingles',6);
 insert into notas values ('22333444','Sistemas de datos',10);
 insert into notas values ('22333444','Sistemas de datos',9);

 insert into notas values ('23444555','Programacion',5);
 insert into notas values ('23444555','Programacion',4);
 insert into notas values ('23444555','Programacion',3);
 insert into notas values ('23444555','Ingles',9);
 insert into notas values ('23444555','Ingles',7);
 insert into notas values ('23444555','Sistemas de datos',9);

 insert into notas values ('24555666','Programacion',1);
 insert into notas values ('24555666','Programacion',3.5);
 insert into notas values ('24555666','Ingles',4.5);
 insert into notas values ('24555666','Sistemas de datos',6);

4- Se necesita el promedio por alumno por materia y el promedio de cada alumno en todas las materias 
cursadas hasta el momento (13 registros):
 select documento,materia,
  avg(nota) as promedio
  from notas
  group by documento,materia with rollup;
Note que  hay 4 filas extras, 3 con el promedio de cada alumno y 1 con el promedio de todos los 
alumnos de todas las materias.

5- Compruebe los resultados parciales de la consulta anterior realizando otra consulta mostrando el 
promedio de todas las carreras de cada alumno (4 filas)

6- Muestre la cantidad de notas de cada alumno, por materia (9 filas)

7- Realice la misma consulta anterior con resultados parciales incluidos (13 filas)

8- Muestre la nota menor y la mayor de cada alumno y la menor y mayor nota de todos (use "rollup") 
(4 filas)

*/

-- 1
IF OBJECT_ID('notas') IS NOT NULL
	DROP TABLE notas;

-- 2
CREATE TABLE notas(
	documento CHAR(8) NOT NULL,
	materia VARCHAR(30),
	nota DECIMAL(4,2)
);

-- 3
insert into notas values ('22333444','Programacion',8);
insert into notas values ('22333444','Programacion',9);
insert into notas values ('22333444','Ingles',8);
insert into notas values ('22333444','Ingles',7);
insert into notas values ('22333444','Ingles',6);
insert into notas values ('22333444','Sistemas de datos',10);
insert into notas values ('22333444','Sistemas de datos',9);

insert into notas values ('23444555','Programacion',5);
insert into notas values ('23444555','Programacion',4);
insert into notas values ('23444555','Programacion',3);
insert into notas values ('23444555','Ingles',9);
insert into notas values ('23444555','Ingles',7);
insert into notas values ('23444555','Sistemas de datos',9);

insert into notas values ('24555666','Programacion',1);
insert into notas values ('24555666','Programacion',3.5);
insert into notas values ('24555666','Ingles',4.5);
insert into notas values ('24555666','Sistemas de datos',6);

-- 4
SELECT documento AS Documento, materia AS Materia,
AVG(nota) AS 'Nota Promedio'
FROM notas
GROUP BY documento, materia WITH ROLLUP;

-- 5
SELECT documento AS Documento,
AVG(nota) AS 'Nota Promedio'
FROM notas
GROUP BY documento WITH ROLLUP;

-- 6
SELECT documento AS Documento, materia AS Materia,
COUNT(nota) AS Cantidad
FROM notas
GROUP BY documento, materia;

-- 7
SELECT documento AS Documento, materia AS Materia,
COUNT(nota) AS Cantidad
FROM notas
GROUP BY documento, materia WITH ROLLUP;

-- 8
SELECT documento AS Documento,
MAX(nota) AS Maxima,
MIN(nota) AS Minima
FROM notas
GROUP BY documento WITH ROLLUP;