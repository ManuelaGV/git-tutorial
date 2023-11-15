## ETL fde carga de la tabla de hechos fact_sales

-- ETL de carga de la tabla de hechos
-- 3. cargar

INSERT INTO fact_sale (
    vendedor_key,
    tienda_key,
    cliente_key,
    producto_key,
    tiempo_key,
    descuento,
    precio_compra,
    precio_venta,
    cantidad
)

-- 1. extraer los datos de la fuente (OLTP)
WITH datos AS (
    SELECT 
        sale_id,
        sale_date,
        vendedor_id, 
        tienda_id, 
        cliente_id,
        producto_id,
        tiempo_value,
        descuento,
        precio_compra,
        precio_venta,
        cantidad
    FROM datawh.fact_sale AS sale  ##Nombre de la base de datos con su tabla fact_sale
)

-- 2. transformar obteniendo los keys
datos_transformados AS (
    SELECT
        dim_vendedor.vendedor_key AS vendedor_key,
        dim_tienda.tienda_key AS tienda_key,
        dim_cliente.cliente_key AS cliente_key,
        dim_producto.producto_key AS producto_key,
        dim_tiempo.tiempo_key AS tiempo_key,
        descuento,
        precio_compra,
        precio_venta,
        cantidad
    FROM
        datos
        JOIN dim_vendedor ON datos.vendedor_id = dim_vendedor.vendedor_id
        JOIN dim_tienda ON datos.tienda_id = dim_tienda.tienda_id
        JOIN dim_cliente ON datos.cliente_id = dim_cliente.cliente_id
        JOIN dim_producto ON datos.producto_id = dim_producto.producto_id
        JOIN dim_tiempo ON datos.tiempo_value = dim_tiempo.tiempo_value
)
SELECT *
FROM datos_transformados;