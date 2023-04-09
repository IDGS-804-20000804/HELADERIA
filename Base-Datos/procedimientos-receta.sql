USE gelatos;

DROP PROCEDURE IF EXISTS consultar_receta;

DELIMITER //
CREATE PROCEDURE consultar_receta()
BEGIN
	SELECT id_receta, nombre, cantidad, precio, ruta_imagen, estatus
	FROM receta;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_receta_por_id;

DELIMITER //
CREATE PROCEDURE consultar_receta_por_id( IN iid_receta INT )
BEGIN
	SELECT id_receta, nombre, cantidad, precio, ruta_imagen, estatus
	FROM receta
    WHERE id_receta = iid_receta;
END //
DELIMITER ;

