/*

Un club dicta clases de distintos deportes. Almacena la información en una tabla llamada "deportes" 
en la cual incluye el nombre del deporte y el nombre del profesor y en otra tabla llamada 
"inscriptos" que incluye el documento del socio que se inscribe, el deporte y si la matricula está 
paga o no.
1- Elimine las tablas si existen y cree las tablas:
 if (object_id('deportes')) is not null
  drop table deportes;
 if (object_id('inscriptos')) is not null
  drop table inscriptos;
 create table deportes(
  codigo tinyint identity,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 );
 create table inscriptos(
  documento char(8),
  codigodeporte tinyint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 );

2- Ingrese algunos registros para ambas tablas:
 insert into deportes values('tenis','Marcelo Roca');
 insert into deportes values('natacion','Marta Torres');
 insert into deportes values('basquet','Luis Garcia');
 insert into deportes values('futbol','Marcelo Roca');
 
 insert into inscriptos values('22222222',3,'s');
 insert into inscriptos values('23333333',3,'s');
 insert into inscriptos values('24444444',3,'n');
 insert into inscriptos values('22222222',2,'s');
 insert into inscriptos values('23333333',2,'s');
 insert into inscriptos values('22222222',4,'n'); 
 insert into inscriptos values('22222222',5,'n'); 

3- Muestre todos la información de la tabla "inscriptos", y consulte la tabla "deportes" para 
obtener el nombre de cada deporte (6 registros)

4- Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)

5- Obtenga la misma salida anterior empleando un "rigth join".

6- Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)

7- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 
registro)

8- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones 
a deportes inexistentes en "deportes" y los deportes que no tienen inscriptos (8 registros)

*/

-- 1
IF OBJECT_ID('deportes') IS NOT NULL
	DROP TABLE deportes;

IF OBJECT_ID('inscriptos') IS NOT NULL
	DROP TABLE inscriptos;

CREATE TABLE deportes(
	codigo			TINYINT IDENTITY,
	nombre			VARCHAR(30),
	profesor		VARCHAR(30),
	PRIMARY KEY		(codigo)
);

CREATE TABLE inscriptos(
	documento CHAR(8),
	codigodeporte TINYINT NOT NULL,
	matricula CHAR(1) -- S = Paga, N = Impaga
);

-- 2
insert into deportes values('tenis','Marcelo Roca');
insert into deportes values('natacion','Marta Torres');
insert into deportes values('basquet','Luis Garcia');
insert into deportes values('futbol','Marcelo Roca');
 
insert into inscriptos values('22222222',3,'s');
insert into inscriptos values('23333333',3,'s');
insert into inscriptos values('24444444',3,'n');
insert into inscriptos values('22222222',2,'s');
insert into inscriptos values('23333333',2,'s');
insert into inscriptos values('22222222',4,'n'); 
insert into inscriptos values('22222222',5,'n'); 

-- 3
SELECT * FROM inscriptos;
SELECT * FROM deportes;

-- 4
SELECT I.documento AS Documento,
I.matricula AS Matricula,
D.nombre AS Deporte
FROM inscriptos AS I
LEFT JOIN deportes AS D
ON I.codigodeporte = D.codigo;

-- 5
SELECT I.documento AS Documento,
I.matricula AS Matricula,
D.nombre AS Deporte
FROM deportes AS D
RIGHT JOIN inscriptos AS I
ON I.codigodeporte = D.codigo;

-- 6
SELECT D.nombre AS Deporte
FROM deportes AS D
LEFT JOIN inscriptos AS I
ON I.codigodeporte = D.codigo
WHERE codigodeporte IS NULL;

-- 7
SELECT I.documento AS Documento
FROM inscriptos AS I
LEFT JOIN deportes AS D
ON I.codigodeporte = D.codigo
WHERE D.codigo IS NULL;

-- 8
SELECT documento AS Documento,
nombre AS Nombre,
profesor AS Profesor,
matricula AS Matricula
FROM inscriptos AS I
FULL JOIN deportes AS D
ON codigodeporte = codigo;
