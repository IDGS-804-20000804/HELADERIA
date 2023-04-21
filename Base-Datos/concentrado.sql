DROP DATABASE IF EXISTS gelatos;
CREATE DATABASE gelatos;
USE gelatos;

CREATE TABLE unidad_medida (
	id_unidad_medida INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(255) NOT NULL,
	estatus BOOLEAN DEFAULT TRUE NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW()
);
CREATE TABLE materia_prima (
	id_materia_prima INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	estatus BOOLEAN DEFAULT TRUE NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW(),
	fk_unidad_medida INT NOT NULL
);
CREATE TABLE roles (
	id_rol INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	estatus BOOLEAN DEFAULT TRUE NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW()
);
CREATE TABLE usuario (
	id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	correo VARCHAR(255) NOT NULL,
	contrasenia VARCHAR(255) NOT NULL,
	estatus BOOLEAN DEFAULT TRUE NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW()
);
CREATE TABLE rol_usuario (
	id_rol_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_usuario INT NOT NULL,
	fk_rol INT NOT NULL
);
CREATE TABLE persona (
	id_persona INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	apaterno VARCHAR(255) NOT NULL,
	amaterno VARCHAR(255),
	telefono VARCHAR(255) NOT NULL,
	codigo_postal INT NOT NULL,
	numero_exterior VARCHAR(255) NOT NULL,
	numero_interior VARCHAR(255),
	calle VARCHAR(255) NOT NULL,
	colonia VARCHAR(255) NOT NULL,
	estatus BOOLEAN DEFAULT TRUE NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW()
);
CREATE TABLE cliente (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_persona INT NOT NULL,
	fk_usuario INT NOT NULL
);
CREATE TABLE proveedor (
	id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	correo VARCHAR(255) NOT NULL,
	fk_persona INT NOT NULL
);
CREATE TABLE empleado (
	id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_persona INT NOT NULL,
	fk_usuario INT NOT NULL
);
CREATE TABLE compra (
	id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	total FLOAT NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW(),
	fk_proveedor INT NOT NULL,
	fk_empleado INT NOT NULL
);
CREATE TABLE detalle_compra (
	id_detalle_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cantidad FLOAT NOT NULL,
	precio FLOAT NOT NULL,
	fk_almacen INT NOT NULL,
	fk_compra INT NOT NULL
);
CREATE TABLE almacen (
	id_almacen INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cantidad INT NOT NULL,
	caducidad DATETIME NOT NULL,
	estatus BOOLEAN DEFAULT TRUE NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW(),
	fk_materia_prima INT NOT NULL
);
CREATE TABLE receta (
	id_receta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	cantidad INT NOT NULL,
	precio FLOAT NOT NULL,
	ruta_imagen VARCHAR(255) NOT NULL,
	estatus BOOLEAN DEFAULT TRUE NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW()
);
CREATE TABLE detalle_materia_prima_receta (
	id_detalle_materia_prima_receta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_receta INT NOT NULL,
	cantidad FLOAT NOT NULL,
	fk_materia_prima INT NOT NULL
);
CREATE TABLE detalle_almacen_stock (
	id_detalle_almacen_stock INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cantidad FLOAT NOT NULL,
	fk_almacen INT NOT NULL,
	fk_stock INT NOT NULL
);
CREATE TABLE stock (
	id_stock INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	caducidad VARCHAR(255) NOT NULL,
	cantidad INT NOT NULL,
	precio FLOAT NOT NULL,
	estatus BOOLEAN DEFAULT TRUE NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW(),
	fk_receta INT NOT NULL
);
CREATE TABLE venta (
	id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	total FLOAT NOT NULL,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW(),
	fk_cliente INT NOT NULL
);
CREATE TABLE detalle_venta (
	id_detalle_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	cantidad FLOAT NOT NULL,
	precio FLOAT NOT NULL,
	fk_stock INT NOT NULL,
	fk_venta INT NOT NULL
);
CREATE TABLE envio (
	id_envio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	entregado BOOLEAN NOT NULL DEFAULT FALSE,
	fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
	fecha_actualizacion DATETIME NOT NULL DEFAULT NOW(),
	fk_venta INT NOT NULL,
	fk_empleado INT
);
ALTER TABLE materia_prima ADD FOREIGN KEY (fk_unidad_medida) REFERENCES unidad_medida (id_unidad_medida);
ALTER TABLE rol_usuario ADD FOREIGN KEY (fk_rol) REFERENCES roles (id_rol);
ALTER TABLE rol_usuario ADD FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE cliente ADD FOREIGN KEY (fk_persona) REFERENCES persona (id_persona);
ALTER TABLE cliente ADD FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE proveedor ADD FOREIGN KEY (fk_persona) REFERENCES persona (id_persona);
ALTER TABLE empleado ADD FOREIGN KEY (fk_persona) REFERENCES persona (id_persona);
ALTER TABLE empleado ADD FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE compra ADD FOREIGN KEY (fk_proveedor) REFERENCES proveedor (id_proveedor);
ALTER TABLE compra ADD FOREIGN KEY (fk_empleado) REFERENCES empleado (id_empleado);
ALTER TABLE detalle_compra ADD FOREIGN KEY (fk_almacen) REFERENCES almacen (id_almacen);
ALTER TABLE detalle_compra ADD FOREIGN KEY (fk_compra) REFERENCES compra (id_compra);
ALTER TABLE almacen ADD FOREIGN KEY (fk_materia_prima) REFERENCES materia_prima (id_materia_prima);
ALTER TABLE detalle_materia_prima_receta ADD FOREIGN KEY (fk_materia_prima) REFERENCES materia_prima (id_materia_prima);
ALTER TABLE detalle_materia_prima_receta ADD FOREIGN KEY (fk_receta) REFERENCES receta (id_receta);
ALTER TABLE detalle_almacen_stock ADD FOREIGN KEY (fk_stock) REFERENCES stock (id_stock);
ALTER TABLE detalle_almacen_stock ADD FOREIGN KEY (fk_almacen) REFERENCES almacen (id_almacen);
ALTER TABLE stock ADD FOREIGN KEY (fk_receta) REFERENCES receta (id_receta);
ALTER TABLE venta ADD FOREIGN KEY (fk_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE detalle_venta ADD FOREIGN KEY (fk_stock) REFERENCES stock (id_stock);
ALTER TABLE detalle_venta ADD FOREIGN KEY (fk_venta) REFERENCES venta (id_venta);
ALTER TABLE envio ADD FOREIGN KEY (fk_empleado) REFERENCES empleado (id_empleado);
ALTER TABLE envio ADD FOREIGN KEY (fk_venta) REFERENCES venta (id_venta);
SET SQL_SAFE_UPDATES = 0;

USE gelatos;

DROP VIEW IF EXISTS vista_cargada_compra;
CREATE VIEW vista_cargada_compra AS
SELECT id_compra, total, t1.*, t2.*, t3.*
	FROM compra c
    INNER JOIN (SELECT pro.id_proveedor,
		pro.correo AS correo_proveedor,
        per.id_persona AS id_persona_proveedor,
        per.nombre AS nombre_proveedor,
        per.apaterno AS apaterno_proveedor,
        per.amaterno AS amaterno_proveedor,
        per.telefono AS tel_proveedor,
        per.codigo_postal AS cp_proveedor,
        per.numero_exterior AS numext_proveedor,
        per.numero_interior AS numint_proveedor,
        per.calle AS calle_proveedor,
        per.colonia AS colonia_proveedor
	FROM proveedor pro
	INNER JOIN persona per
		ON per.id_persona = pro.fk_persona) t1
	ON c.fk_proveedor = t1.id_proveedor
    INNER JOIN (SELECT em.id_empleado,
        per.id_persona AS id_persona_empleado,
        per.nombre AS nombre_empleado,
        per.apaterno AS apaterno_empleado,
        per.amaterno AS amaterno_empleado,
        per.telefono AS tel_empleado,
        per.codigo_postal AS cp_empleado,
        per.numero_exterior AS numext_empleado,
        per.numero_interior AS numint_empleado,
        per.calle AS calle_empleado,
        per.colonia AS colonia_empleado,
        u.id_usuario,
        u.correo AS correo_empleado
	FROM empleado em
	INNER JOIN persona per
		ON per.id_persona = em.fk_persona
	INNER JOIN usuario u
		ON u.id_usuario = em.fk_usuario) t2
        ON c.fk_empleado = t2.id_empleado
	INNER JOIN (SELECT dc.cantidad, dc.precio, a.caducidad, mp.nombre, um.descripcion, fk_compra FROM detalle_compra dc
	INNER JOIN almacen a
		ON dc.fk_almacen = a.id_almacen
	INNER JOIN materia_prima mp
		ON mp.id_materia_prima = a.fk_materia_prima
	INNER JOIN unidad_medida um
		ON um.id_unidad_medida = mp.fk_unidad_medida) t3
        ON c.id_compra = t3.fk_compra;

DROP VIEW IF EXISTS vista_envio_cargada;
CREATE VIEW vista_envio_cargada AS
SELECT en.id_envio, en.entregado, t1.*, t2.*, DATE(en.fecha_actualizacion) FROM envio en
	INNER JOIN (SELECT v.id_venta,
				v.total,
				c.id_cliente,
				p.id_persona AS id_persona_cliente,
                p.nombre AS nombre_cliente,
                p.apaterno AS apaterno_cliente,
				p.amaterno AS amaterno_cliente,
                p.telefono AS telefono_cliente,
                p.codigo_postal AS codigo_postal_cliente,
				p.numero_exterior AS numero_exterior_cliente,
                p.numero_interior AS numero_interior_cliente,
                p.calle AS calle_cliente,
				p.colonia AS colonia_cliente
		FROM venta v
		INNER JOIN cliente c
			ON fk_cliente = id_cliente
		INNER JOIN persona p
			ON fk_persona = id_persona) t1
		ON t1.id_venta = en.fk_venta
	LEFT JOIN (SELECT id_empleado,
				id_persona AS id_persona_empleado,
                nombre AS id_nombre_empleado,
				apaterno AS apaterno_empleado,
                amaterno AS amaterno_empleado,
                telefono AS telefono_empleado,
                codigo_postal AS codigo_postal_empleado,
				numero_exterior AS numero_exterior_empleado,
                numero_interior AS numero_interior_empleado,
                calle AS calle_empleado,
                colonia AS colonia_empleado
		FROM empleado em
		INNER JOIN persona p
		ON em.fk_persona = p.id_persona) t2
		ON en.fk_empleado = t2.id_empleado
		ORDER BY entregado, id_envio;

DROP VIEW IF EXISTS vista_empleado;
CREATE VIEW vista_empleado AS
SELECT 
    e.id_empleado,
    e.fk_usuario,
    e.fk_persona,
    u.correo,
    p.estatus,
    p.nombre,
    p.apaterno,
    p.amaterno,
    p.telefono,
    p.codigo_postal,
    p.numero_exterior,
    p.numero_interior,
    p.calle,
    p.colonia
FROM 
    empleado e
INNER JOIN 
    usuario u ON e.fk_usuario = u.id_usuario
INNER JOIN 
    persona p ON e.fk_persona = p.id_persona
WHERE  p.estatus = 1;

CREATE VIEW vista_cliente AS
SELECT 
    c.id_cliente,
    c.fk_persona,
	c.fk_usuario,
    u.correo,
    u.estatus,
    p.nombre,
    p.apaterno,
    p.amaterno,
    p.telefono,
    p.codigo_postal,
    p.numero_exterior,
    p.numero_interior,
    p.calle,
    p.colonia
FROM 
    cliente c
JOIN 
    usuario u ON c.fk_usuario = u.id_usuario
JOIN 
    persona p ON c.fk_persona = p.id_persona;

DROP VIEW IF EXISTS vista_cliente;
CREATE VIEW vista_cliente AS
SELECT 
    c.id_cliente,
    c.fk_usuario,
    c.fk_persona,
    u.correo,
    p.estatus,
    p.nombre,
    p.apaterno,
    p.amaterno,
    p.telefono,
    p.codigo_postal,
    p.numero_exterior,
    p.numero_interior,
    p.calle,
    p.colonia
FROM 
    cliente c
INNER JOIN 
    usuario u ON c.fk_usuario = u.id_usuario
INNER JOIN 
    persona p ON c.fk_persona = p.id_persona
WHERE  p.estatus = 1;
    
DROP VIEW IF EXISTS vista_proveedor;
CREATE VIEW vista_proveedor AS
SELECT 
    pr.id_proveedor,
    pr.fk_persona,
    pr.correo,
    p.nombre,
    p.apaterno,
    p.amaterno,
    p.telefono,
    p.codigo_postal,
    p.numero_exterior,
    p.numero_interior,
    p.calle,
    p.colonia
FROM 
    proveedor pr
INNER JOIN 
    persona p ON pr.fk_persona = p.id_persona
WHERE  p.estatus = 1;

DROP VIEW IF EXISTS vista_receta;
CREATE VIEW vista_receta AS
SELECT 
	mp.id_materia_prima,
    mp.nombre AS nombre_materia_prima,
    um.descripcion AS descripcion_unidad_medida,
    dmpr.cantidad AS cantidad_materia_prima,
    r.id_receta,
    r.nombre AS nombre_receta,
    r.cantidad AS cantidad_receta,
    r.precio AS precio_receta,
    r.ruta_imagen AS ruta_imagen_receta,
    r.estatus AS estatus_receta
  FROM receta r
  INNER JOIN detalle_materia_prima_receta dmpr
	ON dmpr.fk_receta = r.id_receta
  INNER JOIN materia_prima mp
	ON dmpr.fk_materia_prima = mp.id_materia_prima
  INNER JOIN unidad_medida um
	ON mp.fk_unidad_medida = um.id_unidad_medida
WHERE r.estatus = true;

DROP VIEW IF EXISTS vista_envio;
CREATE VIEW vista_envio AS
SELECT 
	en.id_envio,
    en.entregado,
    v.total,
    p1.nombre AS nombre_cliente,
    p1.apaterno AS apaterno_cliente,
    p1.amaterno AS amaterno_cliente,
    p1.calle,
    p1.colonia,
    p1.numero_exterior,
    IFNULL(p1.numero_interior, ''),
    p1.codigo_postal,
    p1.telefono,
    p2.nombre AS nombre_empleado,
    p2.apaterno AS apaterno_empleado,
    p2.amaterno AS amaterno_empleado,
    p2.telefono AS telefono_repartidor
	FROM envio en
    INNER JOIN venta v ON en.fk_venta = v.id_venta
    INNER JOIN cliente c ON v.fk_cliente = c.id_cliente
    INNER JOIN persona p1 ON c.fk_persona = p1.id_persona
    INNER JOIN empleado e ON en.fk_empleado = e.id_empleado
    INNER JOIN persona p2 ON e.fk_persona = p2.id_persona
    WHERE en.entregado=FALSE;

DROP VIEW IF EXISTS vista_envio_entregado;
CREATE VIEW vista_envio_entregado AS
SELECT 
	en.id_envio,
    en.entregado,
    v.total,
    p1.nombre AS nombre_cliente,
    p1.apaterno AS apaterno_cliente,
    p1.amaterno AS amaterno_cliente,
    p1.calle,
    p1.colonia,
    p1.numero_exterior,
    IFNULL(p1.numero_interior, ''),
    p1.codigo_postal,
    p1.telefono,
    p2.nombre AS nombre_empleado,
    p2.apaterno AS apaterno_empleado,
    p2.amaterno AS amaterno_empleado,
    p2.telefono AS telefono_repartidor
	FROM envio en
    INNER JOIN venta v ON en.fk_venta = v.id_venta
    INNER JOIN cliente c ON v.fk_cliente = c.id_cliente
    INNER JOIN persona p1 ON c.fk_persona = p1.id_persona
    INNER JOIN empleado e ON en.fk_empleado = e.id_empleado
    INNER JOIN persona p2 ON e.fk_persona = p2.id_persona
    WHERE en.entregado=TRUE;


DROP VIEW IF EXISTS vista_materia_prima;
CREATE VIEW vista_materia_prima AS
SELECT 
	mp.id_materia_prima,
    mp.nombre,
    mp.estatus,
    um.descripcion AS unidad_medida
  FROM materia_prima mp
  INNER JOIN unidad_medida um ON mp.fk_unidad_medida = um.id_unidad_medida
  WHERE mp.estatus = 1;

-- ALMACEN
DROP VIEW IF EXISTS vista_almacen;
CREATE VIEW vista_almacen AS
SELECT id_materia_prima, nombre, cantidad_usable, descripcion AS unidad_medida, caducidad FROM materia_prima
				INNER JOIN (SELECT 
					fk_materia_prima,
					CASE WHEN cantidad_total IS NULL THEN cantidad ELSE cantidad_total END AS cantidad_usable,
					caducidad
				FROM (
					SELECT a.id_almacen, a.fk_materia_prima, a.cantidad, (a.cantidad - SUM(das.cantidad)) AS cantidad_total, a.caducidad
					FROM almacen a
					LEFT JOIN detalle_almacen_stock das
					ON id_almacen = fk_almacen
					WHERE estatus = TRUE
					AND DATE(caducidad) > DATE(NOW())
					GROUP BY a.id_almacen, a.caducidad, a.estatus, a.fk_materia_prima
					HAVING cantidad_total IS NULL OR cantidad_total > 0
					ORDER BY a.caducidad
				) AS t) AS t2
                ON fk_materia_prima = id_materia_prima
                INNER JOIN unidad_medida
                ON fk_unidad_medida = id_unidad_medida;


DROP VIEW IF EXISTS stock_en_venta;
CREATE VIEW stock_en_venta AS
SELECT id_receta, nombre, ruta_imagen, stock_usable, t1.precio FROM receta r INNER JOIN
	(SELECT SUM((cantidad - IFNULL(stock_usado, 0))) AS stock_usable, precio, fk_receta
	FROM (SELECT id_stock, caducidad, cantidad, precio, estatus, fk_receta FROM stock) AS s
	LEFT JOIN (SELECT SUM(cantidad) AS stock_usado, fk_stock FROM detalle_venta GROUP BY fk_stock) AS dv
		ON fk_stock = id_stock
	WHERE s.estatus = TRUE
	AND DATE(s.caducidad) > DATE(NOW())
	AND (cantidad - IFNULL(stock_usado, 0)) > 0
    GROUP BY precio, fk_receta) AS t1
    ON r.id_receta = t1.fk_receta;


DROP PROCEDURE IF EXISTS insertar_venta;

DELIMITER //
CREATE PROCEDURE insertar_venta(
	IN iarr_recetas TEXT,
    IN ifk_cliente INT
)
BEGIN
    DECLARE did_venta INT;
    DECLARE dobjeto_receta JSON;
	DECLARE did_receta INT;
	DECLARE dcantidad_receta INT;
	DECLARE dprecio_receta FLOAT;
	DECLARE dposicion_recetas INT;
    DECLARE dtotal FLOAT;

	DECLARE dlistado_existencias JSON;
	DECLARE did_stock INT;
	DECLARE dprecio_existencia FLOAT;
	DECLARE dstock_existencia INT;
    DECLARE dposicion_existencias INT;
    DECLARE dcomprobacion_existencia INT;
    
    DECLARE realizar_commit BOOLEAN;
    START TRANSACTION;
	
    SET realizar_commit = TRUE;
    SET dtotal = 0;
	INSERT INTO venta (total, fk_cliente) VALUES (dtotal, ifk_cliente);
	SET did_venta = LAST_INSERT_ID();
	SET dposicion_recetas = JSON_LENGTH(iarr_recetas);
	ciclo_for: LOOP
	    IF dposicion_recetas = 0 THEN
	        LEAVE ciclo_for;
	    END IF;
	    SET dobjeto_receta = JSON_EXTRACT(iarr_recetas, CONCAT('$[',dposicion_recetas - 1,']'));
	    SET did_receta = JSON_EXTRACT(dobjeto_receta, CONCAT('$[0]'));
	    SET dcantidad_receta = JSON_EXTRACT(dobjeto_receta, CONCAT('$[1]'));
	    SET dprecio_receta = JSON_EXTRACT(dobjeto_receta, CONCAT('$[2]'));

        SET dcomprobacion_existencia = (SELECT COUNT(*) FROM (SELECT SUM((cantidad - IFNULL(stock_usado, 0))) AS stock_usable, precio, fk_receta
            FROM (SELECT id_stock, caducidad, cantidad, precio, estatus, fk_receta FROM stock) AS s
            LEFT JOIN (SELECT SUM(cantidad) AS stock_usado, fk_stock FROM detalle_venta GROUP BY fk_stock) AS dv
                ON fk_stock = id_stock
            WHERE s.estatus = TRUE
            AND DATE(s.caducidad) > DATE(NOW())
            AND (cantidad - IFNULL(stock_usado, 0)) > 0
            GROUP BY precio, fk_receta) AS t1
            WHERE stock_usable >= dcantidad_receta
            AND ROUND(precio,2) = ROUND(dprecio_receta,2)
            AND fk_receta = did_receta);
        IF  dcomprobacion_existencia = 0 THEN
			SET realizar_commit = FALSE;
			LEAVE ciclo_for;
		END IF;
	    SELECT JSON_ARRAYAGG(JSON_OBJECT(
	            'id_stock', id_stock,
	            'precio', ROUND(precio,2),
	            'stock_usable', stock_usable
	        ))
	        INTO dlistado_existencias
	    FROM (
	        SELECT id_stock, precio, (cantidad - IFNULL(stock_usado, 0)) AS stock_usable
	            FROM (SELECT id_stock, caducidad, cantidad, precio, estatus, fk_receta FROM stock) AS s
	            LEFT JOIN (SELECT SUM(cantidad) AS stock_usado, fk_stock FROM detalle_venta GROUP BY fk_stock) AS dv
	                ON fk_stock = id_stock
	            WHERE s.estatus = TRUE
	            AND DATE(s.caducidad) > DATE(NOW())
	            AND (cantidad - IFNULL(stock_usado, 0)) > 0
	            AND fk_receta = did_receta
				AND ROUND(precio,2) = ROUND(dprecio_receta,2)
	        ) AS t;
	    SET dposicion_existencias = 0;
	    SET did_stock = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].id_stock'));
	    SET dprecio_existencia = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].precio'));
	    SET dstock_existencia = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].stock_usable'));
        IF ISNULL(dstock_existencia) THEN
        	SET realizar_commit = FALSE;
			LEAVE ciclo_for;
        END IF;
        IF (dstock_existencia <= dcantidad_receta) THEN
			INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
				VALUES (dstock_existencia, dprecio_existencia, did_stock, did_venta);
			UPDATE stock SET estatus = FALSE WHERE id_stock = dstock_existencia;
			IF NOT(dstock_existencia = dcantidad_receta) THEN
				subciclo_tabla_intermedia: LOOP
					SET dcantidad_receta = dcantidad_receta - dstock_existencia;
					SET dposicion_existencias = dposicion_existencias + 1;
					SET did_stock = JSON_EXTRACT(dlistado_existencias, CONCAT('$[', dposicion_existencias,'].id_stock'));
					SET dstock_existencia = JSON_EXTRACT(dlistado_existencias, CONCAT('$[', dposicion_existencias,'].stock_usable'));
					IF ISNULL(dstock_existencia) THEN
						SET realizar_commit = FALSE;
						LEAVE ciclo_for;
					END IF;
					IF (dstock_existencia <= dcantidad_receta) THEN
						INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
							VALUES (dstock_existencia, dprecio_existencia, did_stock, did_venta);
						UPDATE stock SET estatus = FALSE WHERE id_stock = did_stock;
						IF NOT(dstock_existencia = dcantidad_receta) THEN
							ITERATE subciclo_tabla_intermedia;
						ELSE
							LEAVE subciclo_tabla_intermedia;
                        END IF;
					ELSE 
						INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
							VALUES (dcantidad_receta, dprecio_existencia, dstock_existencia, did_venta);
						LEAVE subciclo_tabla_intermedia;
					END IF;
				END LOOP;
			END IF;
		ELSE 
			INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
				VALUES (dcantidad_receta, dprecio_existencia, did_stock, did_venta);
		END IF;
	    SET dposicion_recetas = dposicion_recetas - 1;
	    ITERATE ciclo_for;
	END LOOP;
	SET dtotal = (SELECT SUM(precio) FROM detalle_venta WHERE fk_venta = did_venta);
	IF ISNULL(dtotal) THEN
		SET realizar_commit = FALSE;
	ELSE 
		UPDATE venta SET
			total = dtotal
		WHERE id_venta = did_venta;
	END IF;

	INSERT INTO envio ( fk_venta ) 
		VALUES ( did_venta );

	IF realizar_commit = TRUE THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_unidad_medida;

