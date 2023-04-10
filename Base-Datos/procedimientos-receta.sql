USE gelatos;

-- Stored Procedure para insertar nuevas Recetas.
DROP PROCEDURE IF EXISTS insertar_receta;
DELIMITER //
CREATE PROCEDURE insertar_receta(	/* Datos Receta*/
                                    IN	inombre         VARCHAR(50),	-- 1
                                    IN  icantidad		INT,			-- 2
                                    IN  iprecio		 	FLOAT,			-- 3
                                    IN	iruta_imagen 	TEXT,			-- 4

                                    /* Valores de Retorno */
                                    OUT	iid_receta      INT				-- 5
				)                                    
    BEGIN        
    
        -- Insertando los datos de la Receta:
        INSERT INTO receta ( nombre, cantidad, precio, ruta_imagen) 
					 VALUES ( inombre, icantidad, iprecio, iruta_imagen);
        -- Obtenemos el ID de Receta que se generó:
        SET iid_receta = LAST_INSERT_ID();

    END
//
DELIMITER ;

CALL insertar_receta('Helado Frambuesa', '20', '300', '-',@id_receta);
CALL insertar_receta('Helado Cajeta', '20', '200', '-',@id_receta);
CALL insertar_receta('Helado choco chips', '20', '220', '-',@id_receta);


-- Stored Procedure para actualizar Receta.
DROP PROCEDURE IF EXISTS actualizar_receta;
DELIMITER //
CREATE PROCEDURE actualizar_receta(	/* Datos Receta */
                                    IN	inombre         VARCHAR(50),	-- 1
                                    IN  icantidad		INT,			-- 2
                                    IN  iprecio		 	FLOAT,			-- 3
                                    IN	iruta_imagen 	TEXT,			-- 4
                                    
                                    /* ID de la tabla Receta*/
                                    IN	iid_receta       INT			-- 5
				)                                    
    BEGIN        
    
	 -- Datos Receta:
        UPDATE receta  SET     nombre = inombre,
								cantidad = icantidad,
                                precio = iprecio,
                                ruta_imagen = iruta_imagen,
                                fecha_actualizacion = NOW()
                        WHERE   id_receta = iid_receta;
    END
//
DELIMITER ;

CALL actualizar_receta('Helado vainilla chips', '20', '240', '-',6);


-- Stored Procedure para eliminar receta.
DROP PROCEDURE IF EXISTS eliminar_receta;
DELIMITER //
CREATE PROCEDURE eliminar_receta(	/* Datos Receta */
									IN iid_receta INT   -- 1
				)
	BEGIN
		UPDATE receta SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_receta = iid_receta;
    END
//
DELIMITER ;

CALL eliminar_receta(6);
