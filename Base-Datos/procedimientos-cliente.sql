USE gelatos;

-- Stored Procedure para insertar nuevos Clientes.
DROP PROCEDURE IF EXISTS insertar_cliente;
DELIMITER $$
CREATE PROCEDURE insertar_cliente(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6),   	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    IN ifecha_creacion   DATETIME,        -- 10
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(100),    -- 11
                                    IN	icontrasenia    VARCHAR(100),    -- 12

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,           -- 13
                                    OUT	iid_usuario   	 INT,           -- 14
                                    OUT	iid_cliente      INT            -- 15
				)                                    
    BEGIN        
    
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
							  numero_exterior, calle, colonia, estatus, fecha_creacion) 
					 VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
							  inumero_exterior,  icalle, icolonia, 1, ifecha_creacion);
        -- Obtenemos el ID de Persona que se generó:
        SET iid_persona = LAST_INSERT_ID();

        -- Insertamos los datos de seguridad del Cliente:
        INSERT INTO usuario  (correo, contrasenia) VALUES(icorreo, icontrasenia);
        -- Obtenemos el ID de Usuario que se generó:
        SET iid_usuario = LAST_INSERT_ID();  
		
        INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, 5);
        
        -- Insertamos en la tabla Cliente:
        INSERT INTO cliente (fk_persona, fk_usuario) VALUES(iid_persona, iid_usuario);
        -- Obtenemos el ID del Cliente que se generó:
        SET iid_cliente = LAST_INSERT_ID();
    END
$$
DELIMITER ;

CALL insertar_cliente('Ían', 'Gimenez','Villa','4771234568','37208','123', '-','Sabinas',
'Nuevo León',NULL,'ian@email.com','123457',@id_persona, @id_usuario,@id_cliente);
CALL insertar_cliente('Paco', 'Villanueva','Puerta','4772345690','37209','428-B', '-','Via Palatino',
'Villa Magna',NULL,'paco@email.com','1238',@id_persona, @id_usuario,@id_cliente);
CALL insertar_cliente('Maria', 'Villegas','Bonilla','4773456790','37207','4', '400-C','Elefante esa',
'Villa Magna',NULL,'maria@email.com','1236',@id_persona, @id_usuario,@id_cliente);


-- Stored Procedure para actualizar Clientes.
DROP PROCEDURE IF EXISTS actualizar_cliente;
DELIMITER $$
CREATE PROCEDURE actualizar_cliente(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		 VARCHAR(50),	  -- 2
                                    IN  iamaterno		 VARCHAR(50),	  -- 3
                                    IN	itelefono 		 VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	  -- 6
                                    IN	inumero_exterior VARCHAR(6), 	  -- 7
                                    IN	icalle       	 VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    IN ifecha_actualizacion DATETIME,     -- 10
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(100),    -- 11
                                    IN	icontrasenia    VARCHAR(100),    -- 12
                                    
                                    /* ID's de las tablas relacionadas con el Cliente */
                                    IN	iid_persona       INT,            -- 13
                                    IN	iid_usuario       INT             -- 14
				)                                    
    BEGIN        
    
	 -- Datos Persona del Cliente:
        UPDATE persona  SET     nombre = inombre,
								apaterno = iapaterno,
                                amaterno = iamaterno,
                                telefono = itelefono,
                                codigo_postal = icodigo_postal,
                                numero_interior = inumero_interior,
                                numero_exterior = inumero_exterior,
                                calle = icalle, 
                                colonia = icolonia,
                                estatus = 1,
                                fecha_actualizacion = ifecha_actualizacion
                        WHERE   id_persona = iid_persona;

        -- Actualizamos los datos de Seguridad:
        UPDATE usuario  SET     correo = icorreo,
                                contrasenia = icontrasenia
                        WHERE   id_usuario = iid_usuario;
        
    END
$$
DELIMITER ;

CALL actualizar_cliente('Pablo','Palomares','Sánchez','4771234567','37287',110,NULL,'Elefante esa',
'Villa Magna',NULL,'pablo@email.com','123456',4,4);


-- Stored Procedure para eliminar Clientes.
DROP PROCEDURE IF EXISTS eliminar_clientes;
DELIMITER $$
CREATE PROCEDURE eliminar_clientes(	/* Datos Persona */
									IN iid_persona INT,             -- 1
                                    IN ifecha_eliminacion DATETIME  -- 2
				)
	BEGIN
		UPDATE persona SET  estatus = 0,
							fecha_eliminacion = ifecha_eliminacion
        WHERE id_persona = iid_persona;
    END
$$
DELIMITER ;

CALL eliminar_clientes(4,'2023-04-07');