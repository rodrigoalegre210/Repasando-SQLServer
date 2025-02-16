/*

Trabaje con la tabla "agenda" en la que registra los datos de sus amigos.

1- Elimine "agenda", si existe:
 if object_id('agenda') is not null
  drop table agenda;

2- Cree la tabla, con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11).

3- Visualice la estructura de la tabla "agenda".

4- Ingrese los siguientes registros:
 Acosta, Ana, Colon 123, 4234567;
 Bustamante, Betina, Avellaneda 135, 4458787;
 Lopez, Hector, Salta 545, 4887788; 
 Lopez, Luis, Urquiza 333, 4545454;
 Lopez, Marisa, Urquiza 333, 4545454.

5- Seleccione todos los registros de la tabla

6- Seleccione el registro cuyo nombre sea "Marisa" (1 registro)

7- Seleccione los nombres y domicilios de quienes tengan apellido igual a "Lopez" (3 registros)

8- Muestre el nombre de quienes tengan el teléfono "4545454" (2 registros)

*/

-- 1
IF OBJECT_ID('agenda') IS NOT NULL
	DROP TABLE agenda;

-- 2
CREATE TABLE agenda(
	apellido	VARCHAR(30),
	nombre		VARCHAR(20),
	domicilio	VARCHAR(30),
	telefono	VARCHAR(11)
);

-- 3
EXEC sp_columns agenda;

-- 4
insert into agenda (apellido,nombre,domicilio,telefono)
values('Acosta','Ana','Colon 123','4234567');
insert into agenda (apellido,nombre,domicilio,telefono)
values('Bustamante','Betina','Avellaneda 135','4458787');
insert into agenda (apellido,nombre,domicilio,telefono)
values('Lopez','Hector','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono)
values('Lopez','Luis','Urquiza 333','4545454');
insert into agenda (apellido,nombre,domicilio,telefono)
values('Lopez','Marisa','Gral. Paz 1234','4123456');

-- 5
SELECT * FROM agenda;

-- 6
SELECT * FROM agenda
WHERE nombre = 'Marisa';

-- 7
SELECT nombre, apellido FROM agenda
WHERE apellido = 'Lopez';

-- 8
SELECT nombre FROM agenda
WHERE telefono = '4545454';

/*

Trabaje con la tabla "libros" de una librería que guarda información referente a sus libros 
disponibles para la venta.

1- Elimine la tabla si existe.

2- Cree la tabla "libros". Debe tener la siguiente estructura:
 create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15));

3- Visualice la estructura de la tabla "libros".

4- Ingrese los siguientes registros:
 El aleph,Borges,Emece;
 Martin Fierro,Jose Hernandez,Emece;
 Martin Fierro,Jose Hernandez,Planeta;
 Aprenda PHP,Mario Molina,Siglo XXI;

5- Seleccione los registros cuyo autor sea "Borges" (1 registro)

6- Seleccione los títulos de los libros cuya editorial sea "Emece" (2 registros)

7- Seleccione los nombres de las editoriales de los libros cuyo titulo sea "Martin Fierro" (2 
registros)

*/

-- 1
IF OBJECT_ID('libros') IS NOT NULL
	DROP TABLE libros;

-- 2
CREATE TABLE libros(
	titulo		VARCHAR(20),
	autor		VARCHAR(30),
	editorial	VARCHAR(15)
);

-- 3
EXEC sp_columns libros;

-- 4
INSERT INTO libros (titulo, autor, editorial)
VALUES ('El aleph', 'Borges', 'Emece');
INSERT INTO libros (titulo, autor, editorial)
VALUES ('Martin Fierro', 'Jose Hernandez', 'Emece');
INSERT INTO libros (titulo, autor, editorial)
VALUES ('Martin Fierro', 'Jose Hernandez', 'Planeta');
INSERT INTO libros (titulo, autor, editorial)
VALUES ('Aprenda PHP', 'Mario Molina', 'Siglo XXI');

-- 5
SELECT * FROM libros
WHERE autor = 'Borges';

-- 6
SELECT titulo FROM libros
WHERE editorial = 'Emece';

-- 7
SELECT editorial FROM libros
WHERE titulo = 'Martin Fierro';