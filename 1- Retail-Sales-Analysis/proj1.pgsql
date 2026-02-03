SELECT COUNT(transaction_id) FROM retail_sales
;
--Data cleaning
-- Delete rows with NULL values in any of the specified columns
delete from retail_sales
where transaction_id is NULL
or sale_date is NULL
or sale_time is nULL
or gender is NULL
or category is NULL
or cogs is NULL
or total_sale is NULL
or price_per_unit is NULL
or customer_id is NULL
;

--Data Exploration 

--how many transaction we hav?
select count(DISTINCT(transaction_id)) as "total transactions" from retail_sales;


--how many sales we have?
select count(DISTINCT(total_sale)) as "total sales" from retail_sales;

--how many unique customers we have?
select count(DISTINCT(customer_id)) as "unique customers" from retail_sales;


--My Analysis and Findings: 
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- retrieve total sales on 2022-01-15
 select TO_CHAR(
        SUM(total_sale),
        'FM$999,999,999.00'
    ) as total_sales_on_jan_15_2022 from retail_sales where sale_date = '2022-01-15'
;

-- Write a SQL query to retrieve all transactions where 
--the category is 'Clothing' and the quantity sold is more than 10 
--in the month of Nov-2022
select  * from retail_sales where category = 'clothing' 
and quantity > 10 and sale_date >= '2022-11-01' and sale_date <= '2022-11-30';

-- Q.3 Write a SQL query to calculate 
--the total sales (total_sale) for each category.

select category, count(total_sale) as total_sales 
from retail_sales group by category order by total_sales desc;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select to_char(avg(age), 'FM999') as average_age from retail_sales where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select transaction_id, total_sale from retail_sales where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id)
select count(transaction_id) as total_transactions from retail_sales;

-- Q.7 Write a SQL query to calculate the average sale for each month.
WITH monthly_sales AS (
    SELECT
        EXTRACT(YEAR FROM sale_date) AS year,
        TO_CHAR(sale_date, 'Month')  AS month_name,
        EXTRACT(MONTH FROM sale_date) AS month_num,
        ROUND(AVG(total_sale), 2)    AS avg_monthly_sale,
        ROUND(SUM(total_sale), 2)    AS total_monthly_sale
    FROM retail_sales
    GROUP BY year, month_name, month_num
),
ranked_months AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY year
               ORDER BY total_monthly_sale DESC
           ) AS rank_in_year
    FROM monthly_sales
)
SELECT
    year,
    TRIM(month_name) AS best_month,
    avg_monthly_sale,
    total_monthly_sale
FROM ranked_months
WHERE rank_in_year = 1
ORDER BY year;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT customer_id, age , SUM(TOTAL_SALE) AS total_sales
from retail_sales
GROUP BY customer_id, age
order by total_sales DESC
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select customer_id, count(DISTINCT category) as unique_categories
FROM retail_sales
GROUP BY customer_id
having count(distinct customer_id) = count(DISTINCT category);


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
with hour_shift
as (
    select *,
        case 
            when extract(hour from sale_time) > 17 then 'evening'
            when extract(hour from sale_time) > 12 then 'afternoon'
            else 'morning'
        end as shift
    from retail_sales
)
select shift, count(transaction_id) as number_of_orders
from hour_shift
group by shift;


-- Additional Query
-- Find out which customers buy more that $500 in total sales
select DISTINCT customer_id, sum(total_sale) as total_sales
from retail_sales
group by customer_id
having sum(total_sale) > 500
order by total_sales desc;