/* 9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields:
					  channel
					  gross_sales_mln
					  percentage */

--fact_gross_price, dim_customer, fact_sales_monthly

With cte as
    (
    Select c.channel, 
	  SUM(p.gross_price * s.sold_quantity)/1000000 as gross_sales_mln

    From fact_sales_monthly as s
    Inner Join dim_customer as c on c.customer_code = s.customer_code 
    Inner Join fact_gross_price as p on p.product_code = s.product_code
    
    Where s.fiscal_year = 2021
    Group by c.channel
    )

SELECT 
    channel, 
    cast(round(gross_sales_mln,2) as float) as gross_sales_mln ,
    cast(round((gross_sales_mln / (SUM(gross_sales_mln) OVER ()) * 100),2) as float )  AS contribution_percentage   
FROM cte
Order by contribution_percentage desc;

