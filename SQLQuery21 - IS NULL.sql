/*

Trabajamos con la tabla "peliculas" de un video club que alquila películas en video.
1- Elimine la tabla, si existe;
 if object_id('peliculas') is not null
  drop table peliculas;

2- Créela con la siguiente estructura:
 create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 );

3- Ingrese algunos registros:
 insert into peliculas
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas
  values('Harry Potter y la piedra filosofal','Daniel R.',null);
 insert into peliculas
  values('Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas
  values('Mision imposible 2','Tom Cruise',120);
 insert into peliculas
  values('Mujer bonita',null,120);
 insert into peliculas
  values('Tootsie','D. Hoffman',90);
 insert into peliculas (titulo)
  values('Un oso rojo');

4- Recupere las películas cuyo actor sea nulo (2 registros)

5- Cambie la duración a 0, de las películas que tengan duración igual a "null" (2 registros)

6- Borre todas las películas donde el actor sea "null" y cuya duración sea 0 (1 registro)

*/

-- 1
IF OBJECT_ID('peliculas') IS NOT NULL
	DROP TABLE peliculas;

-- 2
CREATE TABLE peliculas(
	codigo			INT IDENTITY,
	titulo			VARCHAR(40) NOT NULL,
	actor			VARCHAR(20),
	duracion		TINYINT,
	PRIMARY KEY		(codigo)
);

-- 3
insert into peliculas
values('Mision imposible','Tom Cruise',120);
insert into peliculas
values('Harry Potter y la piedra filosofal','Daniel R.',null);
insert into peliculas
values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas
values('Mision imposible 2','Tom Cruise',120);
insert into peliculas
values('Mujer bonita',null,120);
insert into peliculas
values('Tootsie','D. Hoffman',90);
insert into peliculas (titulo)
values('Un oso rojo');

-- 4
SELECT * FROM peliculas
WHERE actor IS NULL;

-- 5
UPDATE peliculas SET duracion = 0
WHERE duracion IS NULL;

-- 6
DELETE FROM peliculas
WHERE actor IS NULL AND duracion = 0;

SELECT * FROM peliculas;