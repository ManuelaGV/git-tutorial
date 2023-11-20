## ETL de carga de la dimensión Cliente

-- 3. Cargar.
INSERT INTO dim_cliente (
    cliente_key, 
    cliente_id, 
    cliente_nombre, 
    cliente_edad, 
    cliente_género, 
    cliente_ocupación)
VALUES
    ('A1', 0001, 'Danielle', 23, 'F', 'Assistant'),
    ('A2', 0002, 'Camila', 19, 'F', 'Student'),
    ('A3', 0003, 'Feliepe', 21, 'M', 'Desempleado')

-- 1. Extraer datos.
WITH datos_cliente AS(
    SELECT
        cliente_key,
        cliente_id,
        cliente_nombre,
        cliente_edad,
        cliente_género,
        cliente_ocupación
    FROM adw_datawh.dim_cliente
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