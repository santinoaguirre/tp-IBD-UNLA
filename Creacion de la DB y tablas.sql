CREATE DATABASE IF NOT EXISTS restaurante_db;

USE restaurante_db;

-- =========================
-- ESTADOS DE MOZO
-- =========================

CREATE TABLE mozo_estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

-- =========================
-- MOZO
-- =========================

CREATE TABLE mozo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    fecha_ingreso DATE NOT NULL,
    id_mozo_estado INT NOT NULL,

    FOREIGN KEY (id_mozo_estado) REFERENCES mozo_estado(id)
);

-- =========================
-- ESTADOS DE MESA
-- =========================

CREATE TABLE mesa_estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

-- =========================
-- UBICACIONES DE MESA
-- =========================

CREATE TABLE mesa_ubicacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

-- =========================
-- MESAS
-- =========================

CREATE TABLE mesa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    capacidad INT NOT NULL,
    id_mesa_ubicacion INT NOT NULL,
    id_mesa_estado INT NOT NULL,

    FOREIGN KEY (id_mesa_ubicacion) REFERENCES mesa_ubicacion(id),
    FOREIGN KEY (id_mesa_estado) REFERENCES mesa_estado(id)
);

-- =========================
-- CATEGORIAS DE PRODUCTO
-- =========================

CREATE TABLE producto_categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

-- =========================
-- ESTADOS DE PRODUCTO
-- =========================

CREATE TABLE producto_estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

-- =========================
-- PRODUCTOS
-- =========================

CREATE TABLE producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto_categoria INT NOT NULL,
    id_producto_estado INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500),
    precio DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_producto_categoria) REFERENCES producto_categoria(id),
    FOREIGN KEY (id_producto_estado) REFERENCES producto_estado(id)
);

-- =========================
-- ESTADOS DE PEDIDO
-- =========================

CREATE TABLE pedido_estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

-- =========================
-- PEDIDOS
-- =========================

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_mesa INT NOT NULL,
    id_mozo INT NOT NULL,
    id_pedido_estado INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,

    FOREIGN KEY (id_mesa) REFERENCES mesa(id),
    FOREIGN KEY (id_mozo) REFERENCES mozo(id),
    FOREIGN KEY (id_pedido_estado) REFERENCES pedido_estado(id)
);

-- =========================
-- DETALLE DE PEDIDOS
-- =========================

CREATE TABLE pedido_detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    observaciones VARCHAR(500),

    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id)
);