USE gelatos;
-- CONSULTAR CAPACIDAD DE CREACION
-- COMRPROBAR TODAS LAS RECETAS (LISTADO DE MATERIA PRIMA) QUE SE PUEDEN HACER CON LAS COSAS DE ALMACEN
DROP PROCEDURE IF EXISTS consultar_recetas_posibles;

DELIMITER //
CREATE PROCEDURE consultar_recetas_posibles( OUT ids JSON )
BEGIN
	DECLARE cantidades_creacion_receta JSON;
	DECLARE listado_ids JSON;
	DECLARE dposicion_receta INT;
	DECLARE dposicion_ingrediente INT;
	DECLARE dposicion_resultado INT;
    DECLARE did_receta INT;
    DECLARE offset_dposicion_receta INT;
	DECLARE listado_recetas_posibles JSON;
	DECLARE ingrediente_receta JSON;
	DECLARE ingrediente_resultados JSON;
	DECLARE resultado_final_receta JSON;
	DECLARE receta_resultados JSON;
	DECLARE ids_resultados JSON;
	DECLARE coincidencia_existencia INT;
	DECLARE flag_existencia INT;
	SET listado_recetas_posibles = JSON_ARRAY();
	SET listado_ids = JSON_ARRAY();
	SET cantidades_creacion_receta = JSON_ARRAY();
	SET ingrediente_receta = JSON_ARRAY();
	SET ingrediente_resultados = JSON_ARRAY();
    SET resultado_final_receta = JSON_ARRAY();
	SET receta_resultados = JSON_ARRAY();
    SET ids_resultados = JSON_ARRAY();
    SET dposicion_receta = (
		SELECT COUNT(*)
		FROM (
			SELECT fk_receta 
			FROM detalle_materia_prima_receta 
			GROUP BY fk_receta
		) AS subquery
	);
	ciclo_recetas: LOOP
		IF dposicion_receta = 0 THEN
			LEAVE ciclo_recetas;
		END IF;

        SET offset_dposicion_receta = dposicion_receta - 1;
        SET did_receta = (
			SELECT fk_receta 
			FROM detalle_materia_prima_receta
			GROUP BY fk_receta
			LIMIT 1 OFFSET offset_dposicion_receta
		);
        
		SELECT JSON_ARRAYAGG(JSON_OBJECT(
			   'cantidad', cantidad,
			   'fk_materia_prima', fk_materia_prima
			))
			INTO cantidades_creacion_receta
		FROM detalle_materia_prima_receta
		WHERE fk_receta = did_receta;
        SET dposicion_ingrediente = JSON_LENGTH(cantidades_creacion_receta);
		ciclo_ingredientes: LOOP
			IF dposicion_ingrediente = 0 THEN
				LEAVE ciclo_ingredientes;
			END IF;
			SET flag_existencia = TRUE;
			SET coincidencia_existencia = (SELECT COUNT(*)
			FROM (
				SELECT fk_materia_prima, SUM(cantidad) AS existencia FROM almacen WHERE estatus = TRUE AND DATE(caducidad) > DATE(NOW()) GROUP BY fk_materia_prima
			) AS subquery
			WHERE subquery.fk_materia_prima = (JSON_EXTRACT(
				cantidades_creacion_receta,
				CONCAT('$[', dposicion_ingrediente - 1 , '].fk_materia_prima')
			))
			AND subquery.existencia >= (JSON_EXTRACT(
				cantidades_creacion_receta,
                CONCAT('$[', dposicion_ingrediente - 1 , '].cantidad')
			)));
			IF coincidencia_existencia = 0 THEN
				SET flag_existencia = FALSE;
			END IF;
            
			SET ingrediente_resultados = JSON_ARRAY_APPEND(
				ingrediente_resultados,
				'$',
				JSON_OBJECT(
					'flag_existencia', flag_existencia,
                    'id_materia_prima', (JSON_EXTRACT(
						cantidades_creacion_receta,
						CONCAT('$[', dposicion_ingrediente - 1 , '].fk_materia_prima')
					))
				)
			);
			SET dposicion_ingrediente = dposicion_ingrediente - 1;
			ITERATE ciclo_ingredientes;
		END LOOP;
        
		SET receta_resultados = JSON_ARRAY_APPEND(
			receta_resultados,
			'$',
			JSON_OBJECT(
				'id_receta', did_receta,
				'ingrediente_resultados', ingrediente_resultados
			)
		);
        SET ingrediente_resultados = JSON_ARRAY();
        SET dposicion_receta = dposicion_receta - 1;
        ITERATE ciclo_recetas;
	END LOOP;
    SET dposicion_resultado = JSON_LENGTH(receta_resultados);
	ciclo_resultado: LOOP
		IF dposicion_resultado = 0 THEN
			LEAVE ciclo_resultado;
		END IF;
		SET resultado_final_receta = JSON_EXTRACT(receta_resultados, CONCAT('$[', dposicion_resultado - 1,']'));
		IF NOT(JSON_CONTAINS(
			JSON_EXTRACT(resultado_final_receta
			, '$.ingrediente_resultados[*].flag_existencia'),
				'0'
			))
		THEN 
			SET ids_resultados = JSON_ARRAY_APPEND(ids_resultados, '$', JSON_EXTRACT(resultado_final_receta, '$.id_receta'));
		END IF;        
        SET dposicion_resultado = dposicion_resultado - 1;
        ITERATE ciclo_resultado;
	END LOOP;
    SELECT *
	FROM receta
	WHERE id_receta IN (
	  SELECT * FROM JSON_TABLE(ids_resultados, '$[*]' COLUMNS (id VARCHAR(255) PATH '$')) AS jt
	);
    SET ids = ids_resultados;
END //
DELIMITER ;

CALL consultar_recetas_posibles(@ids);