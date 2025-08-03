-- CONSULTAS DESTACADAS 

-- 1. Listar todos los productos
SELECT * FROM productos;

-- 2. Productos con bajo stock (menos de 10 unidades)
SELECT * FROM productos
WHERE stock < 10;

-- 3. Productos sin stock
SELECT * FROM productos
WHERE stock = 0;

-- 4. Buscar productos de la categoría "Bebidas"
SELECT * FROM productos
WHERE categoria = 'Bebidas';

-- 5. Producto más caro
SELECT nombre, precio FROM productos
ORDER BY precio DESC
LIMIT 1;

-- 6. Precio promedio por categoría
SELECT categoria, ROUND(AVG(precio), 2) AS promedio_precio
FROM productos
GROUP BY categoria;

-- 7. Cantidad de productos por categoría
SELECT categoria, COUNT(*) AS cantidad
FROM productos
GROUP BY categoria;

-- 8. Productos con nombre que contienen "café"
SELECT * FROM productos
WHERE nombre LIKE '%café%';

-- 9. Clasificación de productos según el precio
SELECT nombre, precio,
       CASE
           WHEN precio < 700 THEN 'Barato'
           WHEN precio BETWEEN 700 AND 1000 THEN 'Medio'
           ELSE 'Caro'
       END AS rango_precio
FROM productos;

-- 10. Mostrar los 5 productos más baratos
SELECT nombre, precio FROM productos
ORDER BY precio ASC
LIMIT 5;

-- 11. Total de ventas por producto (JOIN con detalle_ventas)
SELECT p.nombre, SUM(dv.cantidad) AS total_vendido
FROM productos p
JOIN detalle_ventas dv ON p.id = dv.producto_id
GROUP BY p.nombre
ORDER BY total_vendido DESC;

-- 12. Clientes que realizaron compras mayores a $5000 (JOIN con ventas)
SELECT c.nombre, c.email, SUM(v.total) AS total_gastado
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.nombre, c.email
HAVING total_gastado > 5000;

-- 13. Productos que nunca fueron vendidos
SELECT p.*
FROM productos p
LEFT JOIN detalle_ventas dv ON p.id = dv.producto_id
WHERE dv.id IS NULL;

-- 14. Promedio de productos por venta
SELECT ROUND(AVG(cantidad_total), 2) AS promedio_productos
FROM (
  SELECT v.id, SUM(dv.cantidad) AS cantidad_total
  FROM ventas v
  JOIN detalle_ventas dv ON v.id = dv.venta_id
  GROUP BY v.id
) AS resumen;

-- 15. Subconsulta: productos por encima del precio promedio de su categoría
SELECT * FROM productos p
WHERE precio > (
  SELECT AVG(precio)
  FROM productos
  WHERE categoria = p.categoria
);

-- 16. Cliente con mayor cantidad de compras
SELECT c.nombre, COUNT(v.id) AS cantidad_compras
FROM clientes c
JOIN ventas v ON c.id = v.cliente_id
GROUP BY c.nombre
ORDER BY cantidad_compras DESC
LIMIT 1;

-- 17. Ventas del mes actual
SELECT * FROM ventas
WHERE MONTH(fecha) = MONTH(CURDATE())
  AND YEAR(fecha) = YEAR(CURDATE());
