## ETL de carga de la dimensión Vendedor

-- 3. Cargar.
INSERT INTO dim_vendedor(
    vendedor_key,
    vendedor_id,
    vendedor_nombre,
    vendedor_edad,
    vendedor_género,
    vendedor_fecha_contrato,
    vendedor_fecha_despido
)

-- 1. Extraer datos.
WITH datos_vendedor AS(
    SELECT
        vendedor_key,
        vendedor_id,
        vendedor_nombre,
        vendedor_edad,
        vendedor_género,
        vendedor_fecha_contrato,
        vendedor_fecha_despido,
        v_fecha_pedido AS TO_DAYS(vendedor_fecha_contrato),
        v_ fecha_contrato AS TO_DAYS(vendedor_fecha_despido)
    FROM -- Nombre de la base de datos.
) 

-- 2. Transformar.
datos_transformados_vendedor as(
    SELECT
        vendedor_key,
        vendedor_id,
        vendedor_nombre,
        vendedor_edad,
        vendedor_género,
        v_fecha_contrato,
        v_fecha_despido,
    FROM
        datos_vendedor
)
select *
    from datos_transformados_vendedor
;