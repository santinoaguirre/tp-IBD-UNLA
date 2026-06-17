USE restaurante_db;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE pedido_detalle;
TRUNCATE TABLE pedido;
TRUNCATE TABLE producto;
TRUNCATE TABLE mesa;
TRUNCATE TABLE mozo;
TRUNCATE TABLE pedido_estado;
TRUNCATE TABLE producto_estado;
TRUNCATE TABLE producto_categoria;
TRUNCATE TABLE mesa_ubicacion;
TRUNCATE TABLE mesa_estado;
TRUNCATE TABLE mozo_estado;
SET FOREIGN_KEY_CHECKS = 1;

START TRANSACTION;

-- =========================
-- ESTADOS DE MOZO
-- =========================

INSERT INTO mozo_estado (id, nombre, descripcion) VALUES
(1, 'Activo', 'Mozo disponible para atender pedidos'),
(2, 'Inactivo', 'Mozo dado de baja o no disponible'),
(3, 'Licencia', 'Mozo temporalmente ausente');

-- =========================
-- MOZOS
-- =========================

INSERT INTO mozo (id, nombre, apellido, email, fecha_ingreso, id_mozo_estado) VALUES
(1, 'Juan', 'Perez', 'juan.perez@restaurante.com', '2024-03-10', 1),
(2, 'Sofia', 'Gomez', 'sofia.gomez@restaurante.com', '2023-08-15', 1),
(3, 'Martin', 'Lopez', 'martin.lopez@restaurante.com', '2025-01-20', 1),
(4, 'Camila', 'Fernandez', 'camila.fernandez@restaurante.com', '2022-11-05', 1),
(5, 'Lucas', 'Romero', 'lucas.romero@restaurante.com', '2021-06-12', 3);

-- =========================
-- ESTADOS DE MESA
-- =========================

INSERT INTO mesa_estado (id, nombre, descripcion) VALUES
(1, 'Libre', 'Mesa disponible para ser ocupada'),
(2, 'Ocupada', 'Mesa actualmente en uso'),
(3, 'Reservada', 'Mesa reservada por un cliente'),
(4, 'Inactiva', 'Mesa fuera de servicio');

-- =========================
-- UBICACIONES DE MESA
-- =========================

INSERT INTO mesa_ubicacion (id, nombre, descripcion) VALUES
(1, 'Salon principal', 'Sector principal del restaurante'),
(2, 'Ventana', 'Mesas ubicadas cerca de la ventana'),
(3, 'Patio', 'Sector externo del restaurante'),
(4, 'Terraza', 'Sector de terraza'),
(5, 'Exterior', 'Mesas ubicadas en la vereda o espacio exterior');

-- =========================
-- MESAS
-- =========================

INSERT INTO mesa (id, numero, capacidad, id_mesa_ubicacion, id_mesa_estado) VALUES
(1, 1, 2, 1, 1),
(2, 2, 4, 1, 2),
(3, 3, 4, 2, 1),
(4, 4, 6, 1, 2),
(5, 5, 2, 3, 3),
(6, 6, 8, 3, 1),
(7, 7, 4, 4, 1),
(8, 8, 6, 1, 4);

-- =========================
-- CATEGORIAS DE PRODUCTO
-- =========================

INSERT INTO producto_categoria (id, nombre, descripcion) VALUES
(1, 'Entradas', 'Platos pequeños para iniciar la comida'),
(2, 'Platos principales', 'Comidas principales del menu'),
(3, 'Bebidas', 'Bebidas frias sin alcohol'),
(4, 'Postres', 'Opciones dulces para finalizar la comida'),
(5, 'Cafeteria', 'Cafe, te e infusiones');

-- =========================
-- ESTADOS DE PRODUCTO
-- =========================

INSERT INTO producto_estado (id, nombre, descripcion) VALUES
(1, 'Disponible', 'Producto disponible para la venta'),
(2, 'No disponible', 'Producto temporalmente no disponible'),
(3, 'Sin stock', 'Producto sin stock');

-- =========================
-- PRODUCTOS
-- =========================

INSERT INTO producto (id, id_producto_categoria, id_producto_estado, nombre, descripcion, precio) VALUES
(1, 1, 1, 'Empanada de carne', 'Empanada al horno de carne cortada a cuchillo', 1200.00),
(2, 1, 1, 'Papas fritas', 'Porcion de papas fritas clasicas', 3500.00),
(3, 1, 1, 'Rabas', 'Porcion de rabas con limon', 7200.00),

(4, 2, 1, 'Milanesa con papas', 'Milanesa de carne con guarnicion de papas fritas', 8500.00),
(5, 2, 1, 'Hamburguesa clasica', 'Hamburguesa con queso, lechuga y tomate', 7800.00),
(6, 2, 1, 'Pizza muzzarella', 'Pizza grande de muzzarella', 9000.00),
(7, 2, 1, 'Ensalada Caesar', 'Ensalada con pollo, croutones y aderezo Caesar', 6200.00),
(8, 2, 3, 'Ravioles de verdura', 'Pasta rellena con salsa a eleccion', 7600.00),

