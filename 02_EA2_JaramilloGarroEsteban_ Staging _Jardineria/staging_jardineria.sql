DROP DATABASE IF EXISTS staging_jardineria;
CREATE DATABASE staging_jardineria;
USE staging_jardineria;

-- TABLAS STAGING --
CREATE TABLE stg_cliente AS
SELECT
    ID_cliente,
    nombre_cliente,
    nombre_contacto,
    apellido_contacto,
    telefono,
    ciudad,
    pais,
    limite_credito
FROM jardineria.cliente;

CREATE TABLE stg_producto AS
SELECT
    ID_producto,
    CodigoProducto,
    nombre,
    Categoria,
    dimensiones,
    proveedor,
    descripcion,
    cantidad_en_stock,
    precio_venta,
    precio_proveedor
FROM jardineria.producto;

CREATE TABLE stg_pedido AS
SELECT
    ID_pedido,
    fecha_pedido,
    fecha_esperada,
    fecha_entrega,
    estado,
    ID_cliente
FROM jardineria.pedido;

CREATE TABLE stg_detalle_pedido AS
SELECT
    ID_detalle_pedido,
    ID_pedido,
    ID_producto,
    cantidad,
    precio_unidad,
    numero_linea
FROM jardineria.detalle_pedido;

CREATE TABLE stg_pago AS
SELECT
    ID_pago,
    ID_cliente,
    forma_pago,
    id_transaccion,
    fecha_pago,
    total
FROM jardineria.pago;

-- ZONA DE VALIDACIONES --
SELECT COUNT(*) FROM stg_cliente;
SELECT COUNT(*) FROM jardineria.cliente;

SELECT COUNT(*) FROM stg_producto;
SELECT COUNT(*) FROM jardineria.producto;

SELECT COUNT(*) FROM stg_pedido;
SELECT COUNT(*) FROM jardineria.pedido;

SELECT COUNT(*) FROM stg_detalle_pedido;
SELECT COUNT(*) FROM jardineria.detalle_pedido;

SELECT COUNT(*) FROM stg_pago;
SELECT COUNT(*) FROM jardineria.pago;