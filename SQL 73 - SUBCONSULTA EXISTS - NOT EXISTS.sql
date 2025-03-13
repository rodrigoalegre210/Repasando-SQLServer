/*

Un club dicta clases de distintos deportes a sus socios. El club tiene una tabla llamada 
"inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
y la cantidad de cuotas pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
denominada "socios" en la que guarda los datos personales de cada socio.
1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;

2- Cree las tablas:
 create table socios(
  numero int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio int not null,
  deporte varchar(20) not null,
  cuotas tinyint
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10)
  constraint DF_inscriptos_cuotas default 0,
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on update cascade
   on delete cascade,
 );

3- Ingrese algunos registros:
 insert into socios values('23333333','Alberto Paredes','Colon 111');
 insert into socios values('24444444','Carlos Conte','Sarmiento 755');
 insert into socios values('25555555','Fabian Fuentes','Caseros 987');
 insert into socios values('26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);

4- Emplee una subconsulta con el operador "exists" para devolver la lista de socios que se 
inscribieron en un determinado deporte.
3 registros.

5- Busque los socios que NO se han inscripto en un deporte determinado empleando "not exists".
1 registro.

6- Muestre todos los datos de los socios que han pagado todas las cuotas.
1 registro.

*/

-- 1
IF OBJECT_ID('socios') IS NOT NULL
	DROP TABLE socios;

IF OBJECT_ID('inscriptos') IS NOT NULL
	DROP TABLE inscriptos;

-- 2
CREATE TABLE socios(
	numero			INTEGER IDENTITY,
	documento		CHAR(8),
	nombre			VARCHAR(30),
	domicilio		VARCHAR(30),
	PRIMARY KEY		(numero)
);

CREATE TABLE inscriptos(
	numerosocio		INTEGER NOT NULL,
	deporte			VARCHAR(20) NOT NULL,
	cuotas			TINYINT
	CONSTRAINT CK_inscriptos_cuotas
	CHECK (cuotas >= 0 AND cuotas <= 10)
	CONSTRAINT DF_inscriptos_cuotas
	DEFAULT 0,
	PRIMARY KEY		(numerosocio, deporte),
	FOREIGN KEY		(numerosocio)
	REFERENCES socios(numero)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

-- 3
insert into socios values('23333333','Alberto Paredes','Colon 111');
insert into socios values('24444444','Carlos Conte','Sarmiento 755');
insert into socios values('25555555','Fabian Fuentes','Caseros 987');
insert into socios values('26666666','Hector Lopez','Sucre 344');

insert into inscriptos values(1,'tenis',1);
insert into inscriptos values(1,'basquet',2);
insert into inscriptos values(1,'natacion',1);
insert into inscriptos values(2,'tenis',9);
insert into inscriptos values(2,'natacion',1);
insert into inscriptos values(2,'basquet',default);
insert into inscriptos values(2,'futbol',2);
insert into inscriptos values(3,'tenis',8);
insert into inscriptos values(3,'basquet',9);
insert into inscriptos values(3,'natacion',0);
insert into inscriptos values(4,'basquet',10);

-- 4
SELECT nombre AS Nombre
FROM socios AS s
WHERE EXISTS (SELECT * FROM inscriptos AS i
WHERE s.numero = i.numerosocio
AND i.deporte = 'natacion');

-- 5
SELECT nombre AS Nombre
FROM socios AS s
WHERE NOT EXISTS (SELECT * FROM inscriptos AS i
WHERE s.numero = i.numerosocio
AND i.deporte = 'tenis');

-- 6
SELECT * FROM socios AS s
WHERE EXISTS (SELECT * FROM inscriptos AS i
WHERE s.numero = i.numerosocio
AND i.cuotas = 10);