DELIMITER //
CREATE PROCEDURE consultar_unidad_medida()
BEGIN
	SELECT id_unidad_medida, descripcion, estatus
	FROM unidad_medida;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_unidad_medida_por_id;

DELIMITER //
CREATE PROCEDURE consultar_unidad_medida_por_id( IN iid_unidad_medida INT )
BEGIN
	SELECT id_unidad_medida, descripcion, estatus
	FROM unidad_medida
    WHERE id_unidad_medida = iid_unidad_medida;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS insertar_unidad_medida;

DELIMITER //
CREATE PROCEDURE insertar_unidad_medida(
    IN idescripcion VARCHAR(255)
)
BEGIN
	INSERT INTO unidad_medida ( descripcion )
		VALUES (idescripcion);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS actualizar_unidad_medida;

DELIMITER //
CREATE PROCEDURE actualizar_unidad_medida(
    IN iid_unidad_medida INT,
    IN idescripcion VARCHAR(255),
    IN iestatus BOOLEAN
)
BEGIN
	IF iestatus = NULL THEN
		SET iestatus = FALSE;
	END IF;
	UPDATE unidad_medida SET
		descripcion = idescripcion,
		estatus = iestatus,
        fecha_actualizacion = NOW()
	WHERE id_unidad_medida = iid_unidad_medida;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS eliminar_unidad_medida;

