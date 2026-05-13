-- TRANSACT-SQL-- Propio de microsoft
-- DML -> Data Manipulate Language -- Afectan a registros
-- Select = SOLO LECTURA
-- Insert into= Insertar datos
-- Update = para modificar datos
-- Daelete = para borra eliminar registros

# USE Neptuno-2003;  -- BASE DE DATOS ACTIVA
-- VER TODOS LOS REGISTROS CON SUS CAMPOS DE LA TABLA PEDIDOS
SELECT * FROM Pedidos;

-- SOLO VER ALGUNOS CAMPOS
SELECT FechaPedido, Destinatario FROM Pedidos;

-- EL ALIAS DE LOS CAMPOS
SELECT 	FechaPedido AS 'Fecha de Pedido', 
		Destinatario AS Clinete
FROM Pedidos;

-- LA ORDENACION VA EN EL PREDICADO
SELECT * FROM Pedidos
ORDER BY PaísDestinatario ASC;

-- LA ORDENACION DESDCENDENTE
SELECT * FROM Pedidos
ORDER BY PaísDestinatario DESC;

-- LA ORDENACIÓN POR + DE 1 CAMPO
SELECT * FROM Pedidos 
ORDER BY PaísDestinatario, CiudadDestinatario;

-- LA ORDENACION DIFERENTE
SELECT * FROM Pedidos
ORDER BY 	PaísDestinatario ASC,
			CiudadDestinatario DESC;
            
-- VER LOS PRIMEROS REGISTROS
# SELECT TOP(5) * FROM Pedidos;  -- SQL
-- VER LOS PRIMEROS REGISTROS
SELECT * 
FROM Pedidos
LIMIT 5;

SELECT * 
FROM Pedidos
ORDER BY FechaPedido DESC
LIMIT 5;

-- CADENAS ALFANUMERICAS EN EL SUJETO, Comilla simple
SELECT concat_ws(' ',CódPostalDestinatario, CiudadDestinatario) AS Cod_Loc
FROM Pedidos;

SELECT * FROM Detalles_de_pedidos;

SELECT 
	Cantidad, 
	PrecioUnidad, 
    (Cantidad * PrecioUnidad) AS Importe
FROM 
	Detalles_de_pedidos;

-- EL FILTRADO DE REGISTROS, FILTRAR POR WHERE
SELECT 
	* 
FROM 
    Pedidos
WHERE
	PaísDestinatario='Alemania';

-- FILTRADO DE REGISTROS SEGUN 2 CONDICIONES
SELECT * 
FROM Pedidos
WHERE PaísDestinatario='Alemania'
OR PaísDestinatario='Francia';

-- LA FUNCION OR Y LA FUNCION AND

-- FUNCIONESD DE AGREGADO SUM, AVERAGE, MAX, MIN, COUNT
-- NORMALMENTE VAN ACOMPAÑADAS DE GROUP BY
SELECT COUNT(*) 
FROM Pedidos;

-- CON LA CLAUSULA CAST HAGO CONVCERSIONES DE TIPOS DE DATOS
SELECT 
	 'Numero de registros '+CAST(COUNT(*) AS VARCHAR)
FROM Pedidos;

-- CHAR, VARCHAR, NVARCHAR
-- CHAR = PARA NUMERO DE POSICIONES FIJPO 4 (RESERVA LAS 4 POSICIONES)
-- VARCHAR = HASTA 256 CARACTERES, PERO SOLO GASTA SEGUN EL NUMERO
-- NVARCHAR = CAMPO MEMO, TESTO LARGO

-- COMO TRAER EN UNA SENTENCIA REGISTROS DE VARIAS TABLAS CON JOIN
-- EL JOIN IMPLICITO ES UN INNER = SOLO LOS REGISTROS QUE COINCIDAN EN LAS 2 TABLAS (EL ALIAS DE TABLA)

SELECT *
FROM
	Pedidos P, Detalles_de_Pedidos DP
-- JOIN IMPLICITO
WHERE
	P.IdPedido = DP.IdPedido;
	
-- VER LA SUMA DE IMPORTE POR PAIS DESTINATARIO, USAREMOS LA FUNCION SUM
SELECT 
	P.PaísDestinatario,
    sum(DP.PrecioUnidad*DP.Cantidad) AS Importe
FROM
	Pedidos P, Detalles_de_pedidos DP
-- JOIN IMPLICITO
WHERE
	P.IdPedido = DP.IdPedido
GROUP BY
P.PaísDestinatario;

-- INCORPORAR OTRA TABLA, CON AND AÑADIMOS OTRO JOIN IMPLICITO
SELECT 
	P.PaísDestinatario,
    PR.IdCategoría,
    sum(DP.PrecioUnidad*DP.Cantidad) AS Importe
FROM
	Pedidos P, Detalles_de_pedidos DP, Productos PR
-- JOIN IMPLICITO
WHERE
	P.IdPedido = DP.IdPedido
AND
	DP.IdProducto = PR.IdProducto
GROUP BY
P.PaísDestinatario, PR.IdCategoría
ORDER BY P.PaísDestinatario;



