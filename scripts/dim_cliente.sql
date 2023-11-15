## ETL de carga de la dimensión Cliente

-- 3. Cargar.
INSERT INTO dim_cliente(
    cliente_key,
    cliente_id,
    cliente_nombre,
    cliente_edad,
    cliente_género,
    cliente_ocupación
)

-- 1. Extraer datos.
WITH datos_cliente AS(
    SELECT
        cliente_key,
        cliente_id,
        cliente_nombre,
        cliente_edad,
        cliente_género,
        cliente_ocupación
    FROM -- Nombre de la base de datos.
) 

-- 2. Transformar.
datos_transformados_cliente as(
    SELECT
        cliente_key,
        cliente_id,
        cliente_nombre,
        cliente_edad,
        cliente_género,
        cliente_ocupación
    FROM
        datos_cliente
)
select *
    from datos_transformados
;