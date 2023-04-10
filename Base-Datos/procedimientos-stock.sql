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

