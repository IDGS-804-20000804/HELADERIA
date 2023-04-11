USE gelatos;

DROP PROCEDURE IF EXISTS consultar_stock;

DELIMITER //
CREATE PROCEDURE consultar_stock()
BEGIN
	SELECT id_stock, caducidad, stock.precio AS stock_precio, stock.estatus AS stock_estatus, nombre, cantidad, receta.precio AS receta_precio, ruta_imagen, receta.estatus AS receta_estatus
	FROM stock
	INNER JOIN
	receta ON id_receta = fk_receta;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_stock_por_id;

DELIMITER //
CREATE PROCEDURE consultar_stock_por_id( IN iid_stock INT )
BEGIN
	SELECT id_stock, caducidad, stock.precio AS stock_precio, stock.estatus AS stock_estatus, nombre, cantidad, receta.precio AS receta_precio, ruta_imagen, receta.estatus AS receta_estatus
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

CALL insertar_stock('2023-05-08 13:26:46', 199.99, 1);
