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