DELIMITER //
CREATE PROCEDURE eliminar_unidad_medida(
    IN iid_unidad_medida INT
)
BEGIN
	UPDATE unidad_medida SET
		estatus = FALSE,
        fecha_actualizacion = NOW()
	WHERE id_unidad_medida = iid_unidad_medida;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE obtener_info_usuario( IN iid_usuario INT )
BEGIN
	SELECT id_usuario,
		correo,
		contrasenia,
		estatus,
		(SELECT JSON_ARRAYAGG(fk_rol)
			FROM rol_usuario
			WHERE fk_usuario = iid_usuario)
		AS roles
	FROM usuario
	WHERE id_usuario = iid_usuario;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_stock;

DELIMITER //
CREATE PROCEDURE consultar_stock()
BEGIN
	SELECT id_stock, caducidad, receta.cantidad AS cantidad_receta, stock.precio AS stock_precio, stock.estatus AS stock_estatus, nombre, cantidad, receta.precio AS receta_precio, ruta_imagen, receta.estatus AS receta_estatus
	FROM stock
	INNER JOIN
	receta ON id_receta = fk_receta;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_stock_por_id;

DELIMITER //
CREATE PROCEDURE consultar_stock_por_id( IN iid_stock INT )
BEGIN
	SELECT id_stock, caducidad, receta.cantidad AS cantidad_receta, stock.precio AS stock_precio, stock.estatus AS stock_estatus, nombre, cantidad, receta.precio AS receta_precio, ruta_imagen, receta.estatus AS receta_estatus
	FROM stock
	INNER JOIN
	receta ON id_receta = fk_receta
    WHERE id_stock = iid_stock;
