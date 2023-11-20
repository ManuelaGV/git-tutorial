## ETL de carga de la dimensión Producto

-- 3. Cargar.
INSERT INTO dim_producto(
    producto_key, 
    producto_id, 
    producto_nombre, 
    categoría, 
    subcategoría, 
    tamaño, 
    color)
VALUES
    ('P1', 7001, 'Bicicleta carrera', 'Desportes', 'Ciclismo', 'Adulto', 'Verde'),
    ('P2', 7002, 'Bicicleta montaña', 'Desportes', 'Ciclismo', 'Adulto', 'Negra'),
    ('P3', 7003, 'Agua', 'Alimentos', 'Bebidas', '1 litro'),
    ('P4', 7004, 'Casco bicicleta', 'Accesorios', 'Cascos', 'Niño', 'Rosa')

-- 1. Extraer datos.
WITH datos_producto AS(
    SELECT
        producto_key,
        producto_id,
        producto_nombre,
        categoría,
        subcategoría,
        tamaño,
        color
    FROM adw_datawh.dim_producto
) 

-- 2. Transformar.
datos_transformados_producto as(
    SELECT
        producto_key,
        producto_id,
        producto_nombre,
        categoría,
        subcategoría,
        tamaño,
        color
    FROM
        datos_producto
)
select *
    from datos_transformados_producto
;