/*Total de Vendas Internet por Categoria do Produto;
Receita Total Internet por M�s do Pedido;
Receita e Custo Total Internet por Pa�s;
Total de Vendas Internet por Sexo do Cliente.
O an de analise ser� 2013 (ano do pedido)
*/
create OR alter view VENDAS_INTERNET AS
SELECT
	fis.SalesOrderNumber AS 'N� PEDIDO',
	fis.OrderDate AS 'DATA PEDIDO',
	dpc.EnglishProductCategoryName AS 'CATEGORIA PRODUTO',
	dc.FirstName + ' ' + dc.LastName AS 'NOME CLIENTE',
	SalesTerritoryCountry AS 'PA�S',
	fis.OrderQuantity AS 'QTD. VENDIDA',
	fis.TotalProductCost AS 'CUSTO VENDA',
	fis.SalesAmount AS 'RECEITA VENDA'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
	INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
		INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
INNER JOIN DimSalesTerritory dst ON fis.SalesTerritoryKey = dst.SalesTerritoryKey
WHERE YEAR(OrderDate) = 2013