END //
DELIMITER ;

USE gelatos;

DROP PROCEDURE IF EXISTS insertar_stock;

DELIMITER //
CREATE PROCEDURE insertar_stock(
	IN icaducidad DATETIME,
    IN iprecio FLOAT,
    IN ifk_receta INT
)
BEGIN
	DECLARE did_almacen INT;
    DECLARE dcantidad_usable FLOAT;
    DECLARE dlistado_existencias JSON;
    DECLARE dposicion_existencias INT;
	DECLARE dcantidad FLOAT;
    DECLARE dfk_materia_prima INT;
    DECLARE dposicion_receta INT;
    DECLARE dreceta JSON;
	DECLARE dids_validos JSON;
    DECLARE did_stock INT;
    DECLARE dcanitdad_en_stock INT;
    DECLARE realizar_commit BOOLEAN;

	SET dlistado_existencias = JSON_ARRAY();
	SET dreceta = JSON_ARRAY();

    START TRANSACTION;
    SET realizar_commit = TRUE;
    CALL consultar_recetas_posibles(dids_validos);
    IF JSON_CONTAINS(dids_validos, CAST(ifk_receta AS JSON)) THEN
    
		SET did_stock = (
		SELECT id_stock FROM stock
		WHERE DATE(caducidad) = DATE(icaducidad)
		AND fk_receta = ifk_receta
		AND precio BETWEEN iprecio - 0.01 AND iprecio + 0.01
		);
		IF did_stock > 0 THEN 
		SET dcanitdad_en_stock = (
				SELECT cantidad FROM stock
				WHERE id_stock = did_stock
			);
		UPDATE stock SET
			estatus = TRUE,
			cantidad = 1 + dcanitdad_en_stock
		WHERE id_stock = did_stock;
		ELSE 
		INSERT INTO stock (caducidad, precio, cantidad, fk_receta)
			VALUES (icaducidad, iprecio, 1, ifk_receta);
		SET did_stock = LAST_INSERT_ID();
		END IF;
		SELECT JSON_ARRAYAGG(JSON_OBJECT(
			   'fk_materia_prima', fk_materia_prima,
			   'cantidad', cantidad
			))
			INTO dreceta
		FROM detalle_materia_prima_receta
		WHERE fk_receta = ifk_receta;
        SET dposicion_receta = JSON_LENGTH(dreceta);
        ciclo_for: LOOP
			IF dposicion_receta = 0 THEN
				LEAVE ciclo_for;
			END IF;
            SET dfk_materia_prima = JSON_EXTRACT(dreceta, CONCAT('$[', dposicion_receta - 1,'].fk_materia_prima'));
			SELECT JSON_ARRAYAGG(JSON_OBJECT(
				   'id_almacen', id_almacen,
				   'fk_materia_prima', fk_materia_prima,
				   'cantidad_usable', cantidad_usable
				))
                INTO dlistado_existencias
			FROM (
				SELECT id_almacen, fk_materia_prima,
					   CASE WHEN cantidad_total IS NULL THEN cantidad ELSE cantidad_total END AS cantidad_usable
				FROM (
					SELECT a.id_almacen, a.fk_materia_prima, a.cantidad, (a.cantidad - SUM(das.cantidad)) AS cantidad_total, a.caducidad
					FROM almacen a
					LEFT JOIN detalle_almacen_stock das
					ON id_almacen = fk_almacen
					WHERE estatus = TRUE
					AND DATE(caducidad) > DATE(NOW())
                    AND a.fk_materia_prima = dfk_materia_prima
					GROUP BY a.id_almacen, a.caducidad, a.estatus, a.fk_materia_prima
					HAVING cantidad_total IS NULL OR cantidad_total > 0
					ORDER BY a.caducidad
				) AS t
			) AS t2;
			SET dposicion_existencias = 0;
			SET did_almacen = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].id_almacen'));
			SET dcantidad = JSON_EXTRACT(dreceta, CONCAT('$[', dposicion_receta - 1,'].cantidad'));
			SET dcantidad_usable = JSON_EXTRACT(dlistado_existencias, CONCAT('$[',dposicion_existencias,'].cantidad_usable'));
            IF (dcantidad_usable <= dcantidad) THEN
				INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
					VALUES (dcantidad_usable, did_almacen, did_stock);
				UPDATE almacen SET estatus = FALSE WHERE id_almacen = did_almacen;
				subciclo_tabla_intermedia: LOOP
					SET dcantidad = dcantidad - dcantidad_usable;
					SET dposicion_existencias = dposicion_existencias + 1;
					SET did_almacen = JSON_EXTRACT(dlistado_existencias, CONCAT('$[', dposicion_existencias,'].id_almacen'));
					SET dcantidad_usable = JSON_EXTRACT(dlistado_existencias, CONCAT('$[', dposicion_existencias,'].cantidad_usable'));
					IF (dcantidad_usable <= dcantidad) THEN
						INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
							VALUES (dcantidad_usable, did_almacen, did_stock);
						UPDATE almacen SET estatus = FALSE WHERE id_almacen = did_almacen;
						ITERATE subciclo_tabla_intermedia;
					ELSE 
						INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
							VALUES (dcantidad, did_almacen, did_stock);
						LEAVE subciclo_tabla_intermedia;
					END IF;
				END LOOP;
			ELSE 
				INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
					VALUES (dcantidad, did_almacen, did_stock);
			END IF;

			SET dposicion_receta = dposicion_receta - 1;
            ITERATE ciclo_for;
		END LOOP;
	ELSE
		SET realizar_commit = FALSE;
	END IF;
	IF realizar_commit = TRUE THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //
DELIMITER ;



DROP PROCEDURE IF EXISTS insertar_receta;
DELIMITER //
CREATE PROCEDURE insertar_receta(
	IN	inombre VARCHAR(255),
	IN  icantidad INT,
	IN  iprecio FLOAT,
	IN	iruta_imagen VARCHAR(255),
	IN	iarr_receta TEXT
)
BEGIN
	DECLARE did_receta INT;
	DECLARE dfk_materia_prima INT;
	DECLARE dcantidad FLOAT;
	DECLARE dposicion_ingrediente INT;
	DECLARE dobjeto_ingrediente JSON;
	
     INSERT INTO receta ( nombre, cantidad, precio, ruta_imagen)
 		VALUES ( inombre, icantidad, iprecio, iruta_imagen);
     SET did_receta = LAST_INSERT_ID();
	SET dposicion_ingrediente = json_length(iarr_receta);
	ciclo_for: LOOP
		IF dposicion_ingrediente = 0 THEN
			LEAVE ciclo_for;
		END IF;
		SET dobjeto_ingrediente = JSON_EXTRACT(iarr_receta, CONCAT('$[',dposicion_ingrediente - 1,']'));
		SET dfk_materia_prima = JSON_EXTRACT(dobjeto_ingrediente, CONCAT('$[0]'));
		SET dcantidad = JSON_EXTRACT(dobjeto_ingrediente, CONCAT('$[1]'));
 		INSERT detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
 			VALUES (did_receta, dcantidad, dfk_materia_prima);

		SET dposicion_ingrediente = dposicion_ingrediente - 1;
		ITERATE ciclo_for;
	END LOOP;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS actualizar_receta;
