## ETL de carga de la dimensión Tiempo

-- 3. Cargar.
INSERT INTO dim_tiempo(
    tiempo_key,
    tiempo_value,
    dia_numero,
    dia_de_semana,
    mes_nombre,
    mes_numero,
    anno4
)

-- 1. Extraer datos.
WITH datos_tiempo AS(
    SELECT
        tiempo_key,
        tiempo_value,
        dia_numero,
        dia_de_semana,
        mes_nombre,
        mes_numero,
        anno4
    FROM -- Nombre de la base de datos.
) 

-- 2. Transformar.
datos_transformados_tiempo as(
    SELECT
        tiempo_key,
        tiempo_value,
        dia_numero,
        dia_de_semana,
        mes_nombre,
        mes_numero,
        anno4
    FROM
        datos_tiempo
)
select *
    from datos_transformados_tiempo
;