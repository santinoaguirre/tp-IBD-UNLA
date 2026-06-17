USE restaurante_db;

-- Eliminamos los detalles de pedido que hacen referencia al producto
DELETE FROM pedido_detalle
WHERE id_producto = (SELECT id FROM producto WHERE nombre = 'Gaseosa');

-- Eliminamos el producto
DELETE FROM producto
WHERE nombre = 'Gaseosa';

-- Verificación
SELECT * FROM producto WHERE nombre = 'Gaseosa';
