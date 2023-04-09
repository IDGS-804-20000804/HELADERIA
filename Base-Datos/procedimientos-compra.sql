USE gelatos;

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

-- CALL insertar_compra( '[5, 2023-04-30, 1, 200],[5, 2023-04-30, 2, 100]', 1, 1 );
-- [cantidad, fecha, fk_materia_prima, precio]
-- CALL insertar_compra( '[[500, "2024-07-30", 1, 500.111111],[5, "2023-04-30", 2, 100.222222]]', 1, 1 );
