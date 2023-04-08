USE gelatos;

-- Stored Procedure para insertar nuevos Empleados.
DROP PROCEDURE IF EXISTS insertar_empleado;
DELIMITER $$
CREATE PROCEDURE insertar_empleado(	/* Datos Personales */
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
                                    
                                    /* Datos rol_usuario*/
                                    IN iid_roles 		VARCHAR(25),	 -- 13

                                    /* Valores de Retorno */
                                    OUT	iid_persona      INT,           -- 14
                                    OUT	iid_usuario   	 INT,           -- 15
                                    OUT	iid_empleado     INT            -- 16
				)                                    
    BEGIN        
	DECLARE posicion INT;
	DECLARE id_rol INT;
        
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, 
							  numero_exterior, calle, colonia, estatus, fecha_creacion) 
					 VALUES ( inombre, iapaterno, iamaterno, itelefono, icodigo_postal, inumero_interior, 
							  inumero_exterior,  icalle, icolonia, 1, ifecha_creacion);
        -- Obtenemos el ID de Persona que se generó:
        SET iid_persona = LAST_INSERT_ID();

        -- Insertamos los datos de seguridad del Empleado:
        INSERT INTO usuario  (correo, contrasenia) VALUES(icorreo, icontrasenia);
        -- Obtenemos el ID de Usuario que se generó:
        SET iid_usuario = LAST_INSERT_ID();  
        
		SET posicion = json_length(iid_roles);
			ciclo_for: LOOP
			IF posicion = 0 THEN
				LEAVE ciclo_for;
			END IF;
		SET id_rol = JSON_EXTRACT(iid_roles, CONCAT('$[',posicion - 1,']'));
		
        INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, id_rol);
		SET posicion = posicion - 1;
			ITERATE ciclo_for;
		END LOOP;
        
        -- Insertamos en la tabla Empleado:
        INSERT INTO empleado (fk_persona, fk_usuario) VALUES(iid_persona, iid_usuario);
        -- Obtenemos el ID del Empleado que se generó:
        SET iid_empleado = LAST_INSERT_ID();
    END
$$
DELIMITER ;

CALL insertar_empleado('Luis Adrián', 'Hernández','Sánchez','4771234567','37287','538', '34-A','Elefante esa, Via Palatino',
'Villa Magna',NULL,'adrian@email.com','12345','[1,6]',@id_persona, @id_usuario,@id_empleado);
CALL insertar_empleado('Nestor', 'Peña','Sánchez','4779876543','37287','428-B', '-','Via Palatino',
'Villa Magna',NULL,'nestor@email.com','1234','[2,7,4]',@id_persona, @id_usuario,@id_empleado);
CALL insertar_empleado('Andres', 'Bautista','Peralta','4778765432','37287','4', '400-C','Elefante esa',
'Villa Magna',NULL,'andres@email.com','123','[3]',@id_persona, @id_usuario,@id_empleado);


-- Stored Procedure para actualizar Empleados.
DROP PROCEDURE IF EXISTS actualizar_empleado;
DELIMITER $$
CREATE PROCEDURE actualizar_empleado(	/* Datos Personales */
                                    IN	inombre          VARCHAR(50),     -- 1
                                    IN  iapaterno		VARCHAR(50),	 -- 2
                                    IN  iamaterno		VARCHAR(50),	 -- 3
                                    IN	itelefono 		VARCHAR(10),     -- 4
                                    IN  icodigo_postal   VARCHAR(6),      -- 5
                                    IN	inumero_interior VARCHAR(6),   	 -- 6
                                    IN	inumero_exterior VARCHAR(6), 	 -- 7
                                    IN	icalle       	VARCHAR(255),    -- 8
                                    IN	icolonia         VARCHAR(100),    -- 9
                                    IN ifecha_actualizacion DATETIME,     -- 10
                                    
                                    /* Datos de Usuario */
                                    IN	icorreo   		VARCHAR(100),    -- 11
                                    IN	icontrasenia     VARCHAR(100),    -- 12
                                    
                                    /* Datos rol_usuario*/
                                    IN iid_roles 		VARCHAR(25),	 -- 13
                                    
                                    /* ID's de las tablas relacionadas con el Empleado */
                                    IN	iid_persona       INT,            -- 14
                                    IN	iid_usuario       INT             -- 15
				)                                    
    BEGIN        
    
    DECLARE posicion INT;
	DECLARE id_rol INT;
		
	DELETE FROM rol_usuario WHERE fk_usuario = iid_usuario;  
    
	 -- Datos Persona del Empleado:
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
                        
		SET posicion = json_length(iid_roles);
		ciclo_for: LOOP
			IF posicion = 0 THEN
				LEAVE ciclo_for;
			END IF;
			SET id_rol = JSON_EXTRACT(iid_roles, CONCAT('$[',posicion - 1,']'));
            
            INSERT INTO rol_usuario (fk_usuario, fk_rol) VALUES (iid_usuario, id_rol);
			SET posicion = posicion - 1;
			ITERATE ciclo_for;
		END LOOP;
        
    END
$$
DELIMITER ;

CALL actualizar_empleado('Pepe','Pepa','Sánchez','4771234567','37287',110,NULL,'Elefante esa',
'Villa Magna',NULL,'adrian@email.com','123456','[3,2]',1,1);


-- Stored Procedure para eliminar Empleados.
DROP PROCEDURE IF EXISTS eliminar_empleado;
DELIMITER $$
CREATE PROCEDURE eliminar_empleado(	/* Datos Persona */
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

CALL eliminar_empleado(3,'2023-04-07');