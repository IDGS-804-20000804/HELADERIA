USE gelatos;

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

-- CALL insertar_materia_prima('Nueva materia prima', 1);
-- CALL actualizar_materia_prima(14, 'Mas nueva materia prima', TRUE, 2);
-- CALL eliminar_materia_prima(14);
