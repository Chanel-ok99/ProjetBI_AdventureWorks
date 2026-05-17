 
-- =============================================
-- COUCHE GOLD - Schéma en étoile
-- Projet BI AdventureWorks
-- =============================================

CREATE DATABASE AdventureWorks_Gold;
GO
USE AdventureWorks_Gold;
GO

-- DIMENSION DATE
CREATE TABLE DimDate (
    DateKey         INT PRIMARY KEY,
    FullDate        DATE,
    CalendarYear    INT,
    CalendarQuarter INT,
    MonthNumber     INT,
    MonthName       NVARCHAR(20)
);

-- DIMENSION PRODUIT
CREATE TABLE DimProduct (
    ProductKey         INT PRIMARY KEY,
    ProductName        NVARCHAR(100),
    ProductCategory    NVARCHAR(50),
    ProductSubcategory NVARCHAR(50),
    Color              NVARCHAR(20),
    ListPrice          DECIMAL(10,2),
    StandardCost       DECIMAL(10,2)
);

-- DIMENSION CLIENT
CREATE TABLE DimCustomer (
    CustomerKey  INT PRIMARY KEY,
    FirstName    NVARCHAR(50),
    LastName     NVARCHAR(50),
    Gender       NVARCHAR(10),
    YearlyIncome DECIMAL(15,2),
    Country      NVARCHAR(50)
);

-- DIMENSION TERRITOIRE
CREATE TABLE DimTerritory (
    TerritoryKey     INT PRIMARY KEY,
    TerritoryRegion  NVARCHAR(50),
    TerritoryCountry NVARCHAR(50),
    TerritoryGroup   NVARCHAR(50)
);

-- TABLE DE FAITS
CREATE TABLE FactInternetSales (
    SalesOrderNumber NVARCHAR(20),
    OrderDateKey     INT REFERENCES DimDate(DateKey),
    ProductKey       INT REFERENCES DimProduct(ProductKey),
    CustomerKey      INT REFERENCES DimCustomer(CustomerKey),
    TerritoryKey     INT REFERENCES DimTerritory(TerritoryKey),
    SalesAmount      DECIMAL(15,2),
    OrderQuantity    INT,
    UnitPrice        DECIMAL(10,2),
    TotalProductCost DECIMAL(15,2),
    TaxAmt           DECIMAL(15,2),
    Freight          DECIMAL(15,2)
);

-- INDEX PERFORMANCE
CREATE INDEX IX_Fact_OrderDate ON FactInternetSales(OrderDateKey);
CREATE INDEX IX_Fact_Product ON FactInternetSales(ProductKey);
CREATE INDEX IX_Fact_Customer ON FactInternetSales(CustomerKey);
CREATE INDEX IX_Fact_Territory ON FactInternetSales(TerritoryKey);
CREATE INDEX IX_DimDate_Year ON DimDate(CalendarYear);
CREATE INDEX IX_DimProduct_Category ON DimProduct(ProductCategory);
CREATE INDEX IX_DimCustomer_Country ON DimCustomer(Country);