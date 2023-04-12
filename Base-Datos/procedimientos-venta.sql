
DROP PROCEDURE IF EXISTS insertar_venta;

DELIMITER //
CREATE PROCEDURE insertar_venta(
	IN iarr_ventas TEXT,
	IN ifecha_entrega DATETIME,
    IN ifk_cliente INT,
	IN ifk_empleado INT
)
BEGIN
    DECLARE did_venta INT;
	DECLARE did_stock INT;
	DECLARE dcantidad INT;
	DECLARE dposicion_ventas INT;
    DECLARE dtotal FLOAT;
    DECLARE dprecio FLOAT;
	DECLARE dexistencias_stock JSON;
    DECLARE dobjeto_venta JSON;
	DECLARE did_stock_existencia INT;
	DECLARE dprecio_existencia FLOAT;
	DECLARE dstock_existencia INT;

	SET dtotal = 0;
	INSERT INTO venta (total, fk_cliente) VALUES (dtotal, ifk_cliente);
	SET did_venta = LAST_INSERT_ID();

	SET dposicion_ventas = JSON_LENGTH(iarr_ventas);
	ciclo_for: LOOP
		IF dposicion_ventas = 0 THEN
			LEAVE ciclo_for;
		END IF;
		SET dobjeto_venta = JSON_EXTRACT(iarr_ventas, CONCAT('$[',dposicion_ventas - 1,']'));
		SET did_stock = JSON_EXTRACT(dobjeto_venta, CONCAT('$[0]'));
		SET dcantidad = JSON_EXTRACT(dobjeto_venta, CONCAT('$[1]'));
		SELECT JSON_OBJECT(
				'id_stock', id_stock,
				'precio', ROUND(precio,2),
				'stock_usable', stock_usable
			)
			INTO dexistencias_stock
		FROM (
			SELECT id_stock, precio, (cantidad - IFNULL(stock_usado, 0)) AS stock_usable
				FROM (SELECT id_stock, caducidad, cantidad, precio, estatus, fk_receta FROM stock) AS s
				LEFT JOIN (SELECT SUM(cantidad) AS stock_usado, fk_stock FROM detalle_venta GROUP BY fk_stock) AS dv
					ON fk_stock = id_stock
				WHERE s.estatus = TRUE
				AND DATE(s.caducidad) > DATE(NOW())
				AND (cantidad - IFNULL(stock_usado, 0)) > 0
				AND id_stock = did_stock
			) AS t;
		SET did_stock_existencia = JSON_EXTRACT(dexistencias_stock, '$.id_stock');
		SET dprecio_existencia = JSON_EXTRACT(dexistencias_stock, '$.precio');
		SET dstock_existencia = JSON_EXTRACT(dexistencias_stock, '$.stock_usable');
        IF NOT(dcantidad > dstock_existencia) THEN
			INSERT INTO detalle_venta(cantidad, precio, fk_stock, fk_venta)
				VALUES (dcantidad, dprecio_existencia, dstock_existencia, did_venta);		
        END IF;
		SET dposicion_ventas = dposicion_ventas - 1;
		ITERATE ciclo_for;
	END LOOP;
    SET dtotal = (SELECT SUM(precio) FROM detalle_compra WHERE fk_compra = did_compra);
	UPDATE compra SET
		total = dtotal
	WHERE id_compra = did_compra;
	INSERT INTO envio ( fecha_entrega, fk_venta ) 
		VALUES ( ifecha_entrega, ifk_venta );
END //
DELIMITER ;


-- [id_stock,cantidad]
CALL insertar_venta('[[1,1],[6,1],[5,1]]','2023-05-08 13:26:46',1,1);
-- SELECT * FROM venta;
-- SELECT * FROM detalle_venta;
-- DELETE FROM detalle_venta WHERE id_detalle_venta > 0;
-- DELETE FROM venta WHERE id_venta > 0;

-- SELECT id_stock, precio, (cantidad - IFNULL(stock_usado, 0)) AS stock_usable
-- 				FROM (SELECT id_stock, caducidad, cantidad, precio, estatus, fk_receta FROM stock) AS s
-- 				LEFT JOIN (SELECT SUM(cantidad) AS stock_usado, fk_stock FROM detalle_venta GROUP BY fk_stock) AS dv
-- 					ON fk_stock = id_stock
-- 				WHERE s.estatus = TRUE
-- 				AND DATE(s.caducidad) > DATE(NOW())
-- 				AND (cantidad - IFNULL(stock_usado, 0)) > 0;
