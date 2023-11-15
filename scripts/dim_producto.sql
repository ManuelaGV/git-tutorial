## ETL de carga de la dimensión Producto

-- 3. Cargar.
INSERT INTO dim_producto(
    producto_key,
    producto_id,
    producto_nombre,
    categoría,
    subcategoría,
    tamaño,
    color
)

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
    FROM datawh.dim_producto -- Nombre de la base de datos.
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
