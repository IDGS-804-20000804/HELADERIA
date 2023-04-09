USE gelatos;
INSERT INTO venta (total, fk_cliente)
    VALUES(1000, 1);

-- Stored Procedure para insertar nuevos Envios.
DROP PROCEDURE IF EXISTS insertar_envio;
DELIMITER $$
CREATE PROCEDURE insertar_envio(	/* Datos Envio*/
                                    IN	ifecha_entrega	DATETIME,	-- 1
                                    IN	ifk_venta     INT,			-- 2
                                    IN	ifk_empleado  INT,			-- 3

                                    /* Valor de Retorno */
                                    OUT	iid_envio     INT			-- 4
                                    
                                    
				)                                    
    BEGIN        
    
        -- Insertando los datos del Envio:
        INSERT INTO envio ( fecha_entrega, fk_venta, fk_empleado) 
					 VALUES ( ifecha_entrega, ifk_venta, ifk_empleado);
        -- Obtenemos el ID del Envio que se generó:
        SET iid_envio = LAST_INSERT_ID();

    END
$$
DELIMITER ;

CALL insertar_envio('2023-04-18 13:00:00',1,1,@id_envio);


-- Stored Procedure para actualizar Envio.
DROP PROCEDURE IF EXISTS actualizar_envio;
DELIMITER $$
CREATE PROCEDURE actualizar_envio(	/* Datos Envio */
                                    IN	ifecha_entrega	DATETIME,	-- 1
                                    IN	ifk_venta     INT,			-- 2
                                    IN	ifk_empleado  INT,			-- 3
                                    
                                    /* ID de la tabla Envio*/
                                    IN	iid_envio     INT			-- 4
				)                                    
    BEGIN        
    
	 -- Datos Envio:
        UPDATE envio  SET 	fecha_entrega = ifecha_entrega,
							fk_venta = ifk_venta,
							fk_empleado = ifk_empleado,
                            fecha_actualizacion = NOW()
                        WHERE   id_envio = iid_envio;
    END
$$
DELIMITER ;

CALL actualizar_envio('2023-04-17 01:30:00',1,1,@id_envio);


-- Stored Procedure para entregar envio.
DROP PROCEDURE IF EXISTS entregar_envio;
DELIMITER $$
CREATE PROCEDURE entregar_envio(	/* Datos Envio */
									IN iid_envio INT   -- 1
				)
	BEGIN
		UPDATE envio SET  entregado = true,
							fecha_actualizacion = NOW()
        WHERE id_envio = iid_envio;
    END
$$
DELIMITER ;

CALL entregar_envio(1);