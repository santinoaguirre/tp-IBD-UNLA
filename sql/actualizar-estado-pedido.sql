USE restaurante_db;

-- Cambiar estado de un pedido de 'Abierto' a 'Cerrado'
UPDATE pedido
SET id_pedido_estado = (SELECT id FROM pedido_estado WHERE nombre = 'Cerrado')
WHERE id = 1;

-- Verificación
SELECT p.id, pe.nombre AS estado, p.fecha, p.hora
FROM pedido p
JOIN pedido_estado pe ON p.id_pedido_estado = pe.id
WHERE p.id = 1;