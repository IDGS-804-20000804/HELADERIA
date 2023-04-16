USE gelatos;

DELIMITER //
CREATE PROCEDURE obtener_info_usuario(IN iid_usuario INT )
BEGIN
	SELECT id_usuario,
		correo,
		contrasenia,
		estatus,
		(SELECT JSON_ARRAYAGG(fk_rol)
			FROM rol_usuario
			WHERE fk_usuario = iid_usuario)
		AS roles
	FROM usuario
	WHERE id_usuario = iid_usuario;
END //
DELIMITER ;