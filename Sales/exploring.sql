SELECT * FROM sales;

SELECT Store, YEAR(`Date`) AS sales_year, WEEK(`Date`, 1) AS sales_week, SUM(Weekly_Sales) AS total_weekly_sales
FROM sales
GROUP BY Store, YEAR(`Date`), WEEK(`Date`, 1)
ORDER BY Store, sales_year, sales_week;

SELECT 
    Store,
    MONTH(`Date`) AS sales_month,
    YEAR(`Date`) AS sales_year,
    ROUND( SUM(Weekly_Sales),2) AS Monthly_Sales
FROM sales
GROUP BY Store,MONTH(`Date`),YEAR(`Date`)
ORDER BY Store,sales_year,sales_month ;

WITH Total_yearly_sales AS
(
    SELECT 
        store,
        YEAR(`Date`) AS sales_year,
        SUM(Weekly_Sales) AS yearly_sales
    FROM sales
    GROUP BY Store,YEAR(`Date`)
),
Store_Average_Sales AS(
    SELECT 
        Store,
        ROUND(AVG(yearly_sales),2) AS Avg_sales
    FROM Total_yearly_sales
    GROUP BY Store
)
SELECT * FROM Store_average_sales
ORDER BY avg_sales DESC;
    

SELECT * FROM features AS f
JOIN sales AS s
ON f.IsHoliday=s.IsHoliday 
LIMIT 10;