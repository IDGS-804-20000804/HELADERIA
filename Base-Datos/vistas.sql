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
    persona p ON e.fk_persona = p.id_persona
WHERE  p.estatus = 1;

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
    persona p ON c.fk_persona = p.id_persona
WHERE  p.estatus = 1;
    
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
    persona p ON pr.fk_persona = p.id_persona
WHERE  p.estatus = 1;

DROP VIEW IF EXISTS vista_receta;
CREATE VIEW vista_receta AS
SELECT 
    id_receta,
    nombre,
    cantidad,
    precio,
    ruta_imagen,
    estatus
  FROM receta
WHERE estatus=1;

DROP VIEW IF EXISTS vista_envio;
CREATE VIEW vista_envio AS
SELECT 
	en.id_envio,
    en.entregado,
    v.total,
    p1.nombre AS nombre_cliente,
    p1.apaterno AS apaterno_cliente,
    p1.amaterno AS amaterno_cliente,
    p1.calle,
    p1.colonia,
    p1.numero_exterior,
    IFNULL(p1.numero_interior, ''),
    p1.codigo_postal,
    p1.telefono,
    p2.nombre AS nombre_empleado,
    p2.apaterno AS apaterno_empleado,
    p2.amaterno AS amaterno_empleado,
    p2.telefono AS telefono_repartidor
	FROM envio en
    INNER JOIN venta v ON en.fk_venta = v.id_venta
    INNER JOIN cliente c ON v.fk_cliente = c.id_cliente
    INNER JOIN persona p1 ON c.fk_persona = p1.id_persona
    INNER JOIN empleado e ON en.fk_empleado = e.id_empleado
    INNER JOIN persona p2 ON e.fk_persona = p2.id_persona;

DROP VIEW IF EXISTS vista_envio_cargada;
CREATE VIEW vista_envio_cargada AS
SELECT en.id_envio, en.entregado, t1.*, t2.*, DATE(en.fecha_actualizacion) FROM envio en
	INNER JOIN (SELECT v.id_venta,
				v.total,
				c.id_cliente,
				p.id_persona AS id_persona_cliente,
                p.nombre AS nombre_cliente,
                p.apaterno AS apaterno_cliente,
				p.amaterno AS amaterno_cliente,
                p.telefono AS telefono_cliente,
                p.codigo_postal AS codigo_postal_cliente,
				p.numero_exterior AS numero_exterior_cliente,
                p.numero_interior AS numero_interior_cliente,
                p.calle AS calle_cliente,
				p.colonia AS colonia_cliente
		FROM venta v
		INNER JOIN cliente c
			ON fk_cliente = id_cliente
		INNER JOIN persona p
			ON fk_persona = id_persona) t1
		ON t1.id_venta = en.fk_venta
	LEFT JOIN (SELECT id_empleado,
				id_persona AS id_persona_empleado,
                nombre AS id_nombre_empleado,
				apaterno AS apaterno_empleado,
                amaterno AS amaterno_empleado,
                telefono AS telefono_empleado,
                codigo_postal AS codigo_postal_empleado,
				numero_exterior AS numero_exterior_empleado,
                numero_interior AS numero_interior_empleado,
                calle AS calle_empleado,
                colonia AS colonia_empleado
		FROM empleado em
		INNER JOIN persona p
		ON em.fk_persona = p.id_persona) t2
		ON en.fk_empleado = t2.id_empleado
		ORDER BY entregado, id_envio;



DROP VIEW IF EXISTS vista_envio_entregado;
CREATE VIEW vista_envio_entregado AS
SELECT 
	en.id_envio,
    en.entregado,
    v.total,
    p1.nombre AS nombre_cliente,
    p1.apaterno AS apaterno_cliente,
    p1.amaterno AS amaterno_cliente,
    p1.calle,
    p1.colonia,
    p1.numero_exterior,
    IFNULL(p1.numero_interior, ''),
    p1.codigo_postal,
    p1.telefono,
    p2.nombre AS nombre_empleado,
    p2.apaterno AS apaterno_empleado,
    p2.amaterno AS amaterno_empleado,
    p2.telefono AS telefono_repartidor
	FROM envio en
    INNER JOIN venta v ON en.fk_venta = v.id_venta
    INNER JOIN cliente c ON v.fk_cliente = c.id_cliente
    INNER JOIN persona p1 ON c.fk_persona = p1.id_persona
    INNER JOIN empleado e ON en.fk_empleado = e.id_empleado
    INNER JOIN persona p2 ON e.fk_persona = p2.id_persona
    WHERE en.entregado=TRUE;