DELIMITER //
CREATE PROCEDURE actualizar_receta(
	IN	iid_receta INT,
	IN	inombre VARCHAR(255),
	IN  icantidad INT,
	IN  iprecio FLOAT,
	IN	iruta_imagen VARCHAR(255),
	IN	iarr_receta TEXT
)
BEGIN
	DECLARE dfk_materia_prima INT;
	DECLARE dcantidad FLOAT;
	DECLARE dposicion_ingrediente INT;
	DECLARE dobjeto_ingrediente JSON;
	UPDATE receta SET
		nombre = inombre,
        cantidad = icantidad,
        precio = iprecio,
        ruta_imagen = iruta_imagen,
		fecha_actualizacion = NOW()
	WHERE id_receta = iid_receta;
    DELETE FROM detalle_materia_prima_receta WHERE fk_receta = iid_receta;
	SET dposicion_ingrediente = json_length(iarr_receta);
	ciclo_for: LOOP
		IF dposicion_ingrediente = 0 THEN
			LEAVE ciclo_for;
		END IF;
		SET dobjeto_ingrediente = JSON_EXTRACT(iarr_receta, CONCAT('$[',dposicion_ingrediente - 1,']'));
		SET dfk_materia_prima = JSON_EXTRACT(dobjeto_ingrediente, CONCAT('$[0]'));
		SET dcantidad = JSON_EXTRACT(dobjeto_ingrediente, CONCAT('$[1]'));
 		INSERT detalle_materia_prima_receta (fk_receta, cantidad, fk_materia_prima)
 			VALUES (iid_receta, dcantidad, dfk_materia_prima);

		SET dposicion_ingrediente = dposicion_ingrediente - 1;
		ITERATE ciclo_for;
	END LOOP;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS eliminar_receta;
DELIMITER $$
CREATE PROCEDURE eliminar_receta(	/* Datos Receta */
									IN iid_receta INT   -- 1
				)
	BEGIN
		UPDATE receta SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_receta = iid_receta;
    END
$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insertar_proveedor;
DELIMITER //
CREATE PROCEDURE insertar_proveedor(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Proveedor */
                                    IN	icorreo   		VARCHAR(100),    -- 10

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,            -- 11
                                    OUT	iid_proveedor      INT           -- 12
				)                                    
    BEGIN        
    
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
							  numero_exterior, calle, colonia) 
					 VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
							  inumero_exterior,  icalle, icolonia);
        -- Obtenemos el ID de Persona que se generó:
        SET iid_persona = LAST_INSERT_ID();

        -- Insertamos en la tabla Proveedores:
        INSERT INTO proveedor (correo, fk_persona) VALUES(icorreo, iid_persona);
        -- Obtenemos el ID del Proveedores que se generó:
        SET iid_proveedor = LAST_INSERT_ID();
    END
//
DELIMITER ;

DROP PROCEDURE IF EXISTS actualizar_proveedor;
DELIMITER //
CREATE PROCEDURE actualizar_proveedor(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6), 	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Proveedor */
                                    IN	icorreo   		VARCHAR(100),     -- 10
                                    
                                    /* ID's de las tablas relacionadas con el Proveedor */
                                    IN	iid_persona       INT,            -- 11
                                    IN  iid_proveedor 	  INT			  -- 12
				)                                    
    BEGIN        
    
	 -- Datos Persona del Proveedor:
        UPDATE persona  SET     nombre = inombre,
								apaterno = iapaterno,
                                amaterno = iamaterno,
                                telefono = itelefono,
                                codigo_postal = icodigo_postal,
                                numero_interior = inumero_interior,
                                numero_exterior = inumero_exterior,
                                calle = icalle, 
                                colonia = icolonia,
                                fecha_actualizacion = NOW()
                        WHERE   id_persona = iid_persona;

        -- Actualizamos los datos de Proveedor:
        UPDATE proveedor  SET    correo = icorreo
                        WHERE   id_proveedor = iid_proveedor;
        
    END
//
DELIMITER ;


-- Stored Procedure para eliminar Proveedor.
DROP PROCEDURE IF EXISTS eliminar_proveedor;
DELIMITER //
CREATE PROCEDURE eliminar_proveedor(	/* Datos Persona */
									IN iid_persona INT   -- 1
				)
	BEGIN
		UPDATE persona SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_persona = iid_persona;
    END
//
DELIMITER ;



DROP PROCEDURE IF EXISTS consultar_materia_prima;

DELIMITER //
CREATE PROCEDURE consultar_materia_prima()
BEGIN
	SELECT id_materia_prima, nombre, materia_prima.estatus AS materia_prima_estatus, unidad_medida.descripcion, unidad_medida.estatus AS unidad_medida_estatus
	FROM materia_prima
	INNER JOIN unidad_medida
	ON fk_unidad_medida = id_unidad_medida;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_materia_prima_por_id;

DELIMITER //
CREATE PROCEDURE consultar_materia_prima_por_id( IN iid_materia_prima INT )
BEGIN
	SELECT id_materia_prima, nombre, materia_prima.estatus AS materia_prima_estatus, unidad_medida.descripcion, unidad_medida.estatus AS unidad_medida_estatus
	FROM materia_prima
	INNER JOIN unidad_medida
	ON fk_unidad_medida = id_unidad_medida
    WHERE id_materia_prima = iid_materia_prima;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS insertar_materia_prima;

DELIMITER //
CREATE PROCEDURE insertar_materia_prima(
    IN inombre VARCHAR(255),
    IN ifk_unidad_medida INT
)
BEGIN
	INSERT INTO materia_prima ( nombre, fk_unidad_medida)
		VALUES (inombre, ifk_unidad_medida);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS actualizar_materia_prima;

DELIMITER //
CREATE PROCEDURE actualizar_materia_prima(
    IN iid_materia_prima INT,
    IN inombre VARCHAR(255),
    IN iestatus BOOLEAN,
    IN ifk_unidad_medida INT
)
BEGIN
	IF iestatus = NULL THEN
		SET iestatus = FALSE;
	END IF;
	UPDATE materia_prima SET
		nombre = inombre,
		estatus = iestatus,
		fk_unidad_medida = ifk_unidad_medida,
        fecha_actualizacion = NOW()
	WHERE id_materia_prima = iid_materia_prima;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS eliminar_materia_prima;

DELIMITER //
CREATE PROCEDURE eliminar_materia_prima(
    IN iid_materia_prima INT
)
BEGIN
	UPDATE materia_prima SET
		estatus = FALSE,
        fecha_actualizacion = NOW()
	WHERE id_materia_prima = iid_materia_prima;
END //
DELIMITER ;



DROP PROCEDURE IF EXISTS insertar_envio;
DELIMITER //
CREATE PROCEDURE insertar_envio(	/* Datos Envio*/
                                    IN	ifk_venta     INT,			-- 1
                                    IN	ifk_empleado  INT,			-- 2

                                    /* Valor de Retorno */
                                    OUT	iid_envio     INT			-- 3
                                    
                                    
				)                                    
    BEGIN        
    
        -- Insertando los datos del Envio:
        INSERT INTO envio ( fk_venta, fk_empleado) 
					 VALUES ( ifk_venta, ifk_empleado);
        -- Obtenemos el ID del Envio que se generó:
        SET iid_envio = LAST_INSERT_ID();

    END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS actualizar_envio;
DELIMITER //
CREATE PROCEDURE actualizar_envio(	/* Datos Envio */
                                    IN	ifecha_entrega	DATETIME,	-- 1
                                    IN	ifk_venta     INT,			-- 2
                                    IN	ifk_empleado  INT,			-- 3
                                    
                                    /* ID de la tabla Envio*/
                                    IN	iid_envio     INT			-- 4
				)                                    
    BEGIN        
    
	 -- Datos Envio:
        UPDATE envio  SET 	fecha_entrega = ifecha_entrega,
							fk_venta = ifk_venta,
							fk_empleado = ifk_empleado,
                            fecha_actualizacion = NOW()
                        WHERE   id_envio = iid_envio;
    END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS entregar_envio;
DELIMITER //
CREATE PROCEDURE entregar_envio(	/* Datos Envio */
									IN iid_envio INT,    -- 1
									IN ifk_empleado INT -- 2
				)
	BEGIN
		UPDATE envio SET  entregado = true,
						fecha_actualizacion = NOW(),
                        entregado = TRUE,
						fk_empleado = ifk_empleado
        WHERE id_envio = iid_envio;
    END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS insertar_empleado;
