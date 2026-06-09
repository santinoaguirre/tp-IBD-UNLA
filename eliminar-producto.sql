USE restaurante_db;

-- Eliminamos los detalles de pedido que hacen referencia al producto
DELETE FROM pedido_detalle
WHERE id_producto = (SELECT id FROM producto WHERE nombre = 'Coca Cola');

-- Eliminamos el producto
DELETE FROM producto
WHERE nombre = 'Coca Cola';

-- Verificación
SELECT * FROM producto WHERE nombre = 'Coca Cola';