-- Jonathan Goins & Adrian
-- 1.1 
use information_schema;
use aw;
SELECT SUM(table_rows) AS " Total Schema row number"
	FROM information_schema.tables
    WHERE table_schema = 'aw'; 
    -- count = 119753 
    
-- 1.2 
SELECT COUNT(*) AS " Select count(*)"
	FROM information_schema.tables;
    -- count = 98 
    
-- 1.3
	-- count, counts how many rows are present in each table and schema uses a an approximation while taking into account recent changes like delete & insert
    
-- 1.4 
	-- count isnt as effective because it goes through each row while scehma doesnt enter the rows at all

-- 2
SELECT * FROM information_schema.columns; 

SELECT DISTINCT table_name, column_name
	FROM information_schema.COLUMNS
    WHERE table_schema = 'aw' AND column_key = 'PRI';
-- 3 

-- 4
  
-- 5

SELECT EnglishProductSubcategoryName 
	FROM DimProductSubcategory
    WHERE ProductCategoryKey = 1;
    
-- 6 


-- 7 
SELECT EnglishProductSubcategoryName 
	FROM DimProductSubcategory
    WHERE ProductCategoryKey != 1;
-- 8
SELECT COUNT(*), DimProduct.Color
	FROM FactInternetSales
    JOIN DimProduct on DimProduct.ProductKey = FactInternetSales.ProductKey
    JOIN DimProductSubcategory on DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
    RIGHT JOIN DimTime on FactInternetSales.OrderDateKey
    WHERE DimTime.CalendarYear BETWEEN 2001 AND 2004
    AND DimProductSubcategory.EnglishProductSubcategoryName LIKE '%Bikes%'
    Group by DimProduct.Color
    ORDER BY DimProduct.Color ASC;

SELECT *
	FROM DimProductSubcategory;
