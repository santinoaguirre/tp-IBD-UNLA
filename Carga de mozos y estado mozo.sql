USE restaurante_db;

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

-- ROLLBACK 
COMMIT;

SELECT COUNT(*) AS cantidad_mozos FROM mozo;