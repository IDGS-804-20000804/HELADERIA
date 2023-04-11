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
  fecha_entrega DATETIME NOT NULL,
  entregado BOOLEAN NOT NULL DEFAULT FALSE,
  fecha_creacion DATETIME NOT NULL DEFAULT NOW(),
  fecha_actualizacion DATETIME NOT NULL DEFAULT NOW(),
  fk_venta INT NOT NULL,
  fk_empleado INT NOT NULL
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


-- Stored Procedure para insertar nuevos Clientes.
DROP PROCEDURE IF EXISTS insertar_cliente;
DELIMITER //
CREATE PROCEDURE insertar_cliente(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(100),    -- 10
                                    IN	icontrasenia    VARCHAR(100),    -- 11

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,           -- 12
                                    OUT	iid_usuario   	 INT,           -- 13
                                    OUT	iid_cliente      INT            -- 14
				)                                    
    BEGIN        
    
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
		
        INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, 5);
        
        -- Insertamos en la tabla Cliente:
        INSERT INTO cliente (fk_persona, fk_usuario) VALUES(iid_persona, iid_usuario);
        -- Obtenemos el ID del Cliente que se generó:
        SET iid_cliente = LAST_INSERT_ID();
    END
//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_unidad_medida(
    IN idescripcion VARCHAR(255)
)
BEGIN
	INSERT INTO unidad_medida ( descripcion )
		VALUES (idescripcion);
END //
DELIMITER ;


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
							ORDER BY a.caducidad DESC
						) AS t) AS t2
					ON t2.fk_materia_prima = dmpr.fk_materia_prima
				WHERE fk_receta = 1
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

DELIMITER //
CREATE PROCEDURE insertar_empleado(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(100),    -- 10
                                    IN	icontrasenia    VARCHAR(100),    -- 11
                                    
                                    /* Datos rol_usuario*/
                                    IN iid_roles 		VARCHAR(25),	 -- 12

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
	SET dlistado_existencias = JSON_ARRAY();
	SET dreceta = JSON_ARRAY();
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
					ORDER BY a.caducidad DESC
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
					ELSE 
						INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
							VALUES (dcantidad, did_almacen, did_stock);
						LEAVE subciclo_tabla_intermedia;
					END IF;
					ITERATE subciclo_tabla_intermedia;
				END LOOP;
			ELSE 
				INSERT INTO detalle_almacen_stock(cantidad, fk_almacen, fk_stock)
					VALUES (dcantidad, did_almacen, did_stock);
			END IF;

			SET dposicion_receta = dposicion_receta - 1;
            ITERATE ciclo_for;
		END LOOP;
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE insertar_receta(
	IN	inombre VARCHAR(255),
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
	
     INSERT INTO receta ( nombre, precio, ruta_imagen)
 		VALUES ( inombre, iprecio, iruta_imagen);
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

CALL insertar_receta('Helado de fresa', 2499.99, 'uploads/1',  '[[1,5],[2,3],[3,2],[4,1],[5,3]]');
CALL insertar_receta('Helado de oreo', 1999.99, 'uploads/2',  '[[1,5],[2,3],[8,20],[4,1],[5,3]]');
CALL insertar_receta('Helado de vainilla', 1499.99, 'uploads/3',  '[[1,5],[2,6],[4,1],[6,8],[10,3],[5,3]]');

CALL insertar_proveedor('Proveedor', 'Ivan', 'Ornelas', '4771231212', 37000, null, '111', 'Calle', 'Colonia','proveedor@gmail.com',@a,@a);
CALL insertar_empleado('Empleado', 'Ivan', 'Ornelas', '4771231212', 37000, null, '111', 'Calle', 'Colonia','empleado@gmail.com','123','[1,2,3]',@a,@a,@a);
CALL insertar_cliente('Cliente', 'Ivan', 'Ornelas', '4771231212', 37000, null, '111', 'Calle', 'Colonia','cloente@gmail.com','123',@a,@a,@a);

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