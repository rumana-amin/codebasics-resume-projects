/* 10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these fields:
		division,
		product_code,
		product, total_sold_quantity, rank_order */

Select Top(3) 
		p.division,
		p.product_code, 
		p.product, 
		SUM(s.sold_quantity) as total_sold_quantity, 
		ROW_NUMBER() OVER (partition by p.division ORDER BY SUM(s.sold_quantity) DESC) AS rank_number

From fact_sales_monthly as s
Inner Join dim_product as p on p.product_code = s.product_code

Where s.fiscal_year = 2021

Group by p.division, p.product_code, p.product
Order by total_sold_quantity desc;
