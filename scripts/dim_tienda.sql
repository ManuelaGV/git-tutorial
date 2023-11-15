## ETL de carga de la dimensión Tienda

-- 3. Cargar.
INSERT INTO dim_tienda(
    tienda_key,
    tienda_id,
    tienda_nombre,
    tienda_barrio,
    tienda_ciudad,
    tienda_país
)

-- 1. Extraer datos.
WITH datos_tienda AS(
    SELECT
        tienda_key,
        tienda_id,
        tienda_nombre,
        tienda_barrio,
        tienda_ciudad,
        tienda_país
    FROM -- Nombre de la base de datos.
) 

-- 2. Transformar.
datos_transformados_tienda as(
    SELECT
        tienda_key,
        tienda_id,
        tienda_nombre,
        tienda_barrio,
        tienda_ciudad,
        tienda_país
    FROM
        datos_tienda
)
select *
    from datos_transformados_tienda
;