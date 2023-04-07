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
  `contrasenia` VARCHAR(255),
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
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
  `numero_interior` VARCHAR(255),
  `numero_exterior` VARCHAR(255),
  `calle` VARCHAR(255),
  `colonia` VARCHAR(255),
  `estatus` BOOLEAN,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `cliente` (
  `id_cliente` INT AUTO_INCREMENT PRIMARY KEY,
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
  `fk_persona` INT,
  `fk_usuario` INT
);

CREATE TABLE `compra` (
  `id_compra` INT AUTO_INCREMENT PRIMARY KEY,
  `total` FLOAT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_proveedor` INT,
  `fk_empleado` INT
);

CREATE TABLE `detalle_compra` (
  `id_detalle_compra` INT AUTO_INCREMENT PRIMARY KEY,
  `cantidad` FLOAT,
  `precio` FLOAT,
  `fk_materia_prima` INT,
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
  `cantidad` FLOAT,
  `fk_receta` INT,
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
  `estatus` BOOLEAN,
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

ALTER TABLE `detalle_compra` ADD FOREIGN KEY (`fk_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`);

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

INSERT INTO unidad_medida (descripcion) VALUES('Kilogramos');
INSERT INTO unidad_medida (descripcion) VALUES('Litros');
INSERT INTO materia_prima ( nombre, fk_unidad_medida)
VALUES ('Azucar', 1);
INSERT INTO materia_prima ( nombre, fk_unidad_medida)
VALUES ('Leche', 2);
INSERT INTO materia_prima ( nombre, fk_unidad_medida)
VALUES ('Fresas', 1);

INSERT INTO receta (nombre, cantidad) VALUES('Helado de fresa', 10);

INSERT INTO detalle_materia_prima_receta (cantidad, fk_receta, fk_materia_prima)
	VALUES (5, 1, 1);
INSERT INTO detalle_materia_prima_receta (cantidad, fk_receta, fk_materia_prima)
	VALUES (3, 1, 2);
INSERT INTO detalle_materia_prima_receta (cantidad, fk_receta, fk_materia_prima)
	VALUES (2, 1, 3);

INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima)
VALUES (5, '2023-04-30', true, 1); -- 5 Azucar id1
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima)
VALUES (6, '2023-04-30', true, 2); -- 6 Leche id2
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima)
VALUES (1, '2023-04-30', true, 3); -- 1 Fresa id3
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima)
VALUES (4, '2023-05-30', true, 1); -- 4 Azucar id4
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima)
VALUES (2, '2023-05-30', true, 2); -- 2 Leche id5
INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima)
VALUES (1, '2023-05-30', true, 3); -- 1 Fresa id6

INSERT INTO stock (caducidad, fk_receta)
VALUES ('2023-05-30', 1);

INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (5, 1, 1);
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (3, 2, 1);
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (1, 3, 1);
INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
VALUES (1, 6, 1);
-- Receta = 5Azucar - 3Leche - 2Fresa

INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Administrador');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Vendedor');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Repartidor');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Comprador');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Cliente');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Gerente');
INSERT INTO `gelatos`.`roles` (`nombre`) VALUES ('Productor');




/* SELECT * FROM almacen a
INNER JOIN materia_prima mp
ON mp.id_materia_prima = a.fk_materia_prima;*/

SET SQL_SAFE_UPDATES=0;