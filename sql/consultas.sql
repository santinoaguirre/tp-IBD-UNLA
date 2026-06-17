USE restaurante_db;

/* Todos los pedidos con mesa y mozo */
SELECT p.id, m.numero AS mesa, mo.nombre, mo.apellido, 
       p.fecha, p.hora, pe.nombre AS estado
FROM pedido p
JOIN mesa m ON p.id_mesa = m.id
JOIN mozo mo ON p.id_mozo = mo.id
JOIN pedido_estado pe ON p.id_pedido_estado = pe.id
ORDER BY p.fecha DESC, p.hora DESC;

/* Productos más solicitados */
SELECT pr.nombre, SUM(pd.cantidad) AS total_vendido
FROM pedido_detalle pd
JOIN producto pr ON pd.id_producto = pr.id
GROUP BY pr.id, pr.nombre
ORDER BY total_vendido DESC;

/* Actividad por mesa */
SELECT m.numero AS mesa, COUNT(p.id) AS cantidad_pedidos,
       SUM(pd.cantidad * pd.precio_unitario) AS total_facturado
FROM mesa m
LEFT JOIN pedido p ON m.id = p.id_mesa
LEFT JOIN pedido_detalle pd ON p.id = pd.id_pedido
GROUP BY m.id, m.numero
ORDER BY total_facturado DESC;

/* Actividad por mozo */
SELECT mo.nombre, mo.apellido, COUNT(p.id) AS pedidos_atendidos,
       SUM(pd.cantidad * pd.precio_unitario) AS total_facturado
FROM mozo mo
LEFT JOIN pedido p ON mo.id = p.id_mozo
LEFT JOIN pedido_detalle pd ON p.id = pd.id_pedido
GROUP BY mo.id, mo.nombre, mo.apellido
ORDER BY pedidos_atendidos DESC;

/* pedidos por fecha especifica */
SELECT 
    p.id AS id_pedido, 
    m.numero AS numero_mesa, 
    p.fecha, 
    p.hora, 
    pe.nombre AS estado_pedido
FROM pedido p
JOIN mesa m ON p.id_mesa = m.id
JOIN pedido_estado pe ON p.id_pedido_estado = pe.id
WHERE p.fecha = '2026-06-01';

/* Productos de una categoria especifica */
SELECT pr.nombre AS producto, pr.descripcion, pr.precio, pc.nombre AS categoria, pe.nombre AS estado
FROM producto pr
JOIN producto_categoria pc ON pr.id_producto_categoria = pc.id
JOIN producto_estado pe ON pr.id_producto_estado = pe.id
WHERE pc.nombre = 'Bebidas'; 

/* detalle completo de un pedido especifico*/
SELECT pd.id_pedido, pr.nombre AS producto,  
	pd.cantidad,  pd.precio_unitario,  (pd.cantidad * pd.precio_unitario) AS subtotal_item, pd.observaciones
FROM pedido_detalle pd
JOIN producto pr ON pd.id_producto = pr.id
WHERE pd.id_pedido = 1;  											

/* ticket promedio por mesa */
SELECT  m.numero AS mesa, COUNT(DISTINCT p.id) AS cantidad_pedidos, SUM(pd.cantidad * pd.precio_unitario) AS total_facturado,
    (SUM(pd.cantidad * pd.precio_unitario) / COUNT(DISTINCT p.id)) AS ticket_promedio
FROM mesa m
JOIN pedido p ON m.id = p.id_mesa
JOIN pedido_detalle pd ON p.id = pd.id_pedido
GROUP BY m.id, m.numero
ORDER BY ticket_promedio DESC;
