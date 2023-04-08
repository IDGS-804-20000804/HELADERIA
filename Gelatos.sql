DROP DATABASE IF EXISTS gelatos;
CREATE DATABASE gelatos;
USE gelatos;
CREATE TABLE `unidad_medida` (
  `id_unidad_medida` INT AUTO_INCREMENT PRIMARY KEY,
  `descripcion` VARCHAR(255),
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `materia_prima` (
  `id_materia_prima` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(255),
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_unidad_medida` INT
);

CREATE TABLE `roles` (
  `id_rol` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(255),
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `usuario` (
  `id_usuario` INT AUTO_INCREMENT PRIMARY KEY,
  `correo` VARCHAR(255),
  `contrasenia` VARCHAR(255)
);

CREATE TABLE `rol_usuario` (
  `id_rol_usuario` INT AUTO_INCREMENT PRIMARY KEY,
  `fk_usuario` INT,
  `fk_rol` INT
);

CREATE TABLE `persona` (
  `id_persona` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(255),
  `apaterno` VARCHAR(255),
  `amaterno` VARCHAR(255),
  `telefono` VARCHAR(255),
  `codigo_postal` INT,
  `numero_interior` INT,
  `numero_exterior` INT,
  `calle` VARCHAR(255),
  `colonia` VARCHAR(255),
  `estatus` BOOLEAN
);

CREATE TABLE `cliente` (
  `id_cliente` INT AUTO_INCREMENT PRIMARY KEY,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_persona` INT,
  `fk_usuario` INT
);

CREATE TABLE `proveedor` (
  `id_proveedor` INT AUTO_INCREMENT PRIMARY KEY,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_persona` INT
);

CREATE TABLE `empleado` (
  `id_empleado` INT AUTO_INCREMENT PRIMARY KEY,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_persona` INT,
  `fk_usuario` INT
);

CREATE TABLE `compra` (
  `id_compra` INT AUTO_INCREMENT PRIMARY KEY,
  `total` FLOAT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_proveedor` INT
  `fk_empleado` INT
);

CREATE TABLE `detalle_compra` (
  `id_detalle_compra` INT AUTO_INCREMENT PRIMARY KEY,
  `cantidad` FLOAT,
  `precio` FLOAT,
  `fk_almacen` INT,
  `fk_compra` INT
);

CREATE TABLE `almacen` (
  `id_almacen` INT AUTO_INCREMENT PRIMARY KEY,
  `cantidad` INT,
  `caducidad` DATE,
  `estatus` BOOLEAN,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_materia_prima` INT
);

CREATE TABLE `receta` (
  `id_receta` INT AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(255),
  `cantidad` INT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `detalle_materia_prima_receta` (
  `id_detalle_materia_prima_receta` INT AUTO_INCREMENT PRIMARY KEY,
  `fk_receta` INT,
  `cantidad` FLOAT,
  `fk_materia_prima` INT
);

CREATE TABLE `detalle_almacen_stock` (
  `id_detalle_almacen_stock` INT AUTO_INCREMENT PRIMARY KEY,
  `cantidad` FLOAT,
  `fk_almacen` INT,
  `fk_stock` INT
);

CREATE TABLE `stock` (
  `id_stock` INT AUTO_INCREMENT PRIMARY KEY,
  `caducidad` VARCHAR(255),
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_receta` INT
);

CREATE TABLE `venta` (
  `id_venta` INT AUTO_INCREMENT PRIMARY KEY,
  `total` FLOAT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_cliente` INT
);

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` INT AUTO_INCREMENT PRIMARY KEY,
  `cantidad` FLOAT,
  `precio` FLOAT,
  `fk_stock` INT,
  `fk_venta` INT
);

CREATE TABLE `envio` (
  `id_envio` INT AUTO_INCREMENT PRIMARY KEY,
  `fecha_entrega` DATE,
  `entregado` boolean,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_venta` INT,
  `fk_empleado` INT
);

ALTER TABLE `materia_prima` ADD FOREIGN KEY (`fk_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`);

ALTER TABLE `rol_usuario` ADD FOREIGN KEY (`fk_rol`) REFERENCES `roles` (`id_rol`);

ALTER TABLE `rol_usuario` ADD FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `cliente` ADD FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`);

ALTER TABLE `cliente` ADD FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `proveedor` ADD FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`);

ALTER TABLE `empleado` ADD FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`);

ALTER TABLE `empleado` ADD FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `compra` ADD FOREIGN KEY (`fk_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

ALTER TABLE `compra` ADD FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`id_empleado`);

