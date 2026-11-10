-- 1. Profit by region and category
SELECT region, category, ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM orders
GROUP BY region, category
ORDER BY total_profit;

-- 2. Monthly sales and profit
SELECT month,
       ROUND(SUM(sales)::numeric, 2)  AS sales,
       ROUND(SUM(profit)::numeric, 2) AS profit
FROM orders
GROUP BY month
ORDER BY month;

-- 3. Top 10 customers by sales
SELECT customer_name,
       ROUND(SUM(sales)::numeric, 2)  AS sales,
       ROUND(SUM(profit)::numeric, 2) AS profit
FROM orders
GROUP BY customer_name
ORDER BY SUM(sales) DESC
LIMIT 10;

-- 4. Profit by discount band
SELECT CASE WHEN discount = 0 THEN 'No discount'
            WHEN discount <= 0.2 THEN 'Up to 20%'
            ELSE 'Above 20%' END AS discount_band,
       ROUND(SUM(profit)::numeric, 2) AS total_profit,
       COUNT(*) AS orders
FROM orders
GROUP BY 1
ORDER BY 1;
