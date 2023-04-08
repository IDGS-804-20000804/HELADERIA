USE gelatos;

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

-- CALL insertar_materia_prima('Nueva materia prima', 1);
-- CALL actualizar_materia_prima(14, 'Mas nueva materia prima', TRUE, 2);
-- CALL eliminar_materia_prima(14);


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

-- CALL insertar_unidad_medida('Nueva unidad medida');
-- CALL actualizar_unidad_medida(1, 'Mas nueva unidad medida', TRUE);
-- CALL eliminar_unidad_medida(1);



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

END //
DELIMITER ;

CALL insertar_compra( '[5, 2023-04-30, 1, 200],[5, 2023-04-30, 2, 100]', 1, 1 );



DROP PROCEDURE IF EXISTS insertar_compra;

DELIMITER //
CREATE PROCEDURE insertar_compra(
	IN iarr_compras JSON,
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
        SET dtotal = dtotal + dprecio;
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
    UPDATE compra SET total = dtotal WHERE id_compra = did_compra;
END //
DELIMITER ;

-- [cantidad, fecha, fk_materia_prima, precio]
-- CALL insertar_compra( '[[500, "2024-07-30", 1, 500.111111],[5, "2023-04-30", 2, 100.222222]]', 1, 1 );