(9, 3, 1, 'Agua mineral', 'Botella de agua mineral 500ml', 1800.00),
(10, 3, 1, 'Gaseosa', 'Gaseosa linea tradicional 500ml', 2200.00),
(11, 3, 1, 'Limonada', 'Limonada natural con menta y jengibre', 3000.00),
(12, 3, 2, 'Jugo exprimido', 'Jugo natural de naranja', 2800.00),

(13, 4, 1, 'Flan casero', 'Flan con crema o dulce de leche', 3200.00),
(14, 4, 1, 'Helado', 'Dos bochas de helado a eleccion', 3500.00),
(15, 4, 1, 'Brownie', 'Brownie tibio con salsa de chocolate', 4000.00),

(16, 5, 1, 'Cafe', 'Cafe espresso', 1800.00),
(17, 5, 1, 'Cafe con leche', 'Cafe con leche en taza grande', 2500.00),
(18, 5, 1, 'Te', 'Infusion a eleccion', 1600.00);

-- =========================
-- ESTADOS DE PEDIDO
-- =========================

INSERT INTO pedido_estado (id, nombre, descripcion) VALUES
(1, 'Pendiente', 'Pedido registrado pero todavia no preparado'),
(2, 'En preparacion', 'Pedido en proceso de preparacion'),
(3, 'Entregado', 'Pedido entregado al cliente'),
(4, 'Cancelado', 'Pedido cancelado');

-- =========================
-- PEDIDOS
-- =========================

INSERT INTO pedido (id, id_mesa, id_mozo, id_pedido_estado, fecha, hora) VALUES
(1, 1, 1, 3, '2026-06-01', '12:30:00'),
(2, 2, 2, 3, '2026-06-01', '13:10:00'),
(3, 3, 1, 4, '2026-06-01', '14:00:00'),
(4, 4, 3, 2, '2026-06-02', '12:45:00'),
(5, 5, 4, 1, '2026-06-02', '13:20:00'),
(6, 1, 2, 3, '2026-06-02', '21:15:00'),
(7, 6, 3, 3, '2026-06-03', '20:30:00'),
(8, 7, 4, 3, '2026-06-03', '21:00:00'),
(9, 2, 1, 3, '2026-06-04', '12:15:00'),
(10, 4, 2, 2, '2026-06-04', '13:40:00'),
(11, 3, 3, 3, '2026-06-05', '20:10:00'),
(12, 6, 4, 1, '2026-06-05', '21:25:00');

-- =========================
-- DETALLE DE PEDIDOS
-- =========================

INSERT INTO pedido_detalle (id, id_pedido, id_producto, cantidad, precio_unitario, observaciones) VALUES
(1, 1, 4, 2, 8500.00, 'Una milanesa sin sal'),
(2, 1, 9, 2, 1800.00, NULL),
(3, 1, 13, 1, 3200.00, 'Con dulce de leche'),

(4, 2, 6, 1, 9000.00, NULL),
(5, 2, 10, 2, 2200.00, 'Bien fria'),
(6, 2, 15, 1, 4000.00, NULL),

(7, 3, 5, 1, 7800.00, 'Pedido cancelado por el cliente'),
(8, 3, 11, 1, 3000.00, 'Pedido cancelado por el cliente'),

(9, 4, 2, 2, 3500.00, 'Con cheddar aparte'),
(10, 4, 5, 2, 7800.00, 'Sin cebolla'),
(11, 4, 10, 2, 2200.00, NULL),

(12, 5, 1, 4, 1200.00, 'Dos de carne picante'),
(13, 5, 11, 2, 3000.00, NULL),

(14, 6, 7, 1, 6200.00, 'Sin croutones'),
(15, 6, 9, 1, 1800.00, NULL),
(16, 6, 14, 1, 3500.00, NULL),

(17, 7, 3, 1, 7200.00, NULL),
(18, 7, 4, 2, 8500.00, NULL),
(19, 7, 10, 3, 2200.00, NULL),
(20, 7, 16, 2, 1800.00, NULL),

(21, 8, 6, 2, 9000.00, 'Una pizza sin aceitunas'),
(22, 8, 11, 2, 3000.00, NULL),
(23, 8, 15, 2, 4000.00, 'Calentar antes de servir'),

(24, 9, 4, 1, 8500.00, NULL),
(25, 9, 5, 1, 7800.00, 'Completa'),
(26, 9, 9, 2, 1800.00, NULL),

(27, 10, 1, 6, 1200.00, NULL),
(28, 10, 2, 1, 3500.00, NULL),
(29, 10, 10, 4, 2200.00, NULL),

(30, 11, 7, 2, 6200.00, NULL),
(31, 11, 11, 2, 3000.00, NULL),
(32, 11, 17, 2, 2500.00, NULL),

(33, 12, 3, 1, 7200.00, NULL),
(34, 12, 6, 1, 9000.00, NULL),
(35, 12, 13, 2, 3200.00, NULL);

-- ROLLBACK 
COMMIT;

SELECT COUNT(*) AS cantidad_mozos FROM mozo;
SELECT COUNT(*) AS cantidad_mesas FROM mesa;
SELECT COUNT(*) AS cantidad_productos FROM producto;
SELECT COUNT(*) AS cantidad_pedidos FROM pedido;
SELECT COUNT(*) AS cantidad_detalles FROM pedido_detalle;
