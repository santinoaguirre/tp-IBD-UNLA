USE restaurante_db;

-- Guardamos el id del producto a eliminar.
-- Damos de baja por la PK (id) para evitar el error 1175 del modo
-- "safe update" de MySQL Workbench, que bloquea borrados cuyo WHERE
-- no usa una columna clave (nombre no lo es).
SET @id_producto = (SELECT id FROM producto WHERE nombre = 'Gaseosa');

-- Eliminamos los detalles de pedido que hacen referencia al producto
DELETE FROM pedido_detalle
WHERE id_producto = @id_producto;

-- Eliminamos el producto
DELETE FROM producto
WHERE id = @id_producto;

-- Verificación
SELECT * FROM producto WHERE id = @id_producto;