DELIMITER //
CREATE PROCEDURE insertar_empleado(	/* Datos Personales */
                                    IN	inombre          VARCHAR(255),     -- 1
                                    IN  iapaterno		 VARCHAR(255),	  -- 2
                                    IN  iamaterno		 VARCHAR(255),	  -- 3
                                    IN	itelefono 		 VARCHAR(255),     -- 4
                                    IN  icodigo_postal   INT,      -- 5
                                    IN	inumero_interior VARCHAR(255),   	  -- 6
                                    IN	inumero_exterior VARCHAR(255),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(255),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(255),    -- 10
                                    IN	icontrasenia    VARCHAR(255),    -- 11
                                    
                                    /* Datos rol_usuario*/
                                    IN iid_roles 		VARCHAR(255),	 -- 12

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,           -- 13
                                    OUT	iid_usuario   	 INT,           -- 14
                                    OUT	iid_empleado     INT            -- 15
				)                                    
    BEGIN        
	DECLARE posicion INT;
	DECLARE id_rol INT;
        
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
							  numero_exterior, calle, colonia) 
					 VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
							  inumero_exterior,  icalle, icolonia);
        -- Obtenemos el ID de Persona que se generó:
        SET iid_persona = LAST_INSERT_ID();

        -- Insertamos los datos de seguridad del Empleado:
        INSERT INTO usuario  (correo, contrasenia) VALUES(icorreo, icontrasenia);
        -- Obtenemos el ID de Usuario que se generó:
        SET iid_usuario = LAST_INSERT_ID();  
        
		SET posicion = json_length(iid_roles);
			ciclo_for: LOOP
			IF posicion = 0 THEN
				LEAVE ciclo_for;
			END IF;
		SET id_rol = JSON_EXTRACT(iid_roles, CONCAT('$[',posicion - 1,']'));
		
        INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, id_rol);
		SET posicion = posicion - 1;
			ITERATE ciclo_for;
		END LOOP;
        
        -- Insertamos en la tabla Empleado:
        INSERT INTO empleado (fk_persona, fk_usuario) VALUES(iid_persona, iid_usuario);
        -- Obtenemos el ID del Empleado que se generó:
        SET iid_empleado = LAST_INSERT_ID();
    END
//
DELIMITER ;

DROP PROCEDURE IF EXISTS actualizar_empleado;
DELIMITER //
CREATE PROCEDURE actualizar_empleado(	/* Datos Personales */
                                    IN	inombre         VARCHAR(255),     -- 1
                                    IN  iapaterno		VARCHAR(255),	 -- 2
                                    IN  iamaterno		VARCHAR(255),	 -- 3
                                    IN	itelefono 		VARCHAR(255),     -- 4
                                    IN  icodigo_postal  INT,      -- 5
                                    IN	inumero_interior VARCHAR(255),   	 -- 6
                                    IN	inumero_exterior VARCHAR(255), 	 -- 7
                                    IN	icalle       	VARCHAR(255),    -- 8
                                    IN	icolonia        VARCHAR(255),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(255),    -- 10
                                    IN	icontrasenia     VARCHAR(255),   -- 11
                                    
                                    /* Datos rol_usuario*/
                                    IN iid_roles 		VARCHAR(25),	 -- 12
                                    
                                    /* ID's de las tablas relacionadas con el Empleado */
                                    IN	iid_persona       INT,            -- 13
                                    IN	iid_usuario       INT             -- 14
				)                                    
    BEGIN        
    
    DECLARE posicion INT;
	DECLARE id_rol INT;
		
	DELETE FROM rol_usuario WHERE fk_usuario = iid_usuario;  
    
	 -- Datos Persona del Empleado:
        UPDATE persona  SET     nombre = inombre,
								apaterno = iapaterno,
                                amaterno = iamaterno,
                                telefono = itelefono,
                                codigo_postal = icodigo_postal,
                                numero_interior = inumero_interior,
                                numero_exterior = inumero_exterior,
                                calle = icalle, 
                                colonia = icolonia,
                                fecha_actualizacion = NOW()
                        WHERE   id_persona = iid_persona;

        -- Actualizamos los datos de Seguridad:
        UPDATE usuario  SET     correo = icorreo,
                                contrasenia = icontrasenia
                        WHERE   id_usuario = iid_usuario;
                        
		SET posicion = json_length(iid_roles);
		ciclo_for: LOOP
			IF posicion = 0 THEN
				LEAVE ciclo_for;
			END IF;
			SET id_rol = JSON_EXTRACT(iid_roles, CONCAT('$[',posicion - 1,']'));
            
            INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, id_rol);
			SET posicion = posicion - 1;
			ITERATE ciclo_for;
		END LOOP;
        
    END
//
DELIMITER ;

DROP PROCEDURE IF EXISTS eliminar_empleado;
DELIMITER //
CREATE PROCEDURE eliminar_empleado(	/* Datos Persona */
									IN iid_persona INT   -- 1
				)
	BEGIN
		UPDATE persona SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_persona = iid_persona;
    END
//
DELIMITER ;


DROP VIEW vista_empleado;
CREATE VIEW vista_empleado AS
SELECT 
    e.id_empleado, 
    e.fk_usuario,
    e.fk_persona,
    u.correo, 
    u.estatus, 
    p.nombre, 
    p.apaterno, 
    p.amaterno, 
    p.telefono, 
    p.codigo_postal, 
    p.numero_exterior, 
    p.numero_interior, 
    p.calle, 
    p.colonia
FROM 
    empleado e
JOIN 
    usuario u ON e.fk_usuario = u.id_usuario
JOIN 
    persona p ON e.fk_persona = p.id_persona;

DROP PROCEDURE IF EXISTS insertar_compra;

DELIMITER //
CREATE PROCEDURE insertar_compra(
	IN iarr_compras TEXT,
	IN ifk_proveedor INT,
	IN ifk_empleado INT
)
BEGIN
	DECLARE dtotal FLOAT;
	DECLARE dposicion_almacen INT;
	DECLARE dobjeto_almacen TEXT;
	DECLARE dcantidad INT;
	DECLARE dcaducidad DATETIME;
	DECLARE dfk_materia_prima INT;
    DECLARE dprecio FLOAT;
	DECLARE destatus BOOLEAN;
	DECLARE dduplicado INT;
	DECLARE did_duplicado INT;
	DECLARE dcantidad_duplicado INT;
    
	DECLARE did_almacen INT;
	DECLARE did_compra INT;
    
	SET dtotal = 0;
	INSERT INTO compra ( total, fk_proveedor, fk_empleado )
		VALUES ( dtotal, ifk_proveedor, ifk_empleado );
	SET did_compra = LAST_INSERT_ID();
    
	SET dposicion_almacen = json_length(iarr_compras);
	ciclo_for: LOOP
		IF dposicion_almacen = 0 THEN
			LEAVE ciclo_for;
		END IF;
		SET dobjeto_almacen = JSON_EXTRACT(iarr_compras, CONCAT('$[',dposicion_almacen - 1,']'));
		SET dcantidad = JSON_EXTRACT(dobjeto_almacen, CONCAT('$[0]'));
		SET dcaducidad = JSON_EXTRACT(dobjeto_almacen, CONCAT('$[1]'));
		SET dfk_materia_prima = JSON_EXTRACT(dobjeto_almacen, CONCAT('$[2]'));
		SET dprecio = JSON_EXTRACT(dobjeto_almacen, CONCAT('$[3]'));
        SET destatus = TRUE;
		SET dduplicado = (SELECT COUNT(*)
			FROM almacen
			WHERE
				caducidad = dcaducidad AND
				fk_materia_prima = dfk_materia_prima
		);
		IF dduplicado > 0 THEN
			SET did_duplicado = (SELECT id_almacen
				FROM almacen
				WHERE
					caducidad = dcaducidad AND
					fk_materia_prima = dfk_materia_prima
			);
			SET dcantidad_duplicado = (SELECT cantidad
				FROM almacen
				WHERE
					caducidad = dcaducidad AND
					fk_materia_prima = dfk_materia_prima
			);
			UPDATE almacen SET
				cantidad = (dcantidad + dcantidad_duplicado),
				estatus = TRUE,
				fecha_actualizacion = NOW()
			WHERE id_almacen = did_duplicado;
            SET did_almacen = did_duplicado;
		ELSE
			INSERT INTO almacen (cantidad, caducidad, estatus, fk_materia_prima)
				VALUES (dcantidad, dcaducidad, destatus, dfk_materia_prima);
            SET did_almacen = LAST_INSERT_ID();
		END IF;
        INSERT INTO detalle_compra ( cantidad, precio, fk_almacen, fk_compra )
			VALUES (dcantidad, dprecio, did_almacen, did_compra);
		SET dposicion_almacen = dposicion_almacen - 1;
		ITERATE ciclo_for;
	END LOOP;
	SET dtotal = (SELECT SUM(precio) FROM detalle_compra WHERE fk_compra = did_compra);
	UPDATE compra SET
		total = dtotal
	WHERE id_compra = did_compra;
END //
DELIMITER ;



