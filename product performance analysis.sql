--Product Analysis using SQL
--Ana
-- What is our Sales by Products?
--Below query display Sales figures by Products.
Select
	p.EnglishProductName AS product_name,
	SUM(f.SalesAmount) AS sales_amount
from DimProduct p
inner join FactInternetSales f on p.ProductKey = f.ProductKey
Group By p.EnglishProductName
Order by SUM(f.SalesAmount) DESC


-- What are our top 10 products by Sales?
--Below query display Top 10 Products by Sales.

Select top 10 
	p.EnglishProductName AS product_name,
	SUM(f.SalesAmount) AS sales_amount
from DimProduct p
inner join FactInternetSales f on p.ProductKey = f.ProductKey
Group By p.EnglishProductName
Order by SUM(f.SalesAmount) DESC

--What are our top 10 products with lowest production cost?
--Below query display Top 10 Products with lowest production cost.

Select top 10 
	p.EnglishProductName AS product_name,
	SUM(f.TotalProductCost) AS sales_amount
from DimProduct p
inner join FactInternetSales f on p.ProductKey = f.ProductKey
Group By p.EnglishProductName
Order by SUM(f.TotalProductCost) ASC


--How is our Prodcut categories are performing?
--Below query showcases the categories performance.

Select 
	pc.EnglishProductCategoryName AS product_category,
        SUM(f.SalesAmount) AS total_sales
From DimProduct p
inner join DimProductSubcategory ps on p.ProductSubcategoryKey = ps.ProductSubcategoryKey
inner join DimProductCategory pc on ps.ProductCategoryKey = pc.ProductCategoryKey
inner join FactInternetSales f on f.ProductKey = p.ProductKey
Group by pc.EnglishProductCategoryName
Order by SUM(f.SalesAmount) DESC