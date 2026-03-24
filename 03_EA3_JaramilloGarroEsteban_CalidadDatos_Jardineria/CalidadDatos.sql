USE staging_jardineria;
-- VALIDACIÓN DE CALIDAD DE DATOS --

-- 1. VALIDACIÓN DE NULOS --
SELECT 'stg_cliente - nombre_cliente NULL' AS prueba, COUNT(*) AS total
FROM stg_cliente
WHERE nombre_cliente IS NULL;

SELECT 'stg_producto - nombre NULL' AS prueba, COUNT(*) AS total
FROM stg_producto
WHERE nombre IS NULL;

SELECT 'stg_pedido - ID_cliente NULL' AS prueba, COUNT(*) AS total
FROM stg_pedido
WHERE ID_cliente IS NULL;

SELECT 'stg_pago - total NULL' AS prueba, COUNT(*) AS total
FROM stg_pago
WHERE total IS NULL;

-- 2. VALIDACIÓN DE DUPLICADOS --
SELECT ID_cliente, COUNT(*) AS duplicados
FROM stg_cliente
GROUP BY ID_cliente
HAVING COUNT(*) > 1;

SELECT ID_producto, COUNT(*) AS duplicados
FROM stg_producto
GROUP BY ID_producto
HAVING COUNT(*) > 1;

SELECT ID_pedido, COUNT(*) AS duplicados
FROM stg_pedido
GROUP BY ID_pedido
HAVING COUNT(*) > 1;

-- 3. VALIDACIÓN DE RANGOS --
SELECT * FROM stg_pago
WHERE total < 0;

SELECT * FROM stg_producto
WHERE precio_venta < 0;

SELECT * FROM stg_producto
WHERE cantidad_en_stock < 0;

-- 4. VALIDACIÓN DE CONSISTENCIA --
SELECT *
FROM stg_pedido p
LEFT JOIN stg_cliente c ON p.ID_cliente = c.ID_cliente
WHERE c.ID_cliente IS NULL;

SELECT *
FROM stg_detalle_pedido d
LEFT JOIN stg_producto p ON d.ID_producto = p.ID_producto
WHERE p.ID_producto IS NULL;

-- 5. VALIDACIÓN DE COMPLETITUD --
SELECT 
    (SELECT COUNT(*) FROM stg_cliente) AS clientes,
    (SELECT COUNT(*) FROM stg_producto) AS productos,
    (SELECT COUNT(*) FROM stg_pedido) AS pedidos,
    (SELECT COUNT(*) FROM stg_pago) AS pagos;