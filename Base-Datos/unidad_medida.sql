USE gelatos;

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

-- CALL insertar_unidad_medida('Nueva unidad medida');
-- CALL actualizar_unidad_medida(1, 'Mas nueva unidad medida', TRUE);
-- CALL eliminar_unidad_medida(1);
