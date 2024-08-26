/*

Una agencia matrimonial almacena la información de sus clientes de sexo femenino en una tabla 
llamada "mujeres" y en otra la de sus clientes de sexo masculino llamada "varones".
1- Elimine las tablas si existen y créelas:
 if object_id('mujeres') is not null
  drop table mujeres;
 if object_id('varones') is not null
  drop table varones;
 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );
 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

2- Ingrese los siguientes registros:
 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);

 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
masculino. Use un "cross join" (12 registros)

4- Realice la misma combinación pero considerando solamente las personas mayores de 40 años (6 
registros)

5- Forme las parejas pero teniendo en cuenta que no tengan una diferencia superior a 10 años (8 
registros)

*/

-- 1
IF OBJECT_ID('mujeres') IS NOT NULL
	DROP TABLE mujeres;

IF OBJECT_ID('varones') IS NOT NULL
	DROP TABLE varones;

CREATE TABLE mujeres(
	nombre			VARCHAR(30),
	domicilio		VARCHAR(30),
	edad			INTEGER
);

CREATE TABLE varones(
	nombre			VARCHAR(30),
	domicilio		VARCHAR(30),
	edad			INTEGER
);

-- 2
insert into mujeres values('Maria Lopez','Colon 123',45);
insert into mujeres values('Liliana Garcia','Sucre 456',35);
insert into mujeres values('Susana Lopez','Avellaneda 98',41);

insert into varones values('Juan Torres','Sarmiento 755',44);
insert into varones values('Marcelo Oliva','San Martin 874',56);
insert into varones values('Federico Pereyra','Colon 234',38);
insert into varones values('Juan Garcia','Peru 333',50);

-- 3
SELECT M.nombre AS 'Nombre Mujer',
M.edad AS 'Edad Mujer',
V.nombre AS 'Nombre Varon',
V.edad AS 'Edad Varon'
FROM mujeres AS M
CROSS JOIN varones AS V;

-- 4
SELECT M.nombre AS 'Nombre Mujer',
M.edad AS 'Edad Mujer',
V.nombre AS 'Nombre Varon',
V.edad AS 'Edad Varon'
FROM mujeres AS M
CROSS JOIN varones AS V
WHERE V.edad > 40 AND M.edad > 40;

-- 5
SELECT M.nombre AS 'Nombre Mujer',
M.edad AS 'Edad Mujer',
V.nombre AS 'Nombre Varon',
V.edad AS 'Edad Varon'
FROM mujeres AS M
CROSS JOIN varones AS V
WHERE M.edad - V.edad BETWEEN -10 AND 10;

/*

Una empresa de seguridad almacena los datos de sus guardias de seguridad en una tabla llamada 
"guardias". también almacena los distintos sitios que solicitaron sus servicios en una tabla llamada 
"tareas".
1- Elimine las tablas "guardias" y "tareas" si existen:
 if object_id('guardias') is not null
  drop table guardias;
 if object_id('tareas') is not null
  drop table tareas;

2- Cree las tablas:
 create table guardias(
  documento char(8),
  nombre varchar(30),
  sexo char(1), /* 'f' o 'm' */
  domicilio varchar(30),
  primary key (documento)
 );

 create table tareas(
  codigo tinyint identity,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2), /* 'AM' o 'PM'*/
  primary key (codigo)
 );

3- Ingrese los siguientes registros:
 insert into guardias values('22333444','Juan Perez','m','Colon 123');
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

 insert into tareas values('Colon 1111','vigilancia exterior','AM');
 insert into tareas values('Urquiza 234','vigilancia exterior','PM');
 insert into tareas values('Peru 345','vigilancia interior','AM');
 insert into tareas values('Avellaneda 890','vigilancia interior','PM');

4- La empresa quiere que todos sus empleados realicen todas las tareas. Realice una "cross join" (20 
registros)

5- En este caso, la empresa quiere que todos los guardias de sexo femenino realicen las tareas de 
"vigilancia interior" y los de sexo masculino de "vigilancia exterior". Realice una "cross join" con 
un "where" que controle tal requisito (10 registros)

*/

-- 1
IF OBJECT_ID('guardias') IS NOT NULL
	DROP TABLE guardias;

IF OBJECT_ID('tareas') IS NOT NULL
	DROP TABLE tareas;

-- 2
CREATE TABLE guardias(
	documento		CHAR(8),
	nombre			VARCHAR(30),
	sexo			CHAR(1),
	domicilio		VARCHAR(30),
	PRIMARY KEY		(documento)
);

CREATE TABLE tareas(
	codigo			TINYINT IDENTITY,
	domicilio		VARCHAR(30),
	descripcion		VARCHAR(30),
	horario			CHAR(2), -- AM o PM
	PRIMARY KEY		(codigo)
);

-- 3
insert into guardias values('22333444','Juan Perez','m','Colon 123');
insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

insert into tareas values('Colon 1111','vigilancia exterior','AM');
insert into tareas values('Urquiza 234','vigilancia exterior','PM');
insert into tareas values('Peru 345','vigilancia interior','AM');
insert into tareas values('Avellaneda 890','vigilancia interior','PM');

-- 4
SELECT nombre AS Nombre,
T.domicilio AS 'Domicilio de Tarea',
descripcion AS Descripcion
FROM guardias
CROSS JOIN tareas AS T;

-- 5
SELECT nombre AS Nombre,
T.domicilio AS 'Domicilio de Tarea',
descripcion AS Descripcion
FROM guardias AS G
CROSS JOIN tareas AS T
WHERE (G.sexo = 'f' AND T.descripcion = 'vigilancia interior')
OR (G.sexo = 'm' AND T.descripcion = 'vigilancia exterior');