ALTER TABLE `detalle_compra` ADD FOREIGN KEY (`fk_almacen`) REFERENCES `almacen` (`id_almacen`);

ALTER TABLE `detalle_compra` ADD FOREIGN KEY (`fk_compra`) REFERENCES `compra` (`id_compra`);

ALTER TABLE `almacen` ADD FOREIGN KEY (`fk_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`);

ALTER TABLE `detalle_materia_prima_receta` ADD FOREIGN KEY (`fk_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`);

ALTER TABLE `detalle_materia_prima_receta` ADD FOREIGN KEY (`fk_receta`) REFERENCES `receta` (`id_receta`);

ALTER TABLE `detalle_almacen_stock` ADD FOREIGN KEY (`fk_stock`) REFERENCES `stock` (`id_stock`);

ALTER TABLE `detalle_almacen_stock` ADD FOREIGN KEY (`fk_almacen`) REFERENCES `almacen` (`id_almacen`);

ALTER TABLE `stock` ADD FOREIGN KEY (`fk_receta`) REFERENCES `receta` (`id_receta`);

ALTER TABLE `venta` ADD FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`);

ALTER TABLE `detalle_venta` ADD FOREIGN KEY (`fk_stock`) REFERENCES `stock` (`id_stock`);

ALTER TABLE `detalle_venta` ADD FOREIGN KEY (`fk_venta`) REFERENCES `venta` (`id_venta`);

ALTER TABLE `envio` ADD FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`id_empleado`);

ALTER TABLE `envio` ADD FOREIGN KEY (`fk_venta`) REFERENCES `venta` (`id_venta`);

INSERT INTO unidad_medida (descripcion) VALUES('Kilogramos'); -- 1
INSERT INTO unidad_medida (descripcion) VALUES('Gramos');     -- 2
INSERT INTO unidad_medida (descripcion) VALUES('Litros');     -- 3
INSERT INTO unidad_medida (descripcion) VALUES('Mililitros'); -- 4
INSERT INTO unidad_medida (descripcion) VALUES('Saco');       -- 5
INSERT INTO unidad_medida (descripcion) VALUES('Bolsa');      -- 6
INSERT INTO unidad_medida (descripcion) VALUES('Paquete');    -- 7
INSERT INTO unidad_medida (descripcion) VALUES('Cartón');     -- 8
INSERT INTO unidad_medida (descripcion) VALUES('Frasco');     -- 9
INSERT INTO unidad_medida (descripcion) VALUES('Unidad');     -- 10

INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 1
VALUES ('Azucar', 1);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 2
VALUES ('Leche', 3);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 3
VALUES ('Fresas', 1);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 4
VALUES ('Hielo', 6);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 5
VALUES ('Crema', 3);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 6
VALUES ('Vainilla', 9);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 7
VALUES ('Chocolate en polvo', 2);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 8
VALUES ('Galleta oreo', 7);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 9
VALUES ('Chocoalte delice', 10);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 10
VALUES ('Colorante amarillo', 6);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 11
VALUES ('Colorante rojo', 6);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 12
VALUES ('Colorante morado', 6);
INSERT INTO materia_prima ( nombre, fk_unidad_medida) -- 13
VALUES ('Colorante cafe', 6);

-- Helado de fresa = 5 Azucar (1) - 3 Leche (2) - 2 Fresa (3) - 1 Hielo (4) - 3 Crema (5)
INSERT INTO receta (nombre, cantidad) VALUES('Helado de fresa', 20); -- 1
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 1, 5, 1 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 1, 3, 2 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 1, 2, 3 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 1, 1, 4 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 1, 3, 5 );

-- Helado de oreo = 5 Azucar (1) - 3 Leche (2) - 20 Oreo (8) - 1 Hielo (4) - 3 Crema (5)
INSERT INTO receta (nombre, cantidad) VALUES('Helado de oreo', 20); -- 2
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 2, 5, 1 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 2, 3, 2 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 2, 20, 8 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 2, 1, 4 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 2, 3, 5 );

-- Helado de vainilla = 5 Azucar (1) - 6 Leche (2) - 1 Hielo (4) - 8 Vainilla (6) - 3 Colorante amarillo (10) - 3 Crema (5)
INSERT INTO receta (nombre, cantidad) VALUES('Helado de vainilla', 20); -- 3
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 3, 5, 1 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 3, 6, 2 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 3, 1, 4 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 3, 8, 6 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 3, 3, 10 );
INSERT INTO detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
	VALUES ( 3, 3, 5 );

INSERT INTO persona VALUES ();
INSERT INTO proveedor (fk_persona) VALUES (1);

INSERT INTO compra ( total, fk_proveedor ) VALUES (800, 1);
INSERT INTO compra ( total, fk_proveedor ) VALUES (1600, 1);
INSERT INTO compra ( total, fk_proveedor ) VALUES (1200, 1);


INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 1
VALUES (5, '2023-04-30', true, 1); -- 5 Azucar id1
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 2
VALUES (6, '2023-04-30', true, 2); -- 6 Leche id2
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 3
VALUES (1, '2023-04-30', true, 3); -- 1 Fresa id3
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 4
VALUES (5, '2023-05-30', true, 1); -- 5 Azucar id4
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 5
VALUES (2, '2023-05-30', true, 2); -- 2 Leche id5
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 6
VALUES (1, '2023-05-30', true, 3); -- 1 Fresa id6
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 7
VALUES (20, '2023-05-28', true, 2); -- 20 Leche (5)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 8
VALUES (20, '2023-05-25', true, 3); -- 20 Fresa (3)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 9
VALUES (100, '2024-05-25', true, 4); -- 100 Hielo (4)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 10
VALUES (50, '2023-08-20', true, 4); -- 50 Hielo (4)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 11
VALUES (30, '2023-05-05', true, 5); -- 30 Crema (5)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 12
VALUES (20, '2023-04-29', true, 5); -- 20 Crema (5)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 13
VALUES (30, '2023-09-05', true, 6); -- 30 Vainilla (6)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 14
VALUES (40, '2023-06-05', true, 6); -- 40 Vainilla (6)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 15
VALUES (40, '2022-06-05', false, 6); -- 40 Vainilla (6)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 16
VALUES (10, '2023-02-01', false, 7); -- 7 Chocolate en polvo (7)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 17
VALUES (50, '2023-10-15', true, 7); -- 50 Chocolate en polvo (7)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 18
VALUES (20, '2023-05-15', true, 8); -- 20 Galleta oreo (8)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 19
VALUES (20, '2023-03-15', false, 8); -- 20 Galleta oreo (8)
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima) -- 20
VALUES (30, '2023-04-30', true, 8); -- 30 Galleta oreo (8)

INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (100, 1, 1);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (100, 2, 1);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (100, 3, 1);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (100, 9, 1);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (100, 11, 1);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (100, 13, 1);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (100, 16, 1);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (100, 18, 1);

INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (200, 4, 2);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (200, 5, 2);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (200, 6, 2);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (200, 10, 2);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (200, 12, 2);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (200, 14, 2);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (200, 17, 2);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (200, 19, 2);

INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (300, 7, 3);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (300, 8, 3);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (300, 15, 3);
INSERT INTO detalle_compra ( precio, fk_almacen, fk_compra )
VALUES (300, 20, 3);


-- Helado de fresa = 5 Azucar (1) - 3 Leche (2) - 2 Fresa (3) - 1 Hielo (4) - 3 Crema (5)
INSERT INTO stock (caducidad, fk_receta) -- 1
VALUES ('2023-05-30', 1);
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (5, 1, 1);
UPDATE almacen SET estatus = false WHERE id_almacen = 1;
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (3, 2, 1);
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (1, 3, 1);
UPDATE almacen SET estatus = false WHERE id_almacen = 3;
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (1, 6, 1);
UPDATE almacen SET estatus = false WHERE id_almacen = 6;
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (1, 9, 1);
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (3, 11, 1);
-- Helado de vainilla (3) = 5 Azucar (1) - 6 Leche (2) - 1 Hielo (4) - 8 Vainilla (6) - 3 Colorante amarillo (10) - 3 Crema (5)
-- NO EXISTE COLORANTE AMARILLO POR LO TANTO NO SE PUEDE HACER

-- Helado de oreo (2) = 5 Azucar (1) - 3 Leche (2) - 20 Oreo (8) - 1 Hielo (4) - 3 Crema (5)
INSERT INTO stock (caducidad, fk_receta) -- 2
VALUES ('2023-05-30', 2);
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (5, 4, 2);
UPDATE almacen SET estatus = false WHERE id_almacen = 4;
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (3, 2, 2);
UPDATE almacen SET estatus = false WHERE id_almacen = 2;
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (20, 18, 2);
UPDATE almacen SET estatus = false WHERE id_almacen = 18;
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (1, 9, 2);
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (3, 11, 2);

INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Administrador');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Vendedor');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Repartidor');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Comprador');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Cliente');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Gerente');

/* SELECT * FROM almacen a
INNER JOIN materia_prima mp
ON mp.id_materia_prima = a.fk_materia_prima;*/

SET SQL_SAFE_UPDATES=0;