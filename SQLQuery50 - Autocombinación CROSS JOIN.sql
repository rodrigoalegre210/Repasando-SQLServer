/*

Una agencia matrimonial almacena la información de sus clientes en una tabla llamada "clientes".
1- Elimine la tabla si existe y créela:
 if object_id('clientes') is not null
  drop table clientes;

 create table clientes(
  nombre varchar(30),
  sexo char(1),--'f'=femenino, 'm'=masculino
  edad int,
  domicilio varchar(30)
 );


2- Ingrese los siguientes registros:
 insert into clientes values('Maria Lopez','f',45,'Colon 123');
 insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
 insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
 insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
 insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
 insert into clientes values('Federico Pereyra','m',38,'Colon 234');
 insert into clientes values('Juan Garcia','m',50,'Peru 333');

3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
masculino. Use un  "cross join" (12 registros)

4- Obtenga la misma salida enterior pero realizando un "join".

5- Realice la misma autocombinación que el punto 3 pero agregue la condición que las parejas no 
tengan una diferencia superior a 5 años (5 registros)

*/

-- 1
IF OBJECT_ID('clientes') IS NOT NULL
	DROP TABLE clientes;

CREATE TABLE clientes(
	nombre			VARCHAR(30),
	sexo			CHAR(1),
	edad			INTEGER,
	domicilio		VARCHAR(30)
);

-- 2
insert into clientes values('Maria Lopez','f',45,'Colon 123');
insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
insert into clientes values('Federico Pereyra','m',38,'Colon 234');
insert into clientes values('Juan Garcia','m',50,'Peru 333');

-- 3
SELECT c1.nombre AS Nombre,
c1.sexo AS Sexo,
c1.edad AS Edad,
c1.domicilio AS Domicilio,
c2.nombre AS Nombre,
c2.sexo AS Sexo,
c2.edad AS Edad,
c2.domicilio AS Domicilio
FROM clientes AS c1
CROSS JOIN clientes AS c2
WHERE c1.sexo = 'f' AND c2.sexo = 'm';

-- 4
SELECT c1.nombre AS Nombre,
c1.sexo AS Sexo,
c1.edad AS Edad,
c1.domicilio AS Domicilio,
c2.nombre AS Nombre,
c2.sexo AS Sexo,
c2.edad AS Edad,
c2.domicilio AS Domicilio
FROM clientes AS c1
JOIN clientes AS c2
ON c1.nombre <> c2.nombre
WHERE c1.sexo = 'f' AND c2.sexo = 'm';

-- 5
SELECT c1.nombre AS Nombre,
c1.sexo AS Sexo,
c1.edad AS Edad,
c1.domicilio AS Domicilio,
c2.nombre AS Nombre,
c2.sexo AS Sexo,
c2.edad AS Edad,
c2.domicilio AS Domicilio
FROM clientes AS c1
CROSS JOIN clientes AS c2
WHERE c1.sexo = 'f' AND c2.sexo = 'm'
AND c1.edad - c2.edad BETWEEN -5 AND 5;

/*

Varios clubes de barrio se organizaron para realizar campeonatos entre ellos. La tabla llamada 
"equipos" guarda la informacion de los distintos equipos que jugarán.
1- Elimine la tabla, si existe y créela nuevamente:
 if object_id('equipos') is not null
  drop table equipos;

 create table equipos(
  nombre varchar(30),
  barrio varchar(20),
  domicilio varchar(30),
  entrenador varchar(30)
 );

2- Ingrese los siguientes registros:
 insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
 insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
 insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
 insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

4- Cada equipo jugará con todos los demás 2 veces, una vez en cada sede. Realice un "cross join" 
para combinar los equipos teniendo en cuenta que un equipo no juega consigo mismo (12 registros)

5- Obtenga el mismo resultado empleando un "join".

6- Realice un "cross join" para combinar los equipos para que cada equipo juegue con cada uno de los 
otros una sola vez (6 registros)

*/

-- 1
IF OBJECT_ID('equipos') IS NOT NULL
	DROP TABLE equipos;

CREATE TABLE equipos(
	nombre			VARCHAR(30),
	barrio			VARCHAR(20),
	domicilio		VARCHAR(30),
	entrenador		VARCHAR(30)
);

-- 2
insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

-- 3
SELECT e1.nombre AS 'Equipo N1',
e2.nombre AS 'Equipo N2',
e1.barrio AS Sede
FROM equipos AS e1
CROSS JOIN equipos AS e2
WHERE e1.nombre <> e2.nombre;

-- 4
SELECT e1.nombre AS 'Equipo N1',
e2.nombre AS 'Equipo N2',
e1.barrio AS Sede
FROM equipos AS e1
JOIN equipos AS e2
ON e1.nombre <> e2.nombre;

-- 5
SELECT e1.nombre AS 'Equipo N1',
e2.nombre AS 'Equipo N2',
e1.barrio AS Sede
FROM equipos AS e1
CROSS JOIN equipos AS e2
WHERE e1.nombre > e2.nombre;
