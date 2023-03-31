DROP DATABASE IF EXISTS gelatos;
CREATE DATABASE gelatos;
CREATE TABLE `unidad_medida` (
  `id_unidad_medida` INT,
  `descripcion` VARCHAR,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `materia_prima` (
  `id_materia_prima` INT,
  `nombre` VARCHAR,
  `cantidad` VARCHAR,
  `caducidad` VARCHAR,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_unidad_medida` INT
);

CREATE TABLE `roles` (
  `id_rol` INT,
  `nombre` VARCHAR,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `usuario` (
  `id_usuario` INT,
  `correo` VARCHAR,
  `contrasenia` VARCHAR,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `rol_usuario` (
  `id_rol_usuario` INT,
  `fk_usuario` INT,
  `fk_rol` INT
);

CREATE TABLE `persona` (
  `id_persona` INT,
  `nombre` VARCHAR,
  `telefono` VARCHAR,
  `correo` VARCHAR,
  `codigo_postal` INT,
  `numero` INT,
  `calle` VARCHAR,
  `colonia` VARCHAR,
  `estatus` BOOLEAN,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `cliente` (
  `id_cliente` INT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_persona` INT,
  `fk_usuario` INT
);

CREATE TABLE `proveedor` (
  `id_proveedor` INT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_persona` INT
);

CREATE TABLE `empleado` (
  `id_empleado` INT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_persona` INT,
  `fk_usuario` INT
);

CREATE TABLE `compra` (
  `id_compra` INT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_proveedor` INT
);

CREATE TABLE `detalle_compra` (
  `id_detalle_compra` INT,
  `cantidad` FLOAT,
  `precio` FLOAT,
  `fk_materia_prima` INT,
  `fk_compra` INT
);

CREATE TABLE `almacen` (
  `id_almacen` INT,
  `canidad` INT,
  `caducidad` DATETIME,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_materia_prima` INT
);

CREATE TABLE `receta` (
  `id_receta` INT,
  `nombre` VARCHAR,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME
);

CREATE TABLE `detalle_almacen_receta` (
  `id_detalle_almacen_receta` INT,
  `cantidad` FLOAT,
  `fk_receta` INT,
  `fk_almacen` INT
);

CREATE TABLE `stock` (
  `id_stock` INT,
  `cantidad` VARCHAR,
  `caducidad` VARCHAR,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_receta` INT
);

CREATE TABLE `venta` (
  `id_venta` INT,
  `fecha_creacion` DATETIME,
  `fecha_actualizacion` DATETIME,
  `fk_cliente` VARCHAR
);

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` INT,
  `cantidad` FLOAT,
  `precio` FLOAT,
  `fk_stock` INT,
  `fk_venta` INT
);

CREATE TABLE `envio` (
  `id_envio` INT,
  `fecha_entrega` DATETIME,
  `entregado` BOOLEAN,
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

ALTER TABLE `detalle_compra` ADD FOREIGN KEY (`fk_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`);

ALTER TABLE `detalle_compra` ADD FOREIGN KEY (`fk_compra`) REFERENCES `compra` (`id_compra`);

ALTER TABLE `almacen` ADD FOREIGN KEY (`fk_materia_prima`) REFERENCES `materia_prima` (`id_materia_prima`);

ALTER TABLE `detalle_almacen_receta` ADD FOREIGN KEY (`fk_almacen`) REFERENCES `almacen` (`id_almacen`);

ALTER TABLE `detalle_almacen_receta` ADD FOREIGN KEY (`fk_receta`) REFERENCES `receta` (`id_receta`);

ALTER TABLE `stock` ADD FOREIGN KEY (`fk_receta`) REFERENCES `receta` (`id_receta`);

ALTER TABLE `venta` ADD FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`);

ALTER TABLE `detalle_venta` ADD FOREIGN KEY (`fk_stock`) REFERENCES `stock` (`id_stock`);

ALTER TABLE `detalle_venta` ADD FOREIGN KEY (`fk_venta`) REFERENCES `venta` (`id_venta`);

ALTER TABLE `envio` ADD FOREIGN KEY (`fk_empleado`) REFERENCES `empleado` (`id_empleado`);

ALTER TABLE `envio` ADD FOREIGN KEY (`fk_venta`) REFERENCES `venta` (`id_venta`);