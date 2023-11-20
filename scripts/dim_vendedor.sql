## ETL de carga de la dimensión Vendedor

-- 3. Cargar.
INSERT INTO dim_vendedor (
    vendedor_key, 
    vendedor_id, 
    vendedor_nombre, 
    vendedor_edad, 
    vendedor_género, 
    vendedor_fecha_contrato, 
    vendedor_fecha_despido)
VALUES
    ('V1', 3001, 'Maria', 42, 'F', '12-11-2017'),
    ('V2', 3002, 'Samuel', 33, 'M', '17-07-2022'),
    ('V3', 3003, 'Ricardo', 26, 'M', '2-01-2019', '7-11-2022')

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
    FROM adw_datawh.dim_vendedor
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