/*

Un comercio almacena los datos de los artículos para la venta en una tabla denominada "articulos".
1- Elimine la tabla, si existe y créela nuevamente:
 if object_id('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo int identity,
  descripcion varchar(30),
  precio decimal(5,2) not null,
  cantidad smallint not null default 0,
  montototal as precio *cantidad
 );
El campo "montototal" es un campo calculado que multiplica el precio de cada artículo por la 
cantidad disponible.

2- Intente ingresar un registro con valor para el campo calculado:
 insert into articulos values('birome',1.5,100,150);
No lo permite.

3- Ingrese algunos registros:
 insert into articulos values('birome',1.5,100);
 insert into articulos values('cuaderno 12 hojas',4.8,150);
 insert into articulos values('lapices x 12',5,200);

4- Recupere los registros:
 select * from articulos;

5- Actualice un precio y recupere los registros:
 update articulos set precio=2 where descripcion='birome';
 select * from articulos;
el campo calculado "montototal" recalcula los valores para cada registro automáticamente.

6- Actualice una cantidad y vea el resultado:
 update articulos set cantidad=200 where descripcion='birome';
 select * from articulos;
el campo calculado "montototal" recalcula sus valores.

7- Intente actualizar un campo calculado:
 update articulos set montototal=300 where descripcion='birome';
No lo permite.

*/

-- 1
IF OBJECT_ID('articulos') IS NOT NULL
	DROP TABLE articulos;

CREATE TABLE articulos(
	codigo			INTEGER IDENTITY,
	descripcion		VARCHAR(30),
	precio			DECIMAL(5,2) NOT NULL,
	cantidad		SMALLINT NOT NULL DEFAULT 0,
	montocompra		AS precio * cantidad
);

-- 2
insert into articulos values('birome',1.5,100,150);

-- 3
insert into articulos values('birome',1.5,100);
insert into articulos values('cuaderno 12 hojas',4.8,150);
insert into articulos values('lapices x 12',5,200);

-- 4
SELECT * FROM articulos;

-- 5
UPDATE articulos SET precio = 2
WHERE descripcion = 'birome';

SELECT * FROM articulos;

-- 6
UPDATE articulos SET cantidad = 200
WHERE descripcion = 'birome';

SELECT * FROM articulos;

-- 7
UPDATE articulos SET montocompra = 300
WHERE descripcion = 'birome';