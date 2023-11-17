-- Consulta 1: Obtener las ventas totales por producto

SELECT 
    dim_producto.Producto_key,
    COUNT(*) AS Total_ventas,
    SUM(fact_sale.Precio_venta) AS Ingresos_totales
FROM 
    fact_sale
INNER JOIN 
    dim_producto ON fact_sale.Producto_key = dim_producto.Producto_key
GROUP BY 
    dim_producto.Producto_key;

-- Consulta 2: Encontrar el vendedor con mayores ingresos

SELECT 
    dim_vendedor.Vendedor_key,
    SUM(fact_sale.Precio_venta) AS Ingresos_totales
FROM 
    fact_sale
INNER JOIN 
    dim_vendedor ON fact_sale.Vendedor_key = dim_vendedor.Vendedor_key
GROUP BY 
    dim_vendedor.Vendedor_key
ORDER BY 
    Ingresos_totales DESC
LIMIT 1;
