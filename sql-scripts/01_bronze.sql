-- =============================================
-- COUCHE BRONZE - Données brutes
-- Projet BI AdventureWorks
-- =============================================

CREATE DATABASE AdventureWorks_Bronze;
GO
USE AdventureWorks_Bronze;
GO

-- Copie brute FactInternetSales
SELECT * INTO FactInternetSales_Bronze
FROM AdventureWorksDW2022.dbo.FactInternetSales;

-- Copie brute DimProduct
SELECT * INTO DimProduct_Bronze
FROM AdventureWorksDW2022.dbo.DimProduct;

-- Copie brute DimCustomer
SELECT * INTO DimCustomer_Bronze
FROM AdventureWorksDW2022.dbo.DimCustomer;

-- Copie brute DimDate
SELECT * INTO DimDate_Bronze
FROM AdventureWorksDW2022.dbo.DimDate;

-- Copie brute DimSalesTerritory
SELECT * INTO DimSalesTerritory_Bronze
FROM AdventureWorksDW2022.dbo.DimSalesTerritory;
