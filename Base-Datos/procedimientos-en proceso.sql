

DROP PROCEDURE IF EXISTS insertar_stock;

DELIMITER //
CREATE PROCEDURE insertar_stock(
	IN iarr_ventas TEXT,
	IN icaducidad DATETIME,
    IN iprecio FLOAT,
    IN ifk_receta INT
)
BEGIN
	DECLARE dobjeto_venta TEXT;
    CALL consultar_recetas_posibles(@ids);
	IF ifk_receta IN (SELECT id_receta
		FROM receta
		WHERE id_receta IN (
		  SELECT * FROM JSON_TABLE(@idsss, '$[*]' COLUMNS (id VARCHAR(255) PATH '$')) AS jt
		)) THEN
		INSERT INTO stock (caducidad, precio, fk_receta)
			VALUES (icaducidad, iprecio, ifk_receta);
		
        SET dposicion_venta = json_length(iarr_compras);
		SET dobjeto_venta = JSON_EXTRACT(iarr_ventas, CONCAT('$[',dposicion_almacen - 1,']'));
		SET dcantidad = JSON_EXTRACT(dobjeto_venta, CONCAT('$[0]'));

        
		INSERT INTO detalle_almacen_stock (cantidad, fk_almacen, fk_stock)
			VALUES (5, 1, 1);
	END IF;
END //
DELIMITER ;

CALL my_procedure();
