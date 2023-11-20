## ETL de carga de la dimensión Tienda

-- 3. Cargar.
INSERT INTO dim_tienda(
    tienda_key, 
    tienda_id, 
    tienda_nombre, 
    tienda_barrio, 
    tienda_ciudad, 
    tienda_país)
VALUES
    ('T1', 1001, 'Bicicletas', 'Chapinero', 'Bogotá', 'Colombia'),
    ('T2', 1002, 'Bycicles', 'Disney', 'Orlando', 'Estados Unidos'),
    ('T3', 1003, 'Exercise supplies', 'Cabecera', 'Bucaramanga', 'Colombia')

-- 1. Extraer datos.
WITH datos_tienda AS(
    SELECT
        tienda_key,
        tienda_id,
        tienda_nombre,
        tienda_barrio,
        tienda_ciudad,
        tienda_país
    FROM adw_datawh.dim_tienda
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