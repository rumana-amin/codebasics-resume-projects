/* Request 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?
The final output contains these fields: segment, product_count_2020, product_count_2021, difference */

With products_2020 as
    (
    Select p.segment, COUNT(distinct s.product_code) as A
    From fact_sales_monthly as s
    Inner Join dim_product as p ON p.product_code = s.product_code
    Where s.fiscal_year = 2020
    Group by p.segment
    ),
products_2021 as
    (
    Select p.segment, COUNT(distinct s.product_code) as B
    From fact_sales_monthly as s
    Inner Join dim_product as p ON p.product_code = s.product_code
    Where fiscal_year = 2021
    Group by p.segment
    )

Select products_2020.segment,
    A as unique_products_2020,  
    B as unique_products_2021, 
    B-A as differnce

From products_2020
Inner Join products_2021 ON products_2020.segment = products_2021.segment;
