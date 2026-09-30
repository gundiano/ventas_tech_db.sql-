
-- === Este documento contiene las sentencias SQL necesarias para la eliminación, creación, inserción de datos y validación de las tablas principales del sistema.

-- === CREACION DE LA BASE DE DATOS VENTAS_TECH_DB ===
CREATE DATABASE VENTAS_TECH_DB;
USE VENTAS_TECH_DB;


-- === SECCIÓN 1: DROP TABLES ===
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- === SECCIÓN 2: CREACION DE TABLAS -- ===
CREATE TABLE CATEGORIAS (
ID_CATEGORIA INT NOT NULL,
NOMBRE_CATEGORIA VARCHAR(50) NOT NULL,
DESCRIPCION VARCHAR(200) NULL,
CONSTRAINT PK_CATEGORIAS PRIMARY KEY (ID_CATEGORIA)
);

CREATE TABLE CLIENTES (
ID_CLIENTE INT NOT NULL,
NOMBRE VARCHAR(100) NOT NULL,
EMAIL VARCHAR(100),
CIUDAD VARCHAR(50) NOT NULL,
FECHA_REGISTRO DATE NOT NULL,
CONSTRAINT PK_CLIENTES PRIMARY KEY (ID_CLIENTE),
CONSTRAINT UQ_CLIENTES_EMAIL UNIQUE (EMAIL)
);

CREATE TABLE PRODUCTOS (
ID_PRODUCTO INT NOT NULL,
NOMBRE_PRODUCTO VARCHAR(100) NOT NULL,
ID_CATEGORIA INT NOT NULL,
PRECIO DECIMAL(10,2) NOT NULL,
STOCK INT NOT NULL DEFAULT 0,
ACTIVO BIT NOT NULL DEFAULT 1,
CONSTRAINT PK_PRODUCTOS PRIMARY KEY (ID_PRODUCTO),
CONSTRAINT FK_CATEGORIAS FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS (ID_CATEGORIA)
);

CREATE TABLE VENTAS (
ID_VENTA INT NOT NULL,
ID_CLIENTE INT NOT NULL,
ID_PRODUCTO INT NOT NULL,
CANTIDAD INT NOT NULL,
PRECIO_UNITARIO DECIMAL(10,2) NOT NULL,
FECHA_VENTA DATE NOT NULL,
CONSTRAINT PK_VENTAS PRIMARY KEY (ID_VENTA),
CONSTRAINT FK_VENTAS_CLIENTES FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE),
CONSTRAINT FK_VENTAS_PRODUCTOS FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS (ID_PRODUCTO)
);

-- === SECCIÓN 3: INSERT DATA -- === 

INSERT INTO CATEGORIAS (id_categoria, nombre_categoria, descripcion) VALUES
    (1, 'Computación',    'Laptops, PCs y monitores'),
    (2, 'Accesorios',     'Periféricos y complementos'),
    (3, 'Audio',          'Auriculares y parlantes'),
    (4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO CLIENTES (ID_CLIENTE, NOMBRE, EMAIL, CIUDAD, FECHA_REGISTRO) VALUES
(1,'María López','maria@mail.com','Buenos Aires','2024-01-05'),
(2,'Carlos Ruiz','carlos@mail.com','Córdoba','2024-01-10'),
(3, 'Ana Gomez','ana@mail.com','Rosario', '2024-02-01'),
(4,'Pedro Sanz','pedro@mail.com','Mendoza','2024-02-15'),
(5, 'Laura Torres','laura@mail.com','Tucumán','2024-03-01');

INSERT INTO PRODUCTOS (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
    (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
    (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
    (3, 'Monitor 4K 27',     1,  450.00, 12, 1),
    (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
    (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
    (6, 'Teclado Mecánico',   2,   95.00, 40, 1);

INSERT INTO VENTAS (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
    ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
    ( 2, 2, 2, 5,   28.00, '2024-03-06'),
    ( 3, 3, 3, 1,  450.00, '2024-03-07'),
    ( 4, 1, 4, 2,  120.00, '2024-03-08'),
    ( 5, 4, 5, 3,  130.00, '2024-03-10'),
    ( 6, 2, 6, 4,   95.00, '2024-03-11'),
    ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
    ( 8, 3, 2, 8,   28.00, '2024-03-13'),
    ( 9, 4, 4, 1,  120.00, '2024-03-14'),
    (10, 5, 3, 2,  450.00, '2024-03-15');

    -- === SECCIÓN 4: VALIDACION -- === 
    SELECT * FROM CATEGORIAS;
    SELECT * FROM CLIENTES;
    SELECT * FROM PRODUCTOS;
    SELECT * FROM VENTAS;