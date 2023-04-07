USE gelatos;

-- Stored Procedure para insertar nuevos Empleados.
DROP PROCEDURE IF EXISTS insertar_empleado;
DELIMITER $$
CREATE PROCEDURE insertar_empleado(	/* Datos Personales */
                                    IN	nombre          VARCHAR(50),     -- 1
                                    IN  apaterno		VARCHAR(50),	 -- 2
                                    IN  amaterno		VARCHAR(50),	 -- 3
                                    IN	telefono 		VARCHAR(10),     -- 4
                                    IN  codigo_postal   VARCHAR(6),      -- 5
                                    IN	numero_interior INT,   			 -- 6
                                    IN	numero_exterior INT,   			 -- 7
                                    IN	calle       	VARCHAR(255),    -- 8
                                    IN	colonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	correo   		VARCHAR(100),    -- 11
                                    IN	contrasenia     VARCHAR(100),    -- 12
                                    
                                    /* Datos de Empleado */
                                    IN estatus			INT,			 -- 10
                                    IN fecha_creacion   DATETIME,        -- 13
                                    
                                    /* Valores de Retorno */
                                    OUT	id_persona       INT,           -- 14
                                    OUT	id_usuario       INT,           -- 15
                                    OUT	id_empleado      INT            -- 16
				)                                    
    BEGIN        
	
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, numero_exterior, calle, colonia) 
					 VALUES ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, numero_exterior,  calle, colonia);
        -- Obtenemos el ID de Persona que se generó:
        SET id_persona = LAST_INSERT_ID();

        -- Insertamos los datos de seguridad del Empleado:
        INSERT INTO usuario  (correo, contrasenia) VALUES(correo, contrasenia);
        -- Obtenemos el ID de Usuario que se generó:
        SET id_usuario = LAST_INSERT_ID();

       
        -- Insertamos en la tabla Empleado:
        -- INSERT INTO empleado (fk_persona, fk_usuario) VALUES(id_persona, id_usuario);
        INSERT INTO empleado (estatus, fecha_creacion, fk_persona, fk_usuario) VALUES(1, fecha_creacion, id_persona, id_usuario);
        -- Obtenemos el ID del Empleado que se generó:
        SET id_empleado = LAST_INSERT_ID();
    END
$$
DELIMITER ;

CALL insertar_empleado('Luis Adrián', 'Hernández','Sánchez','4771234567','37287',538, NULL,'Elefante esa, Via Palatino','Villa Magna','adrian@email.com','12345',1,NULL,@id_persona, @id_usuario,@id_empleado);
SELECT @id_persona;


-- Stored Procedure para actualizar Empleados.
DROP PROCEDURE IF EXISTS actualizar_empleado;
DELIMITER $$
CREATE PROCEDURE actualizar_empleado(	/* Datos Personales */
                                    IN	nombre          VARCHAR(50),     -- 1
                                    IN  apaterno		VARCHAR(50),	 -- 2
                                    IN  amaterno		VARCHAR(50),	 -- 3
                                    IN	telefono 		VARCHAR(10),     -- 4
                                    IN  codigo_postal   VARCHAR(6),      -- 5
                                    IN	numero_interior INT,   			 -- 6
                                    IN	numero_exterior INT,   			 -- 7
                                    IN	calle       	VARCHAR(255),    -- 8
                                    IN	colonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	correo   		VARCHAR(100),    -- 10
                                    IN	contrasenia     VARCHAR(100),    -- 11
                                    
                                    /* Datos de Empleado */
                                    IN  estatus			INT,			 -- 12
                                    IN fecha_actualizacion DATETIME,     -- 13
                                    
                                    /* ID's de las tablas relacionadas con el Empleado */
                                    IN	id_persona       INT,            -- 14
                                    IN	id_usuario       INT,            -- 15
                                    IN	id_empleado      INT             -- 16
				)                                    
    BEGIN        
	 -- Datos Persona del Empleado:
        UPDATE persona  SET     nombre = nombre,
								apaterno = apaterno,
                                amaterno = amaterno,
                                telefono = telefono,
                                codigo_postal = codigo_postal,
                                numero_interior = numero_interior,
                                numero_exterior = numero_exterior,
                                calle = calle, 
                                colonia = colonia
                        WHERE   id_persona = id_persona;

        -- Actualizamos los datos de Seguridad:
        UPDATE usuario  SET     correo = correo,
                                contrasenia = contrasenia
                        WHERE   id_usuario = id_usuario;

        -- Actualizamos los datos de Empleado:
        UPDATE empleado SET     estatus = 1,
								fecha_actualizacion = fecha_actualizacion
                        WHERE   id_empleado = id_empleado;        
    END
$$
DELIMITER ;

CALL actualizar_empleado('Adrián','Hernández','Sánchez','4771234567','37287',110,NULL,'Elefante esa','Villa Magna','adrian@email.com','123456',1,NULL,1,1,1);
SELECT @id_persona;

-- Stored Procedure para eliminar Empleados.
DROP PROCEDURE IF EXISTS eliminar_empleado;
DELIMITER $$
CREATE PROCEDURE eliminar_empleado(	/* Datos Persona */
									IN id_empleado INT
				)
	BEGIN
		UPDATE empleado SET estatus = 0 
        WHERE id_empleado=id_empleado;
    END
