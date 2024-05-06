-- AZURE DATA STUDIO - DB CREDENTIALS XXXX --

-- CANAL INDIRECTO / INDIRECT CHANNEL---

-- CLIENTES / CLIENTS

SELECT DISTINCT  id_clienteShipTo, b.txtmd AS Clients_name
FROM [opmis].[factTable_opmis]a
LEFT JOIN [opmis].[dim_Cliente]b on a.id_customer = b.id_customer
LEFT JOIN [opmis].[dim_SaleOff]c on a.id_saleOff_CLSH = c.id_saleOff
WHERE AñoZafra = '2024'
AND c.id_saleOff = '9';


-- canal de distribucion / distribution channel-- 
SELECT  *
FROM [opmis].[dim_CanalDistribucion];

-- sales office
SELECT * 
FROM [opmis].[dim_SaleOff]

-- Product family --

SELECT *
  FROM [opmis].[dim_productFamily]

-- Premium --

SELECT *
FROM [opmis].[dim_premium];

-- Productos/ products -- 


SELECT DISTINCT  d.* 
FROM [opmis].[factTable_opmis]a
LEFT JOIN [opmis].[dim_Cliente]b on a.id_customer = b.id_customer
LEFT JOIN [opmis].[dim_SaleOff]c on a.id_saleOff_CLSH = c.id_saleOff
LEFT JOIN [opmis].[dim_materiales] d on a.id_mat = d.id_mat
and c.id_saleOff = '9'
AND clave_mat LIKE 'L%'
WHERE d.id_mat IS NOT NULL

-- VENTAS / sales--

SELECT Añozafra,CONVERT(DATE, STUFF(STUFF(FechaCreacionReg, 5, 0, '-'), 8, 0, '-')) AS FechaCalendario,
        id_Clientepagador,id_clienteShipTo,id_saleOff_CLSH,id_mat,a.id_customer,id_canalDistri,id_productFamily,
        id_premium,id_brandByFamily,VolumenL15 AS Litros,[Margen M3 ARS] AS Margen_M3
FROM [opmis].[factTable_opmis] a
LEFT JOIN [opmis].[dim_Cliente] b ON a.id_customer = b.id_customer
LEFT JOIN [opmis].[dim_SaleOff] c ON a.id_saleOff_CLSH = c.id_saleOff
WHERE AñoZafra IN ('2023', '2024')
AND c.id_saleOff = '9';

-- BRAND BY FAMILY --
SELECT TOP 30 *
FROM [opmis].[dim_brandByFamily];
