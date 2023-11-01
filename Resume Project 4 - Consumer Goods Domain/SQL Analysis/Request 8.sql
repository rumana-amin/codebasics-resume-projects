/* 8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity.
		Quarter
		total_sold_quantity */
		--Note that fiscal_year for Atliq Hardware starts from September(09).

Select 
    DateName(quarter, date) as Quarter, 
    Sum(sold_quantity) as total_sold_quantity

From fact_sales_monthly

Where fiscal_year = 2020

Group by DateName(quarter, date)
Order By total_sold_quantity desc;



-- Differnet fiscal year than calendar year
Select 
CASE
    When date between '2019-09-01' and '2019-11-31' Then 1
    When date between '2019-12-01' and '2020-02-28' Then 2
    When date between '2020-03-01' and '2020-05-31' Then 3
    When date between '2020-06-01' and '2020-08-31' Then 4
    End As Quarter,
    Sum(sold_quantity) as total_sold_quantity
From fact_sales_monthly
Where fiscal_year = 2020

Group by CASE
    When date between '2019-09-01' and '2019-11-31' Then 1
    When date between '2019-12-01' and '2020-02-28' Then 2
    When date between '2020-03-01' and '2020-05-31' Then 3
    When date between '2020-06-01' and '2020-08-31' Then 4
    End
Order By total_sold_quantity desc;