$$
DELIMITER ;

CALL eliminar_empleado(1);

-- Stored Procedure para insertar nuevos Clientes.
DROP PROCEDURE IF EXISTS insertar_cliente;
DELIMITER $$
CREATE PROCEDURE insertar_cliente(	/* Datos Personales */
                                    IN	nombre          VARCHAR(50),     -- 1
                                    IN  apaterno		VARCHAR(50),	 -- 2
                                    IN  amaterno		VARCHAR(50),	 -- 3
                                    IN	telefono 		VARCHAR(10),     -- 4
                                    IN  codigo_postal   VARCHAR(6),      -- 5
                                    IN	numero_interior INT,   			 -- 6
                                    IN	numero_exterior INT,   			 -- 7
                                    IN	calle       	VARCHAR(255),    -- 8
                                    IN	colonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	correo   		VARCHAR(100),    -- 10
                                    IN	contrasenia     VARCHAR(100),    -- 11
                                    
                                    /* Datos de Cliente */
                                    IN  estatus			INT,			 -- 12
                                    IN fecha_creacion 	DATETIME,        -- 13
                                    
                                    /* Valores de Retorno */
                                    OUT	id_persona       INT,           -- 14
                                    OUT	id_usuario       INT,           -- 15
                                    OUT	id_cliente       INT            -- 16
				)                                    
    BEGIN        
	
        -- Insertando los datos de la Persona:
        INSERT INTO persona ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, numero_exterior, calle, colonia) 
					 VALUES ( nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, numero_exterior,  calle, colonia);
        -- Obtenemos el ID de Persona que se generó:
        SET id_persona = LAST_INSERT_ID();

        -- Insertamos los datos de seguridad del Empleado:
        INSERT INTO usuario  (correo, contrasenia) VALUES(correo, contrasenia);
        -- Obtenemos el ID de Usuario que se generó:
        SET id_usuario = LAST_INSERT_ID();

       
        -- Insertamos en la tabla Cliente:
        INSERT INTO cliente (estatus, fecha_creacion, fk_persona, fk_usuario) 
					 VALUES (1, fecha_creacion, id_persona, id_usuario);
        -- Obtenemos el ID del Cliente que se generó:
        SET id_cliente = LAST_INSERT_ID();
    END
$$
DELIMITER ;

CALL insertar_cliente('Marian', 'Sánchez','','4771234589','37287',530, NULL,'Via Palatino','Villa Magna','maria@email.com','123456',1,NULL,@id_persona, @id_usuario,@id_empleado);
SELECT @id_persona;


-- Stored Procedure para actualizar Empleados.
DROP PROCEDURE IF EXISTS actualizar_cliente;
DELIMITER $$
CREATE PROCEDURE actualizar_cliente(	/* Datos Personales */
                                    IN	nombre          VARCHAR(50),     -- 1
                                    IN  apaterno		VARCHAR(50),	 -- 2
                                    IN  amaterno		VARCHAR(50),	 -- 3
                                    IN	telefono 		VARCHAR(10),     -- 4
                                    IN  codigo_postal   VARCHAR(6),      -- 5
                                    IN	numero_interior INT,   			 -- 6
                                    IN	numero_exterior INT,   			 -- 7
                                    IN	calle       	VARCHAR(255),    -- 8
                                    IN	colonia         VARCHAR(100),    -- 9
                                    
                                    /* Datos de Usuario */
                                    IN	correo   		VARCHAR(100),    -- 10
                                    IN	contrasenia     VARCHAR(100),    -- 11
                                    
                                    /* Datos de Empleado */
                                    IN  estatus			INT,			 -- 12
                                    IN fecha_actualizacion DATETIME,     -- 13
                                    
                                    /* ID's de las tablas relacionadas con el Empleado */
                                    IN	id_persona       INT,            -- 14
                                    IN	id_usuario       INT,            -- 15
                                    IN	id_empleado      INT             -- 16
				)                                    
    BEGIN        
	 -- Datos Persona del Empleado:
        UPDATE persona  SET     nombre = nombre,
								apaterno = apaterno,
                                amaterno = amaterno,
                                telefono = telefono,
                                codigo_postal = codigo_postal,
                                numero_interior = numero_interior,
                                numero_exterior = numero_exterior,
                                calle = calle, 
                                colonia = colonia
                        WHERE   id_persona = id_persona;

        -- Actualizamos los datos de Seguridad:
        UPDATE usuario  SET     correo = correo,
                                contrasenia = contrasenia
                        WHERE   id_usuario = id_usuario;

        -- Actualizamos los datos de Empleado:
        UPDATE empleado SET     estatus = 1,
								fecha_actualizacion = fecha_actualizacion
                        WHERE   id_empleado = id_empleado;        
    END
$$
DELIMITER ;

-- Stored Procedure para eliminar Clientes.
DROP PROCEDURE IF EXISTS eliminar_cliente;
DELIMITER $$
CREATE PROCEDURE eliminar_cliente(	/* Datos Persona */
									IN id_cliente INT
				)
	BEGIN
		UPDATE cliente SET estatus = 0 
        WHERE id_cliente=id_cliente;
    END
$$
DELIMITER ;

CALL eliminar_cliente(0);