-- Stored Procedure para insertar nuevos Clientes.
DROP PROCEDURE IF EXISTS insertar_cliente;
DELIMITER //
CREATE PROCEDURE insertar_cliente(	/* Datos Personales */
                                    IN	inombre          VARCHAR(255),     -- 1
                                    IN  iapaterno		 VARCHAR(255),	  -- 2
                                    IN  iamaterno		 VARCHAR(255),	  -- 3
                                    IN	itelefono 		 VARCHAR(255),     -- 4
                                    IN  icodigo_postal   INT,      -- 5
                                    IN	inumero_interior VARCHAR(255),   	  -- 6
                                    IN	inumero_exterior VARCHAR(255),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(255),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(255),    -- 10
                                    IN	icontrasenia    VARCHAR(255),    -- 11

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,           -- 12
                                    OUT	iid_usuario   	 INT,           -- 13
                                    OUT	iid_cliente      INT            -- 14
				)                                    
    BEGIN        
        IF (SELECT COUNT(*) FROM usuario WHERE correo = icorreo) = 0 THEN
            -- Insertando los datos de la Persona:
            INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
                                numero_exterior, calle, colonia) 
                        VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
                                inumero_exterior,  icalle, icolonia);
            -- Obtenemos el ID de Persona que se generó:
            SET iid_persona = LAST_INSERT_ID();

            -- Insertamos los datos de seguridad del Cliente:
            INSERT INTO usuario  (correo, contrasenia) VALUES(icorreo, icontrasenia);
            -- Obtenemos el ID de Usuario que se generó:
            SET iid_usuario = LAST_INSERT_ID();  
            
            INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, 2);
            
            -- Insertamos en la tabla Cliente:
            INSERT INTO cliente (fk_persona, fk_usuario) VALUES(iid_persona, iid_usuario);
            -- Obtenemos el ID del Cliente que se generó:
            SET iid_cliente = LAST_INSERT_ID();
        END IF;
    END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS actualizar_cliente;
DELIMITER //
CREATE PROCEDURE actualizar_cliente(	/* Datos Personales */
                                    IN	inombre          VARCHAR(255),     -- 1
                                    IN  iapaterno		 VARCHAR(255),	  -- 2
                                    IN  iamaterno		 VARCHAR(255),	  -- 3
                                    IN	itelefono 		 VARCHAR(255),     -- 4
                                    IN  icodigo_postal   INT,      -- 5
                                    IN	inumero_interior VARCHAR(255),   	  -- 6
                                    IN	inumero_exterior VARCHAR(255), 	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(255),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(100),    -- 10
                                    IN	icontrasenia    VARCHAR(100),    -- 11
                                    
                                    /* ID's de las tablas relacionadas con el Cliente */
                                    IN	iid_persona       INT,            -- 12
                                    IN	iid_usuario       INT             -- 13
				)                                    
    BEGIN        
    
	 -- Datos Persona del Cliente:
        UPDATE persona  SET     nombre = inombre,
								apaterno = iapaterno,
                                amaterno = iamaterno,
                                telefono = itelefono,
                                codigo_postal = icodigo_postal,
                                numero_interior = inumero_interior,
                                numero_exterior = inumero_exterior,
                                calle = icalle, 
                                colonia = icolonia, 
                                fecha_actualizacion =  NOW()
                        WHERE   id_persona = iid_persona;

        -- Actualizamos los datos de Seguridad:
        UPDATE usuario  SET     correo = icorreo,
                                contrasenia = icontrasenia
                        WHERE   id_usuario = iid_usuario;
        
    END
//
DELIMITER ;

DROP PROCEDURE IF EXISTS eliminar_clientes;
DELIMITER //
CREATE PROCEDURE eliminar_clientes(	/* Datos Persona */
									IN iid_persona INT    -- 1
				)
	BEGIN
		UPDATE persona SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_persona = iid_persona;
    END
//
DELIMITER ;

DROP PROCEDURE IF EXISTS buscar_empleado_id;
DELIMITER //
CREATE PROCEDURE buscar_empleado_id(
									IN p_id_empleado INT
)
BEGIN
  SELECT e.id_empleado, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal, 
         p.numero_exterior, p.numero_interior, p.calle, p.colonia, 
         rol.id_usuario, rol.correo, rol.estatus, rol.roles FROM empleado e
				INNER JOIN (SELECT id_usuario,
						correo,
						estatus,
						(SELECT JSON_ARRAYAGG(fk_rol)
							FROM rol_usuario
							WHERE fk_usuario = id_usuario)
						AS roles
					FROM usuario
					WHERE id_usuario = id_usuario
				) AS rol
                ON fk_usuario = id_usuario
                INNER JOIN persona p ON e.fk_persona = p.id_persona;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS buscar_cliente_id;
DELIMITER //
CREATE PROCEDURE buscar_cliente_id(IN p_id_cliente INT)
BEGIN
SELECT c.id_cliente, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal,
p.numero_exterior, p.numero_interior, p.calle, p.colonia, u.correo, u.contrasenia, u.estatus,p.id_persona,u.id_usuario
FROM cliente c
INNER JOIN persona p ON c.fk_persona = p.id_persona
INNER JOIN usuario u ON c.fk_usuario = u.id_usuario
WHERE c.id_cliente = p_id_cliente;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS buscar_empleado_id;
DELIMITER //
CREATE PROCEDURE buscar_empleado_id(
									IN p_id_empleado INT
)
BEGIN
  SELECT e.id_empleado, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal, 
         p.numero_exterior, p.numero_interior, p.calle, p.colonia, 
         rol.id_usuario, rol.correo, rol.estatus, rol.roles,p.id_persona,rol.id_usuario FROM empleado e
				INNER JOIN (SELECT id_usuario,
						correo,
						estatus,
						(SELECT JSON_ARRAYAGG(fk_rol)
							FROM rol_usuario
							WHERE fk_usuario = id_usuario)
						AS roles
					FROM usuario
					WHERE id_usuario = id_usuario
				) AS rol
                ON fk_usuario = id_usuario
                INNER JOIN persona p ON e.fk_persona = p.id_persona;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS buscar_proveedor_id;
DELIMITER //
CREATE PROCEDURE buscar_proveedor_id(IN p_id_proveedor INT)
BEGIN
  SELECT pr.id_proveedor, pr.correo, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal, 
         p.numero_exterior, p.numero_interior, p.calle, p.colonia
  FROM proveedor pr
  INNER JOIN persona p ON pr.fk_persona = p.id_persona
  WHERE pr.id_proveedor = p_id_proveedor;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS buscar_receta_id;
DELIMITER //
CREATE PROCEDURE buscar_receta_id(IN p_id_receta INT)
BEGIN
  SELECT r.id_receta, r.nombre, r.cantidad, r.precio, r.ruta_imagen, CONCAT("[", GROUP_CONCAT(t1.lista_receta SEPARATOR ','), "]") AS lista_receta
  FROM receta r
  INNER JOIN (
      SELECT CONCAT("[",mp.id_materia_prima,",'", mp.nombre,"',",dmpr.cantidad,"]") AS lista_receta, dmpr.fk_receta
      FROM detalle_materia_prima_receta dmpr
      INNER JOIN materia_prima mp ON mp.id_materia_prima = dmpr.fk_materia_prima
  ) t1 ON r.id_receta = t1.fk_receta
  WHERE r.id_receta = p_id_receta
  GROUP BY r.id_receta;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS buscar_envio_id;
DELIMITER //
CREATE PROCEDURE buscar_envio_id(IN p_id_envio INT)
BEGIN
  SELECT en.id_envio, fecha_entrega, entregado, v.total, 
		CONCAT(p1.nombre, ' ' ,p1.apaterno, ' ', p1.amaterno) AS nombre_cliente, 
		CONCAT(p1.calle, ' ', p1.colonia, ' ', p1.numero_exterior, ' ' , IFNULL(p1.numero_interior, '')) AS direccion, 
        p1.codigo_postal, p1.telefono,
        CONCAT(p2.nombre, ' ' ,p2.apaterno, ' ' ,p2.amaterno) AS nombre_empleado, p2.telefono
  FROM envio en
  INNER JOIN venta v ON en.fk_venta = v.id_venta
  INNER JOIN cliente c ON v.fk_cliente = c.id_cliente
  INNER JOIN persona p1 ON c.fk_persona = p1.id_persona
  INNER JOIN empleado e ON en.fk_empleado = e.id_empleado
  INNER JOIN persona p2 ON e.fk_persona = p2.id_persona
  
  WHERE en.id_envio = p_id_envio;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS buscar_materia_prima_id;
DELIMITER //
CREATE PROCEDURE buscar_materia_prima_id(IN p_id_materia_prima INT)
BEGIN
  SELECT mp.id_materia_prima, mp.nombre, um.descripcion AS unidad_medida
  FROM materia_prima mp
  INNER JOIN unidad_medida um ON mp.fk_unidad_medida = um.id_unidad_medida
  WHERE id_materia_prima = p_id_materia_prima;
END //
DELIMITER ;




DROP PROCEDURE IF EXISTS consultar_recetas_posibles;

