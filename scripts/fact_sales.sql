## ETL fact_sale

-- ETL de carga de la tabla de hechos
-- 3. cargar

INSERT INTO fact_sale (
    sale_id,
    vendedor_key,
    tienda_key,
    cliente_key,
    producto_key,
    sale_fecha,
    descuento,
    precio_compra,
    precio_venta,
    cantidad
)
-- 1. extraer los datos de la fuente (OLTP)
WITH datos AS (
    SELECT 
        sale_id,
        vendedor_id, 
        tienda_id, 
        cliente_id,
        producto_id,
	    sale_fecha,
        descuento,
        precio_compra,
        precio_venta,
        cantidad
    FROM datawh.fact_sale AS sale 
),
-- 2. transformar obteniendo los keys
datos_transformados AS (
    SELECT
        datos.Sale_id,
    dim_vendedor.vendedor_key AS vendedor_key,
    dim_tienda.tienda_key AS tienda_key,
    dim_cliente.cliente_key AS cliente_key,
    dim_producto.producto_key AS producto_key,
    TO_DAYS(datos.sale_fecha) AS  sale_fecha,
case when datos.descuento is null then datos.precio_venta else datos.precio_venta - (datos.precio_venta*datos.descuento / 100) end as precio_venta,
    datos.precio_compra,
    datos.cantidad
    FROM
        datos
	    JOIN datawh.dim_tiempo as tiempo
  ON TO_DAYS(datos.Sale_fecha) = tiempo.tiempo_key
        JOIN dim_vendedor ON datos.vendedor_id = dim_vendedor.vendedor_id
        JOIN dim_tienda ON datos.tienda_id = dim_tienda.tienda_id
        JOIN dim_cliente ON datos.cliente_id = dim_cliente.cliente_id
        JOIN dim_producto ON datos.producto_id = dim_producto.producto_id
)
SELECT *
FROM datos_transformados;