## Bodega de datos

CREATE DATABASE IF NOT EXISTS datawh;
USE datawh;

## CREACION DE TABLAS

## Dimensión tiempo

CREATE TABLE IF NOT EXISTS dim_tiempo 
(
    tiempo_key        INT(8) NOT NULL, -- No es autoincremental.
    tiempo_value      DATE NOT NULL,
    dia_numero      INT(2) NOT NULL,
    dia_de_semana     CHAR(20) NOT NULL,
    mes_nombre     CHAR(20) NOT NULL,
    mes_numero    INT(2) NOT NULL,
    anno4           INT(4) NOT NULL,

    primary key (tiempo_key),
    unique index tiempo_value (tiempo_value)
);

## Dimensión vendedor

CREATE TABLE IF NOT EXISTS dim_vendedor (
    vendedor_key INT AUTO_INCREMENT,
    vendedor_id SMALLINT,
    vendedor_nombre VARCHAR(255) NOT NULL,
    vendedor_edad INT(10) NOT NULL,
    vendedor_género VARCHAR(10) NOT NULL,
    vendedor_fecha_contrato DATE NOT NULL,
    vendedor_fecha_despido DATE,
    PRIMARY KEY (vendedor_key),
    UNIQUE INDEX vendedor_id (vendedor_id)
);

## Dimensión producto

CREATE TABLE IF NOT EXISTS dim_producto (
    producto_key INT AUTO_INCREMENT,
    producto_id SMALLINT,
    producto_nombre VARCHAR(255) NOT NULL,
    categoría VARCHAR(255) NOT NULL,
    subcategoría VARCHAR(255),
    tamaño VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL,
    PRIMARY KEY (producto_key),
    UNIQUE INDEX producto_id (producto_id)
);

## Dimension tienda

CREATE TABLE IF NOT EXISTS dim_tienda (
    tienda_key INT AUTO_INCREMENT,
    tienda_id SMALLINT,
    tienda_nombre VARCHAR(255) NOT NULL,
    tienda_barrio VARCHAR(255) NOT NULL,
    tienda_ciudad VARCHAR(255) NOT NULL,
    tienda_país VARCHAR(255) NOT NULL,
    PRIMARY KEY (tienda_key),
    UNIQUE INDEX tienda_id (tienda_id)
);

## Dimensión cliente

CREATE TABLE IF NOT EXISTS dim_cliente (
    cliente_key INT AUTO_INCREMENT,
    cliente_id SMALLINT,
    cliente_nombre VARCHAR(255) NOT NULL,
    cliente_edad INT(10) NOT NULL,
    cliente_género VARCHAR(10) NOT NULL,
    cliente_ocupación VARCHAR(255) NOT NULL,
    PRIMARY KEY (cliente_key),
    UNIQUE INDEX cliente_id (cliente_id)
);

## Hecho sale

CREATE TABLE IF NOT EXISTS fact_sale (
    sale_key INT(10) INT AUTO_INCREMENT,
    saleale_id SMALLINT,
    vendedor_key INT(10) NOT NULL,
    tienda_key INT(10) NOT NULL,
    cliente_key INT(10) NOT NULL,
    producto_key INT(10) NOT NULL,
    tiempo_key INT(10) NOT NULL,
    descuento INT(10),
    precio_compra INT(10) NOT NULL,
    precio_venta INT(10) NOT NULL,
    cantidad INT(10) NOT NULL,
    PRIMARY KEY (sale_key),
    UNIQUE INDEX  sale_id (sale_id),
    FOREIGN KEY (vendedor_key) REFERENCES dim_vendedor(vendedor_key),
    FOREIGN KEY (tienda_key) REFERENCES dim_tienda(tienda_key),
    FOREIGN KEY (cliente_key) REFERENCES dim_cliente(cliente_key),
    FOREIGN KEY (producto_key) REFERENCES dim_producto(producto_key),
    FOREIGN KEY (tiempo_key) REFERENCES dim_tiempo(tiempo_key)
)