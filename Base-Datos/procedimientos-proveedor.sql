USE gelatos;

-- Stored Procedure para insertar nuevos Proveedores.
DROP PROCEDURE IF EXISTS insertar_proveedor;
DELIMITER $$
CREATE PROCEDURE insertar_proveedor(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Proveedor */
                                    IN	icorreo   		VARCHAR(100),    -- 10

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,            -- 11
                                    OUT	iid_proveedor      INT           -- 12
				)                                    
    BEGIN        
    
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
							  numero_exterior, calle, colonia) 
					 VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
							  inumero_exterior,  icalle, icolonia);
        -- Obtenemos el ID de Persona que se generó:
        SET iid_persona = LAST_INSERT_ID();

        -- Insertamos en la tabla Proveedores:
        INSERT INTO proveedor (correo, fk_persona) VALUES(icorreo, iid_persona);
        -- Obtenemos el ID del Proveedores que se generó:
        SET iid_proveedor = LAST_INSERT_ID();
    END
$$
DELIMITER ;

CALL insertar_proveedor('Janneth', 'Valencia','Palomares','4771231212', 37000, null, '120', 'Calle', 
'Colonia','janneth@email.com',@id_persona,@id_proveedor);
CALL insertar_proveedor('Diana', 'Duran','Diaz','4771231212', 37000, null, '121', 'Calle', 
'Colonia','diana@email.com',@id_persona,@id_proveedor);
CALL insertar_proveedor('Mariana', 'Molino','Parra','4771231212', 37000, null, '122', 'Calle', 
'Colonia','mariana@email.com',@id_persona,@id_proveedor);


-- Stored Procedure para actualizar Proveedor.
DROP PROCEDURE IF EXISTS actualizar_proveedor;
DELIMITER $$
CREATE PROCEDURE actualizar_proveedor(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6), 	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Proveedor */
                                    IN	icorreo   		VARCHAR(100),     -- 10
                                    
                                    /* ID's de las tablas relacionadas con el Proveedor */
                                    IN	iid_persona       INT,            -- 11
                                    IN  iid_proveedor 	  INT			  -- 12
				)                                    
    BEGIN        
    
	 -- Datos Persona del Proveedor:
        UPDATE persona  SET     nombre = inombre,
								apaterno = iapaterno,
                                amaterno = iamaterno,
                                telefono = itelefono,
                                codigo_postal = icodigo_postal,
                                numero_interior = inumero_interior,
                                numero_exterior = inumero_exterior,
                                calle = icalle, 
                                colonia = icolonia,
                                fecha_actualizacion = NOW()
                        WHERE   id_persona = iid_persona;

        -- Actualizamos los datos de Proveedor:
        UPDATE proveedor  SET    correo = icorreo
                        WHERE   id_proveedor = iid_proveedor;
        
    END
$$
DELIMITER ;

CALL actualizar_proveedor('Daniela','Duran','Diaz','4774567890','37209',NULL,'134','Bangladeh',
'Cañon de la India','daniela@email.com',10,10);


-- Stored Procedure para eliminar Proveedor.
DROP PROCEDURE IF EXISTS eliminar_proveedor;
DELIMITER $$
CREATE PROCEDURE eliminar_proveedor(	/* Datos Persona */
									IN iid_persona INT   -- 1
				)
	BEGIN
		UPDATE persona SET  estatus = false,
							fecha_actualizacion = NOW()
        WHERE id_persona = iid_persona;
    END
$$
DELIMITER ;

CALL eliminar_proveedor(10);