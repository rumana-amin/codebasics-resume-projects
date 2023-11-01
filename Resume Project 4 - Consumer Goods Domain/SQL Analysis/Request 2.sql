
/* Request 2. What is the percentage of unique product increase in 2021 vs. 2020?
The final output contains these fields: unique_products_2020, unique_products_2021, percentage_chg */

With products_2020 as
    (
    Select COUNT(distinct product_code) as A
    From fact_sales_monthly
    Where fiscal_year = 2020
    ),
products_2021 as
    (
    Select COUNT(distinct product_code) as B
    From fact_sales_monthly
    Where fiscal_year = 2021
    )

Select 
    A as unique_products_2020,  
    B as unique_products_2021, 
    format(round((B-A)* 100.0/A, 2), 'N2')  as percentage_chg

From products_2020,products_2021;