DELIMITER //
CREATE PROCEDURE consultar_recetas_posibles( OUT oids JSON )
BEGIN
	DECLARE dposicion_receta INT;
	DECLARE dtotal_receta INT;
	DECLARE dtotal_posibles_receta INT;
	DECLARE dtotal_posibles_receta_arreglos INT;
    DECLARE did_receta INT;
    DECLARE ids_resultados JSON;
	SET ids_resultados = JSON_ARRAY();
    SET dposicion_receta = (SELECT COUNT(DISTINCT fk_receta) FROM detalle_materia_prima_receta);
    ciclo_recetas: LOOP
		IF dposicion_receta = 0 THEN
			LEAVE ciclo_recetas;
		END IF;
        SET dtotal_posibles_receta_arreglos = dposicion_receta - 1;
        SET did_receta = (SELECT fk_receta
			FROM detalle_materia_prima_receta
			GROUP BY fk_receta
			LIMIT dtotal_posibles_receta_arreglos,1);
        SET dtotal_posibles_receta = (
			SELECT COUNT(*) FROM (
				SELECT dmpr.cantidad, dmpr.fk_materia_prima, SUM(cantidad_usable) AS cantidad_usable
					FROM detalle_materia_prima_receta dmpr
					INNER JOIN
						(SELECT fk_materia_prima,
							   CASE WHEN cantidad_total IS NULL THEN cantidad ELSE cantidad_total END AS cantidad_usable
						FROM (
							SELECT a.id_almacen, a.fk_materia_prima, a.cantidad, (a.cantidad - SUM(das.cantidad)) AS cantidad_total, a.caducidad
							FROM almacen a
							LEFT JOIN detalle_almacen_stock das
							ON id_almacen = fk_almacen
							WHERE estatus = TRUE
							AND DATE(caducidad) > DATE(NOW())
							GROUP BY a.id_almacen, a.caducidad, a.estatus, a.fk_materia_prima
							HAVING cantidad_total IS NULL OR cantidad_total > 0
							ORDER BY a.caducidad
						) AS t) AS t2
					ON t2.fk_materia_prima = dmpr.fk_materia_prima
				WHERE fk_receta = did_receta
				GROUP BY cantidad, fk_materia_prima
			) AS t3
		);
        SET dtotal_receta = (SELECT COUNT(*) FROM detalle_materia_prima_receta WHERE fk_receta = did_receta);
		IF dtotal_posibles_receta = dtotal_receta THEN
			SET ids_resultados = JSON_ARRAY_APPEND(ids_resultados, '$', did_receta);
        END IF;
		SET dposicion_receta = dposicion_receta - 1;
        ITERATE ciclo_recetas;
	END LOOP;
    SET oids = ids_resultados;
END //
DELIMITER ;



INSERT INTO roles (nombre) VALUES ('Administrador');
INSERT INTO roles (nombre) VALUES ('Cliente');
INSERT INTO roles (nombre) VALUES ('Vendedor');
INSERT INTO roles (nombre) VALUES ('Repartidor');
INSERT INTO roles (nombre) VALUES ('Comprador');
INSERT INTO roles (nombre) VALUES ('Gerente');
INSERT INTO roles (nombre) VALUES ('Productor');

CALL insertar_unidad_medida('Kilogramos');
CALL insertar_unidad_medida('Gramos');
CALL insertar_unidad_medida('Litros');
CALL insertar_unidad_medida('Mililitros');
CALL insertar_unidad_medida('Saco');
CALL insertar_unidad_medida('Bolsa');
CALL insertar_unidad_medida('Paquete');
CALL insertar_unidad_medida('Cartón');
CALL insertar_unidad_medida('Frasco');
CALL insertar_unidad_medida('Unidad');

CALL insertar_materia_prima('Azucar', 1);
CALL insertar_materia_prima('Leche', 3);
CALL insertar_materia_prima('Fresas', 1);
CALL insertar_materia_prima('Hielo', 6);
CALL insertar_materia_prima('Crema', 3);
CALL insertar_materia_prima('Vainilla', 9);
CALL insertar_materia_prima('Chocolate en polvo', 2);
CALL insertar_materia_prima('Galleta oreo', 7);
CALL insertar_materia_prima('Chocoalte delice', 10);
CALL insertar_materia_prima('Colorante amarillo', 6);
CALL insertar_materia_prima('Colorante rojo', 6);
CALL insertar_materia_prima('Colorante morado', 6);
CALL insertar_materia_prima('Colorante cafe', 6);

CALL insertar_receta('Helado de fresa', 20, 2499.99, 'uploads/1',  '[[1,5],[2,3],[3,2],[4,1],[5,3]]');
CALL insertar_receta('Helado de oreo', 20, 1999.99, 'uploads/2',  '[[1,5],[2,3],[8,20],[4,1],[5,3]]');
CALL insertar_receta('Helado de vainilla', 20, 1499.99, 'uploads/3',  '[[1,5],[2,6],[4,1],[6,8],[10,3],[5,3]]');

CALL insertar_proveedor('Proveedor', 'Ivan', 'Ornelas', '4771231212', 37000, null, '111', 'Calle', 'Colonia','proveedor@gmail.com',@a,@a);
CALL insertar_empleado('Empleado', 'Ivan', 'Ornelas', '4771231212', 37000, null, '111', 'Calle', 'Colonia','empleado@gmail.com','123','[1,2,3]',@a,@a,@a);
CALL insertar_cliente('Cliente', 'Ivan', 'Ornelas', '4771231212', 37000, null, '111', 'Calle', 'Colonia','cliente@gmail.com','123',@a,@a,@a);

CALL insertar_compra( '[[500, "2024-07-30", 1, 499.99],[500, "2023-04-30", 2, 99.99]]', 1, 1 );
CALL insertar_compra( '[[500, "2024-01-30", 1, 499.99],[500, "2023-08-30", 2, 99.99]]', 1, 1 );
CALL insertar_compra( '[[500, "2024-07-30", 3, 49.99],[500, "2023-04-30", 3, 49.99]]', 1, 1 );
CALL insertar_compra( '[[500, "2024-01-30", 4, 49.99],[500, "2023-08-30", 4, 49.99]]', 1, 1 );
CALL insertar_compra( '[[500, "2024-07-30", 5, 249.99],[500, "2023-04-30", 6, 149.99]]', 1, 1 );
CALL insertar_compra( '[[500, "2024-01-30", 5, 249.99],[500, "2023-08-30", 6, 149.99]]', 1, 1 );
CALL insertar_compra( '[[500, "2024-07-30", 7, 239.99],[500, "2023-04-30", 7, 129.99]]', 1, 1 );
CALL insertar_compra( '[[500, "2024-01-30", 8, 239.99],[500, "2023-08-30", 8, 129.99]]', 1, 1 );
CALL insertar_compra( '[[200, "2024-01-01", 10, 29.99],[200, "2024-01-01", 9, 29.99],[200, "2024-01-01", 11, 29.99],[200, "2024-01-01", 12, 29.99],[200, "2024-01-01", 13, 29.99]]', 1, 1 );

CALL insertar_stock('2023-05-08 13:26:46', 199.99, 1);
CALL insertar_stock('2023-05-08 13:26:46', 199.99, 1);
CALL insertar_stock('2023-05-15 13:26:46', 199.99, 1);
CALL insertar_stock('2023-05-15 13:26:46', 299.99, 1);
CALL insertar_stock('2023-05-15 13:26:46', 299.99, 1);
CALL insertar_stock('2023-05-15 13:26:46', 399.99, 3);

CALL insertar_cliente('Ían', 'Gimenez','Villa','4771231212', 37000, null, '112', 'Calle', 
'Colonia','ian@email.com','123457',@id_persona, @id_usuario,@id_cliente);
CALL insertar_cliente('Paco', 'Villanueva','Puerta','4771231212', 37000, null, '113', 'Calle', 
'Colonia','paco@email.com','1238',@id_persona, @id_usuario,@id_cliente);
CALL insertar_cliente('Maria', 'Villegas','Bonilla','4771231212', 37000, null, '114', 'Calle', 
'Colonia','maria@email.com','1236',@id_persona, @id_usuario,@id_cliente);

CALL insertar_empleado('Luis Adrián', 'Hernández','Sánchez','4771231212', 37000, null, '115', 'Calle', 
'Colonia','adrian@email.com','12345','[1,6]',@id_persona, @id_usuario,@id_empleado);
CALL insertar_empleado('Nestor', 'Peña','Sánchez','4771231212', 37000, null, '116', 'Calle', 
'Colonia','nestor@email.com','1234','[2,7,4]',@id_persona, @id_usuario,@id_empleado);
CALL insertar_empleado('Andres', 'Bautista','Peralta','4771231212', 37000, null, '117', 'Calle', 
'Colonia','andres@email.com','123','[3]',@id_persona, @id_usuario,@id_empleado);

CALL insertar_proveedor('Janneth', 'Valencia','Palomares','4771231212', 37000, null, '120', 'Calle', 
'Colonia','janneth@email.com',@id_persona,@id_proveedor);
CALL insertar_proveedor('Diana', 'Duran','Diaz','4771231212', 37000, null, '121', 'Calle', 
'Colonia','diana@email.com',@id_persona,@id_proveedor);
CALL insertar_proveedor('Mariana', 'Molino','Parra','4771231212', 37000, null, '122', 'Calle', 
'Colonia','mariana@email.com',@id_persona,@id_proveedor);

CALL insertar_venta('[[1,1,299.99],[1,3,199.99]]', 1);
CALL insertar_venta('[[3,1,399.99]]', 2);

CALL entregar_envio(1, 1);
