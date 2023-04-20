DROP PROCEDURE IF EXISTS buscar_empleado_id;
DELIMITER //
CREATE PROCEDURE buscar_empleado_id(
									IN p_id_empleado INT
)
BEGIN
  SELECT e.id_empleado, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal, 
         p.numero_exterior, p.numero_interior, p.calle, p.colonia, 
         rol.id_usuario, rol.correo, rol.estatus, rol.roles FROM empleado e
				INNER JOIN (SELECT id_usuario,
						correo,
						estatus,
						(SELECT JSON_ARRAYAGG(fk_rol)
							FROM rol_usuario
							WHERE fk_usuario = id_usuario)
						AS roles
					FROM usuario
					WHERE id_usuario = id_usuario
				) AS rol
                ON fk_usuario = id_usuario
                INNER JOIN persona p ON e.fk_persona = p.id_persona;
END //
DELIMITER ;
-- CALL buscar_empleado_id(2);

DROP PROCEDURE IF EXISTS buscar_cliente_id;
DELIMITER //
CREATE PROCEDURE buscar_cliente_id(IN p_id_cliente INT)
BEGIN
SELECT c.id_cliente, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal,
p.numero_exterior, p.numero_interior, p.calle, p.colonia, u.correo, u.contrasenia, u.estatus,p.id_persona,u.id_usuario
FROM cliente c
INNER JOIN persona p ON c.fk_persona = p.id_persona
INNER JOIN usuario u ON c.fk_usuario = u.id_usuario
WHERE c.id_cliente = p_id_cliente;
END //
DELIMITER ;

------------------------------------------------------
DROP PROCEDURE IF EXISTS buscar_empleado_id;
DELIMITER //
CREATE PROCEDURE buscar_empleado_id(
									IN p_id_empleado INT
)
BEGIN
  SELECT e.id_empleado, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal, 
         p.numero_exterior, p.numero_interior, p.calle, p.colonia, 
         rol.id_usuario, rol.correo, rol.estatus, rol.roles,p.id_persona,rol.id_usuario FROM empleado e
				INNER JOIN (SELECT id_usuario,
						correo,
						estatus,
						(SELECT JSON_ARRAYAGG(fk_rol)
							FROM rol_usuario
							WHERE fk_usuario = id_usuario)
						AS roles
					FROM usuario
					WHERE id_usuario = id_usuario
				) AS rol
                ON fk_usuario = id_usuario
                INNER JOIN persona p ON e.fk_persona = p.id_persona;
END //
DELIMITER ;
CALL buscar_empleado_id(2);

-- CALL buscar_cliente_id(4);

DROP PROCEDURE IF EXISTS buscar_proveedor_id;
DELIMITER //
CREATE PROCEDURE buscar_proveedor_id(IN p_id_proveedor INT)
BEGIN
  SELECT pr.id_proveedor, pr.correo, p.nombre, p.apaterno, p.amaterno, p.telefono, p.codigo_postal, 
         p.numero_exterior, p.numero_interior, p.calle, p.colonia
  FROM proveedor pr
  INNER JOIN persona p ON pr.fk_persona = p.id_persona
  WHERE pr.id_proveedor = p_id_proveedor;
END //
DELIMITER ;
-- CALL buscar_proveedor_id(3);

DROP PROCEDURE IF EXISTS buscar_receta_id;
DELIMITER //
CREATE PROCEDURE buscar_receta_id(IN p_id_receta INT)
BEGIN
  SELECT r.id_receta, r.nombre, r.cantidad, r.precio, r.ruta_imagen, CONCAT("[", GROUP_CONCAT(t1.lista_receta SEPARATOR ','), "]") AS lista_receta
  FROM receta r
  INNER JOIN (
      SELECT CONCAT("[",mp.id_materia_prima,",'", mp.nombre,"',",dmpr.cantidad,"]") AS lista_receta, dmpr.fk_receta
      FROM detalle_materia_prima_receta dmpr
      INNER JOIN materia_prima mp ON mp.id_materia_prima = dmpr.fk_materia_prima
  ) t1 ON r.id_receta = t1.fk_receta
  WHERE r.id_receta = p_id_receta
  GROUP BY r.id_receta;
END //
DELIMITER ;
-- CALL buscar_receta_id(3);

DROP PROCEDURE IF EXISTS buscar_envio_id;
DELIMITER //
CREATE PROCEDURE buscar_envio_id(IN p_id_envio INT)
BEGIN
  SELECT en.id_envio, fecha_entrega, entregado, v.total, 
		CONCAT(p1.nombre, ' ' ,p1.apaterno, ' ', p1.amaterno) AS nombre_cliente, 
		CONCAT(p1.calle, ' ', p1.colonia, ' ', p1.numero_exterior, ' ' , IFNULL(p1.numero_interior, '')) AS direccion, 
        p1.codigo_postal, p1.telefono,
        CONCAT(p2.nombre, ' ' ,p2.apaterno, ' ' ,p2.amaterno) AS nombre_empleado, p2.telefono
  FROM envio en
  INNER JOIN venta v ON en.fk_venta = v.id_venta
  INNER JOIN cliente c ON v.fk_cliente = c.id_cliente
  INNER JOIN persona p1 ON c.fk_persona = p1.id_persona
  INNER JOIN empleado e ON en.fk_empleado = e.id_empleado
  INNER JOIN persona p2 ON e.fk_persona = p2.id_persona
  
  WHERE en.id_envio = p_id_envio;
END //
DELIMITER ;
-- CALL buscar_envio_id(1);

DROP PROCEDURE IF EXISTS buscar_materia_prima_id;
DELIMITER //
CREATE PROCEDURE buscar_materia_prima_id(IN p_id_materia_prima INT)
BEGIN
  SELECT mp.id_materia_prima, mp.nombre, um.descripcion AS unidad_medida
  FROM materia_prima mp
  INNER JOIN unidad_medida um ON mp.fk_unidad_medida = um.id_unidad_medida
  WHERE id_materia_prima = p_id_materia_prima;
END //
DELIMITER ;
-- CALL buscar_materia_prima_id(3);