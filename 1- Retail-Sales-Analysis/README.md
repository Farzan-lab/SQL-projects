# Retail Sales Analysis – SQL Project

## 📌 Project Overview

**Project Title:** Retail Sales Analysis using SQL  
**Role Target:** Data Analyst / Business Analyst (Entry–Junior Level)  
**Database:** PostgreSQL  
**Main Table:** `retail_sales`

This project demonstrates my practical SQL skills by analysing a retail sales dataset end-to-end. The focus is on **data cleaning, exploratory data analysis (EDA), aggregation, window functions, and business-driven insights**, following patterns commonly expected in real-world analytics roles and technical interviews.

---

## 🎯 Project Objectives

- Clean and prepare transactional retail data for analysis
- Apply SQL techniques used in real analytics workflows
- Answer business questions using aggregation and window functions
- Demonstrate structured problem-solving and analytical thinking

---

## 🗂 Dataset Description

The `retail_sales` table contains transactional-level retail data including:

- Transaction details (ID, date, time)
- Customer information (ID, age, gender)
- Product details (category, quantity, unit price)
- Financial metrics (COGS, total sales value)

---

## 🧹 Data Cleaning

Data quality checks were performed before analysis. Records with missing critical values were removed to ensure accuracy and reliability.

**Cleaning logic applied:**
- Removed rows with `NULL` values in transaction, customer, date, pricing, or sales columns
- Ensured only complete transactions were used in analysis

This reflects real-world scenarios where analysts must validate and clean raw datasets before deriving insights.

---

## 🔍 Exploratory Data Analysis (EDA)

Initial exploration focused on understanding dataset structure and scale:

- Total number of transactions
- Total number of sales records
- Number of unique customers

These checks help validate data consistency and provide context for deeper analysis.

---

## 📊 Business Analysis & SQL Queries

The following business questions were answered using SQL:

### 1️⃣ Daily Sales Analysis
- Calculated total sales for a specific date
- Applied currency formatting for reporting

### 2️⃣ Category-Specific Transactions
- Identified high-quantity Clothing transactions during November 2022

### 3️⃣ Category Performance
- Calculated total sales volume per category
- Ranked categories by transaction count

### 4️⃣ Customer Demographics
- Computed the average age of customers purchasing from the Beauty category

### 5️⃣ High-Value Transactions
- Identified transactions with total sales greater than $1,000

### 6️⃣ Gender & Category Distribution
- Analysed transaction counts by gender across product categories

### 7️⃣ Monthly & Seasonal Sales Analysis
- Calculated average and total sales per month
- Used **window functions (RANK)** to identify the best-selling month in each year

### 8️⃣ Top Customers Analysis
- Identified the top 5 customers based on total sales value

### 9️⃣ Cross-Category Buyers
- Found customers purchasing across multiple product categories

### 🔟 Sales by Time of Day
- Classified transactions into Morning, Afternoon, and Evening shifts
- Analysed order volume by shift

### ➕ Additional Insight
- Identified customers whose total lifetime spending exceeded $500

---

## 🛠 SQL Skills Demonstrated

- `GROUP BY`, `HAVING`, `ORDER BY`
- Aggregate functions: `SUM`, `AVG`, `COUNT`
- Window functions: `RANK() OVER (PARTITION BY …)`
- Common Table Expressions (CTEs)
- Date & time functions
- Conditional logic with `CASE WHEN`
- Data cleaning with `DELETE` and `NULL` checks

---

## 📈 Key Findings

- Sales performance varies significantly across months, indicating seasonality
- A small group of customers contributes a large share of total revenue
- Certain product categories consistently outperform others
- Evening hours show higher order volumes, suggesting peak shopping periods

---

## 📁 How to Use This Project

1. Clone the repository
2. Create the `retail_sales` table in PostgreSQL
3. Load the dataset
4. Run the SQL scripts in sequence:
   - Data Cleaning
   - Exploratory Data Analysis
   - Business Analysis Queries

---

## 👤 Author

**Farzan Momayezi**  
Master’s Student – Data Science  
Aspiring Data Analyst / Business Analyst

This project is part of my professional portfolio and demonstrates my ability to apply SQL to real business problems. Feedback and collaboration are always welcome.

---

## 🚀 Why This Project Matters for Interviews

- Mirrors real analytics tasks, not just academic queries
- Demonstrates clean, structured SQL practices
- Shows ability to translate business questions into data insights
- Highlights readiness for entry-level data analyst roles

⭐ *If you find this project useful, feel free to star the repository.*
