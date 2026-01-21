--creating an table name is retail_sales
create table product_sales(
 transaction_id INT PRIMARY KEY,	
 sale_date DATE,	 
 sale_time TIME,	
 customer_id INT,
 gender VARCHAR(15),
 age INT,
 category VARCHAR(15),	
 quantity	INT,
 price_per_unit FLOAT,	
 cogs	FLOAT,
 total_sale FLOAT
)
--show all product_sales table data
SELECT * FROM product_sales;

--complete above step we import file data going database->click schemas->tables right ckick->importfile and save

-- calculate total count of product_sales in table
select count(*) from product_sales;

--show which column is contain null
SELECT * FROM product_sales
WHERE 
    transaction_id IS NULL OR sale_date IS NULL
    OR 
    sale_time IS NULL  OR gender IS NULL
    OR
    category IS NULL OR quantity IS NULL
    OR
    cogs IS NULL  OR  total_sale IS NULL;

--delete the null in product sales
DELETE FROM product_sales
WHERE 
    transaction_id IS NULL OR sale_date IS NULL
    OR 
    sale_time IS NULL  OR gender IS NULL
    OR
    category IS NULL OR quantity IS NULL
    OR
    cogs IS NULL  OR  total_sale IS NULL;

	
--another time we check the total sales rows
select count(*) from product_sales;

--through this we can check how many unique customer_id we have
SELECT COUNT( distinct customer_id) as total_sale FROM product_sales;

--check unique category in table
select distinct category from product_sales

--Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
select * from product_sales where sale_date='2022-11-05';

--Q.2 calculate customer ordered by age less than 20(youngest first)
SELECT *FROM product_sales where age<21
ORDER BY age ASC;

--Q.3 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
select * from product_sales where category = 'Clothing' and TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' and quantity>=4 ;

--Q.4 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) as net_sale, COUNT(*) as total_orders
FROM product_sales GROUP BY 1;

--Q.5 calculate quantity in sales equal to 1,2,3
SELECT *FROM product_sales WHERE quantity IN (1,2, 3)
order by quantity asc;

--Q.6 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(customer_id),2) from product_sales where category ='Beauty';

--Q.7 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from product_sales where total_sale>1000 ;

--Q.8 calculate sales between 10 to 11
SELECT *FROM product_sales WHERE sale_time BETWEEN '10:00:00' AND '11:00:00' ;

--Q.9 In this we calculate total profit by each category
SELECT category,SUM(total_sale-cogs) AS total_profit
FROM product_sales
GROUP BY category;

--Q.10 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category,gender,COUNT(*)
FROM product_sales
GROUP BY category,gender
ORDER BY 1;

--Q.11 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT *
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM product_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1;

--Q.12 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM product_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

--Q13 calculate total quantity sold
select sum(quantity) as total_quantity_sold from product_sales ;

--Q.14 Write a SQL query to find the number of unique customers who purchased items from each category.
select category,count (distinct customer_id) as cst_unique  from product_sales group by category;

-- Q.15 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
with hourly_sale
as
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM product_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift

--End of project
