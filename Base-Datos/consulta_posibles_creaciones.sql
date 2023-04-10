USE gelatos;

DROP PROCEDURE IF EXISTS consultar_recetas_posibles;

DELIMITER //
CREATE PROCEDURE consultar_recetas_posibles( OUT oids JSON )
BEGIN
	DECLARE dposicion_receta INT;
	DECLARE dtotal_receta INT;
	DECLARE dtotal_posibles_receta INT;
	DECLARE dtotal_posibles_receta_arreglos INT;
    DECLARE did_receta INT;
    DECLARE ids_resultados JSON;
	SET ids_resultados = JSON_ARRAY();
    SET dposicion_receta = (SELECT COUNT(DISTINCT fk_receta) FROM detalle_materia_prima_receta);
    ciclo_recetas: LOOP
		IF dposicion_receta = 0 THEN
			LEAVE ciclo_recetas;
		END IF;
        SET dtotal_posibles_receta_arreglos = dposicion_receta - 1;
        SET did_receta = (SELECT fk_receta
			FROM detalle_materia_prima_receta
			GROUP BY fk_receta
			LIMIT dtotal_posibles_receta_arreglos,1);
        SET dtotal_posibles_receta = (
			SELECT COUNT(*) FROM (
				SELECT dmpr.cantidad, dmpr.fk_materia_prima, SUM(cantidad_usable) AS cantidad_usable
					FROM detalle_materia_prima_receta dmpr
					INNER JOIN
						(SELECT fk_materia_prima,
							   CASE WHEN cantidad_total IS NULL THEN cantidad ELSE cantidad_total END AS cantidad_usable
						FROM (
							SELECT a.id_almacen, a.fk_materia_prima, a.cantidad, (a.cantidad - SUM(das.cantidad)) AS cantidad_total, a.caducidad
							FROM almacen a
							LEFT JOIN detalle_almacen_stock das
							ON id_almacen = fk_almacen
							WHERE estatus = TRUE
							AND DATE(caducidad) > DATE(NOW())
							GROUP BY a.id_almacen, a.caducidad, a.estatus, a.fk_materia_prima
							HAVING cantidad_total IS NULL OR cantidad_total > 0
							ORDER BY a.caducidad DESC
						) AS t) AS t2
					ON t2.fk_materia_prima = dmpr.fk_materia_prima
				WHERE fk_receta = 1
				GROUP BY cantidad, fk_materia_prima
			) AS t3
		);
        SET dtotal_receta = (SELECT COUNT(*) FROM detalle_materia_prima_receta WHERE fk_receta = did_receta);
		IF dtotal_posibles_receta = dtotal_receta THEN
			SET ids_resultados = JSON_ARRAY_APPEND(ids_resultados, '$', did_receta);
        END IF;
		SET dposicion_receta = dposicion_receta - 1;
        ITERATE ciclo_recetas;
	END LOOP;
    SET oids = ids_resultados;
END //
DELIMITER ;

CALL consultar_recetas_posibles(@ids);
SELECT @ids;
