-- =============================================
-- COUCHE SILVER - Données nettoyées
-- Projet BI AdventureWorks
-- =============================================

CREATE DATABASE AdventureWorks_Silver;
GO
USE AdventureWorks_Silver;
GO

-- FactInternetSales nettoyée
SELECT * INTO FactInternetSales_Silver
FROM AdventureWorksDW2022.dbo.FactInternetSales
WHERE SalesAmount IS NOT NULL
AND ProductKey IS NOT NULL
AND CustomerKey IS NOT NULL;

-- DimProduct nettoyée
SELECT * INTO DimProduct_Silver
FROM AdventureWorksDW2022.dbo.DimProduct
WHERE EnglishProductName IS NOT NULL
AND ProductSubcategoryKey IS NOT NULL;

-- DimCustomer nettoyée
SELECT * INTO DimCustomer_Silver
FROM AdventureWorksDW2022.dbo.DimCustomer
WHERE FirstName IS NOT NULL
AND LastName IS NOT NULL;

-- DimDate nettoyée
SELECT * INTO DimDate_Silver
FROM AdventureWorksDW2022.dbo.DimDate
WHERE CalendarYear IS NOT NULL;

-- DimSalesTerritory nettoyée
SELECT * INTO DimSalesTerritory_Silver
FROM AdventureWorksDW2022.dbo.DimSalesTerritory
WHERE SalesTerritoryCountry IS NOT NULL; 
