/*

Trabaje con la tabla llamada "medicamentos" de una farmacia.
1- Elimine la tabla, si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

2- Cree la tabla con la siguiente estructura:
 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 );

3- Ingrese algunos registros:
 insert into medicamentos
  values('Sertal','Roche',5.2,1,'2015-02-01',null);
 insert into medicamentos 
  values('Buscapina','Roche',4.10,3,'2016-03-01',null);
 insert into medicamentos 
  values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
 insert into medicamentos
  values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
 insert into medicamentos 
  values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
  insert into medicamentos 
  values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null); 

4- Muestre la cantidad de registros empleando la función "count_big(*)" (6 registros)

5- Cuente la cantidad de laboratorios distintos (3 registros)

6- Cuente la cantidad de medicamentos que tienen precio y cantidad distinto de "null" (5 y 5)

*/

-- 1
IF OBJECT_ID('medicamentos') IS NOT NULL
	DROP TABLE medicamentos;

-- 2
CREATE TABLE medicamentos(
	codigo				INT IDENTITY,
	nombre				VARCHAR(20),
	laboratorio			VARCHAR(20),
	precio				DECIMAL(6, 2),
	cantidad			TINYINT,
	fechavencimiento	DATETIME NOT NULL,
	numerolote			INT DEFAULT NULL,
	PRIMARY KEY			(codigo)
);

-- 3
insert into medicamentos
values('Sertal','Roche',5.2,1,'2015-02-01',null);
insert into medicamentos 
values('Buscapina','Roche',4.10,3,'2016-03-01',null);
insert into medicamentos 
values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null);
insert into medicamentos
values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null);
insert into medicamentos 
values('Bayaspirina',null,2.10,null,'2019-12-01',null); 
insert into medicamentos 
values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null);

-- 4
SELECT COUNT_BIG(*) AS 'Conteo de Registros' 
FROM medicamentos;

-- 5
SELECT COUNT_BIG(DISTINCT laboratorio) AS 'Laboratorios únicos'
FROM medicamentos;

-- 6
SELECT COUNT_BIG(precio) AS 'Con precio',
COUNT_BIG(cantidad) AS 'Con cantidad'
FROM medicamentos;