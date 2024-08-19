/*

Una empresa de remises tiene registrada la información de sus vehículos en una tabla llamada 
"remis".
1- Elimine la tabla si existe:
 if object_id('remis') is not null
  drop table remis;

2- Cree la tabla con la siguiente estructura:
 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

3- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula:
 insert into remis values('ABC123','Renault clio','1990');
 insert into remis values('DEF456','Peugeot 504','1995');
 insert into remis values('DEF456','Fiat Duna','1998');
 insert into remis values('GHI789','Fiat Duna','1995');
 insert into remis values(null,'Fiat Duna','1995');

4- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará 
valores repetidos.
No se puede porque hay valores duplicados.

5- Elimine el registro con patente duplicada y establezca la restricción.
Note que hay 1 registro con valor nulo en "patente".

6- Intente ingresar un registro con patente repetida (no lo permite)

7- Intente ingresar un registro con valor nulo para el campo "patente".
No lo permite porque la clave estaría duplicada.

8- Muestre la información de las restricciones:
 exec sp_helpconstraint remis;

*/

-- 1
IF OBJECT_ID('remis') IS NOT NULL
	DROP TABLE remis;

-- 2
CREATE TABLE remis(
	numero		TINYINT IDENTITY,
	patente		CHAR(6),
	marca		VARCHAR(15),
	modelo		CHAR(4)
);

-- 3
insert into remis values('ABC123','Renault clio','1990');
insert into remis values('DEF456','Peugeot 504','1995');
insert into remis values('DEF456','Fiat Duna','1998');
insert into remis values('GHI789','Fiat Duna','1995');
insert into remis values(null,'Fiat Duna','1995');

-- 4
ALTER TABLE remis
ADD CONSTRAINT UQ_remis_patente
UNIQUE (patente);

-- 5
DELETE FROM remis
WHERE patente = 'DEF456' AND marca = 'Fiat Duna';

ALTER TABLE remis
ADD CONSTRAINT UQ_remis_patente
UNIQUE (patente);

-- 6
insert into remis values('DEF456','Fiat Duna','1998');

-- 7
insert into remis values(NULL,'Fiat Duna','1998');

-- 8
exec sp_helpconstraint remis;