# Product-sales-report
Retail Sales Analysis using PostgreSQL – Data cleaning, exploratory analysis, and business insights derived from transactional retail sales data using SQL.

📌 Project Overview
This project focuses on analyzing retail sales data using PostgreSQL.
The goal is to perform data cleaning, exploration, and business-oriented analysis through SQL queries to extract meaningful insights from transactional sales data.

*1. Tools & Technologies

Database: PostgreSQL
Language: SQL
Data Source: CSV file (imported into PostgreSQL)
Environment: pgAdmin



*2. Dataset Description
The dataset contains transactional-level retail sales information with the following columns:

| Column Name    | Description                    |
| -------------- | ------------------------------ |
| transaction_id | Unique ID for each transaction |
| sale_date      | Date of sale                   |
| sale_time      | Time of sale                   |
| customer_id    | Unique customer identifier     |
| gender         | Customer gender                |
| age            | Customer age                   |
| category       | Product category               |
| quantity       | Quantity sold                  |
| price_per_unit | Price per unit                 |
| cogs           | Cost of goods sold             |
| total_sale     | Total sales value              |


*3 Database Schemas

CREATE TABLE product_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);



*4. Data Import

->Imported sales data from CSV using pgAdmin Import/Export feature.
->Verified successful data load using SELECT *.



*5.Data Cleaning

->Checked for NULL values across all important columns.
->Removed records containing missing data to maintain data quality.

DELETE FROM product_sales
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;



*6.Exploratory Data Analysis (EDA)
 Key Analysis Performed

->Total number of transactions
->unique customers & categories
->Date-wise and time-wise sales
->Category-wise revenue & profit
->Customer age analysis
->Gender-based purchase behavior
->Monthly & yearly sales trends
->Top customers by revenue
->Shift-based order distribution   



*7.Business Insights Queries

->Sales on a specific date
-> Youngest customers analysis
-> High-quantity Clothing sales in Nov 2022
-> Total & average sales by category
-> Profit calculation per category
-> Best-selling month per year
-> Top 5 customers by revenue
-> Shift-wise order analysis (Morning / Afternoon / Evening)



*8.Shift-Based Sales Analysis

Orders are categorized into shifts based on sale time:
->Morning: Before 12 PM
->Afternoon: 12 PM – 5 PM
->Evening: After 5 PM

This helps in understanding peak business hours.



*9.Key Outcomes

->Identified top-performing product categories
->Found best sales months per year
->Analyzed customer purchasing behavior
->Calculated profitability across categories
->Determined peak sales shifts



*10.Conclusion

This project demonstrates strong skills in:

=>SQL querying
=>Data cleaning
=>Business analysis
=>Analytical thinking using PostgreSQ
