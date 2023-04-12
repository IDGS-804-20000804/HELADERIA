

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
    DECLARE realizar_commit BOOLEAN;
    DECLARE dcomprobacion_existencia INT;
    
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

CALL insertar_venta('[[1,2,199.99],[1,2,299.99]]',1);
