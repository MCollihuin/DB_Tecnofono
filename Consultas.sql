-- Top 5 producto
SELECT
    p.Nombre_Producto,
    SUM(dc.Cantidad) AS Cantidad_Vendida
FROM Producto p
JOIN Detalle_Compra dc
    ON p.ID_Producto = dc.ID_Producto
GROUP BY p.ID_Producto
ORDER BY Cantidad_Vendida DESC
LIMIT 5;

--Ventas por categoria
SELECT
    c.Nombre_Categoria,
    SUM(dc.Cantidad * dc.Precio_Unitario) AS Total_Ventas
FROM Categoria c
JOIN Producto p
    ON c.ID_Categoria = p.ID_Categoria
JOIN Detalle_Compra dc
    ON p.ID_Producto = dc.ID_Producto
GROUP BY c.Nombre_Categoria;

--Cliente que mas dinero gastó
SELECT
    cl.Nombre_Cliente,
    SUM(dc.Cantidad * dc.Precio_Unitario) AS Total
FROM Cliente cl
JOIN Compra c
    ON cl.ID_Cliente = c.ID_Cliente
JOIN Detalle_Compra dc
    ON c.ID_Compra = dc.ID_Compra
GROUP BY cl.ID_Cliente
ORDER BY Total DESC
LIMIT 1;