DROP VIEW IF EXISTS vista_materia_prima;
CREATE VIEW vista_materia_prima AS
SELECT 
	mp.id_materia_prima,
    mp.nombre,
    mp.estatus,
    um.descripcion AS unidad_medida
  FROM materia_prima mp
  INNER JOIN unidad_medida um ON mp.fk_unidad_medida = um.id_unidad_medida
  WHERE mp.estatus = 1;

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
					ORDER BY a.caducidad
				) AS t) AS t2
                ON fk_materia_prima = id_materia_prima
                INNER JOIN unidad_medida
                ON fk_unidad_medida = id_unidad_medida;


DROP VIEW IF EXISTS stock_en_venta;
CREATE VIEW stock_en_venta AS
SELECT id_receta, nombre, ruta_imagen, stock_usable, t1.precio FROM receta r INNER JOIN
	(SELECT SUM((cantidad - IFNULL(stock_usado, 0))) AS stock_usable, precio, fk_receta
	FROM (SELECT id_stock, caducidad, cantidad, precio, estatus, fk_receta FROM stock) AS s
	LEFT JOIN (SELECT SUM(cantidad) AS stock_usado, fk_stock FROM detalle_venta GROUP BY fk_stock) AS dv
		ON fk_stock = id_stock
	WHERE s.estatus = TRUE
	AND DATE(s.caducidad) > DATE(NOW())
	AND (cantidad - IFNULL(stock_usado, 0)) > 0
    GROUP BY precio, fk_receta) AS t1
    ON r.id_receta = t1.fk_receta;


DROP VIEW IF EXISTS vista_cargada_compra;
CREATE VIEW vista_cargada_compra AS
SELECT id_compra, total, t1.*, t2.*, t3.*
	FROM compra c
    INNER JOIN (SELECT pro.id_proveedor,
		pro.correo AS correo_proveedor,
        per.id_persona AS id_persona_proveedor,
        per.nombre AS nombre_proveedor,
        per.apaterno AS apaterno_proveedor,
        per.amaterno AS amaterno_proveedor,
        per.telefono AS tel_proveedor,
        per.codigo_postal AS cp_proveedor,
        per.numero_exterior AS numext_proveedor,
        per.numero_interior AS numint_proveedor,
        per.calle AS calle_proveedor,
        per.colonia AS colonia_proveedor
	FROM proveedor pro
	INNER JOIN persona per
		ON per.id_persona = pro.fk_persona) t1
	ON c.fk_proveedor = t1.id_proveedor
    INNER JOIN (SELECT em.id_empleado,
        per.id_persona AS id_persona_empleado,
        per.nombre AS nombre_empleado,
        per.apaterno AS apaterno_empleado,
        per.amaterno AS amaterno_empleado,
        per.telefono AS tel_empleado,
        per.codigo_postal AS cp_empleado,
        per.numero_exterior AS numext_empleado,
        per.numero_interior AS numint_empleado,
        per.calle AS calle_empleado,
        per.colonia AS colonia_empleado,
        u.id_usuario,
        u.correo AS correo_empleado
	FROM empleado em
	INNER JOIN persona per
		ON per.id_persona = em.fk_persona
	INNER JOIN usuario u
		ON u.id_usuario = em.fk_usuario) t2
        ON c.fk_empleado = t2.id_empleado
	INNER JOIN (SELECT dc.cantidad, dc.precio, a.caducidad, mp.nombre, um.descripcion, fk_compra FROM detalle_compra dc
	INNER JOIN almacen a
		ON dc.fk_almacen = a.id_almacen
	INNER JOIN materia_prima mp
		ON mp.id_materia_prima = a.fk_materia_prima
	INNER JOIN unidad_medida um
		ON um.id_unidad_medida = mp.fk_unidad_medida) t3
        ON c.id_compra = t3.fk_compra;