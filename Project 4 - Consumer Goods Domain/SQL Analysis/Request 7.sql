/* 7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month . This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
				    Month
				    Year
				    Gross sales Amount */
--fact_sales_monthly, dim_customer, fact_gross_price

Select 
    DateName(month,s.date) as Month, 
    Year(s.date) as Year, 
    cast(round(SUM(p.gross_price * s.sold_quantity),2) as float) as Gross_sale_amount

From fact_sales_monthly as s
Join dim_customer as c on c.customer_code = s.customer_code
Join fact_gross_price as p on p.product_code = s.product_code

Where c.customer = 'Atliq Exclusive'

Group by DateName(month,s.date), Year(s.date)
Order by Year, Month;

