## ETL de carga de la dimensión Tiempo

-- 3. Cargar.
-- Inserción en dim_tiempo
INSERT INTO dim_tiempo (tiempo_key, tiempo_value, dia_numero, dia_de_semana, mes_nombre, mes_numero, anno4)
VALUES
    (1, '15-01-2020', 15, 'Lunes', 'Enero', 1, 2020),
    (2, '18-03-2019', 18, 'Miercoles', 'Marzo', 3, 2019),
    (3, '06-12-2021', 6, 'Sabado', 'Diciembre', 12, 2021)

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