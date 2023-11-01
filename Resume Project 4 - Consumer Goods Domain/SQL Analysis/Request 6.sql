/* Request 6.Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields:
								customer_code
								customer
								average_discount_percentage */

Select top (5) i.customer_code, c.customer, avg(i.pre_invoice_discount_pct) as average_discount_percent 
From fact_pre_invoice_deductions as i
Join dim_customer as c
ON c.customer_code = i.customer_code
Where i.pre_invoice_discount_pct > (Select AVG(pre_invoice_discount_pct)From fact_pre_invoice_deductions) 
          And c.market ='India'
	    And i.fiscal_year = 2021
Group by i.customer_code, c.customer
Order by average_discount_percent desc;

