USE gelatos;
DROP VIEW IF EXISTS vista_empleado;
CREATE VIEW vista_empleado AS
SELECT 
    e.id_empleado, 
    e.fk_usuario,
    e.fk_persona,
    u.correo, 
    p.estatus, 
    p.nombre, 
    p.apaterno, 
    p.amaterno, 
    p.telefono, 
    p.codigo_postal, 
    p.numero_exterior, 
    p.numero_interior, 
    p.calle, 
    p.colonia
FROM 
    empleado e
INNER JOIN 
    usuario u ON e.fk_usuario = u.id_usuario
INNER JOIN 
    persona p ON e.fk_persona = p.id_persona;
    
DROP VIEW IF EXISTS vista_cliente;
CREATE VIEW vista_cliente AS
SELECT 
    c.id_cliente, 
    c.fk_usuario,
    c.fk_persona,
    u.correo, 
    p.estatus, 
    p.nombre, 
    p.apaterno, 
    p.amaterno, 
    p.telefono, 
    p.codigo_postal, 
    p.numero_exterior, 
    p.numero_interior, 
    p.calle, 
    p.colonia
FROM 
    cliente c
INNER JOIN 
    usuario u ON c.fk_usuario = u.id_usuario
INNER JOIN 
    persona p ON c.fk_persona = p.id_persona;
    
    
DROP VIEW IF EXISTS vista_proveedor;
CREATE VIEW vista_proveedor AS
SELECT 
    pr.id_proveedor, 
    pr.fk_persona,
    pr.correo,
    p.nombre, 
    p.apaterno, 
    p.amaterno, 
    p.telefono, 
    p.codigo_postal, 
    p.numero_exterior, 
    p.numero_interior, 
    p.calle, 
    p.colonia
FROM 
    proveedor pr
INNER JOIN 
    persona p ON pr.fk_persona = p.id_persona;
    
DROP VIEW IF EXISTS vista_receta;
CREATE VIEW vista_receta AS
SELECT 
    id_receta, 
    nombre, 
    cantidad, 
    precio, 
    ruta_imagen
  FROM receta;
  
DROP VIEW IF EXISTS vista_envio;
CREATE VIEW vista_envio AS
SELECT 
    en.id_envio, 
    en.fecha_entrega, 
    en.entregado, 
    v.total, 
	CONCAT(p1.nombre, ' ' ,p1.apaterno, ' ', p1.amaterno) AS nombre_cliente, 
	CONCAT(p1.calle, ' ', p1.colonia, ' ', p1.numero_exterior, ' ' , IFNULL(p1.numero_interior, '')) AS direccion, 
	p1.codigo_postal, 
    p1.telefono,
	CONCAT(p2.nombre, ' ' ,p2.apaterno, ' ' ,p2.amaterno) AS nombre_empleado, 
    p2.telefono AS telefono_repartidor
  FROM envio en
  INNER JOIN venta v ON en.fk_venta = v.id_venta
  INNER JOIN cliente c ON v.fk_cliente = c.id_cliente
  INNER JOIN persona p1 ON c.fk_persona = p1.id_persona
  INNER JOIN empleado e ON en.fk_empleado = e.id_empleado
  INNER JOIN persona p2 ON e.fk_persona = p2.id_persona;
  
DROP VIEW IF EXISTS vista_materia_prima;
CREATE VIEW vista_materia_prima AS
SELECT 
	mp.id_materia_prima, 
    mp.nombre, 
    um.descripcion AS unidad_medida
  FROM materia_prima mp
  INNER JOIN unidad_medida um ON mp.fk_unidad_medida = um.id_unidad_medida;

  -- Vista clientes
  DROP VIEW vista_cliente;
CREATE VIEW vista_cliente AS
SELECT 
    c.id_cliente, 
    c.fk_persona,
	c.fk_usuario,
    u.correo, 
    u.estatus, 
    p.nombre, 
    p.apaterno, 
    p.amaterno, 
    p.telefono, 
    p.codigo_postal, 
    p.numero_exterior, 
    p.numero_interior, 
    p.calle, 
    p.colonia
FROM 
    cliente c
JOIN 
    usuario u ON c.fk_usuario = u.id_usuario
JOIN 
    persona p ON c.fk_persona = p.id_persona;


-- ALMACEN
DROP VIEW IF EXISTS vista_almacen;
CREATE VIEW vista_almacen AS
SELECT id_materia_prima, nombre, cantidad_usable, descripcion AS unidad_medida, caducidad FROM materia_prima
				INNER JOIN (SELECT 
					fk_materia_prima, 
					CASE WHEN cantidad_total IS NULL THEN cantidad ELSE cantidad_total END AS cantidad_usable,
					caducidad
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
                ON fk_materia_prima = id_materia_prima
                INNER JOIN unidad_medida
                ON fk_unidad_medida = id_unidad_medida;