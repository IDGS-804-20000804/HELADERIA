USE gelatos;

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

-- [fk_materia_prima, cantidad]
CALL insertar_receta('Helado Frambuesa', '20', '299.99', '/uploads/asdasd', '[[1, 10],[2, 15],[3, 3],[4, 5],[5, 4]]');


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

CALL actualizar_receta(3, 'Helado Frambuesa', '20', '299.99', '/uploads/asdasd', '[[1, 10],[2, 15],[3, 3],[4, 5],[5, 4]]');

-- Stored Procedure para eliminar receta.
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

CALL eliminar_receta(6);