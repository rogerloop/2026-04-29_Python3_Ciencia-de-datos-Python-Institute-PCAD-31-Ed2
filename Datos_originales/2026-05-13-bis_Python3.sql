
-- practica 11
-- en un fiuchero sql, crear unas sentencias sql, para poder guardar sus resultados en un fichero csv,
-- UNA VEZ OBTENGAMOS EL FICHERO EN PYTHON  O SEA EN VSC, 

-- VER UN GRAFICO DE BARRAS DE LOS 10 PAISES CON MAS IMPORTE 


-- OTRO GRAFICO DE BARRAS PARA VER EL NUMERO DE PEDIDOS POR NOMBRE DE CATEGORIA

-- Importe = DEtalles de Pedidos.PrecioUnidad x DEtallesde de Pedidos.Cantidad

-- VARIANTE 11.V. SOLO DE LOS PAISES ALEMANIA, FRANCIA E ITALIA

-- -----------------------------

-- TOP 10

SELECT 
	P.PaísDestinatario,
    sum(DP.PrecioUnidad*DP.Cantidad) AS Importe
FROM
	Pedidos P, Detalles_de_pedidos DP, Productos PR
-- JOIN IMPLICITO
WHERE
	P.IdPedido = DP.IdPedido
AND
	DP.IdProducto = PR.IdProducto
GROUP BY
	P.PaísDestinatario
ORDER BY 
	sum(DP.PrecioUnidad*DP.Cantidad) DESC
LIMIT 10;

-- CATEGORIAS

SELECT 
	C.NombreCategoría,
    COUNT(DP.IdPedido) AS num_pedios
FROM 
	Detalles_de_pedidos DP,
    Productos P,
    Categorías C
WHERE 
	DP.IdProducto = P.IdProducto
AND
	P.IdCategoría = C.IdCategoría
GROUP BY 
	C.NombreCategoría
ORDER BY 
	COUNT(DP.IdPedido) DESC;

-- ----------------------------------------

-- SOLO DE LOS PAISES ALEMANIA, FRANCIA E ITALIA

SELECT 
	P.PaísDestinatario,
    sum(DP.PrecioUnidad*DP.Cantidad) AS Importe
FROM
	Pedidos P, Detalles_de_pedidos DP, Productos PR
WHERE
	P.IdPedido = DP.IdPedido
AND
	DP.IdProducto = PR.IdProducto
AND 
	P.PaísDestinatario IN ('Alemania','Francia','Italia')
GROUP BY
P.PaísDestinatario
ORDER BY sum(DP.PrecioUnidad*DP.Cantidad) DESC
LIMIT 10;
