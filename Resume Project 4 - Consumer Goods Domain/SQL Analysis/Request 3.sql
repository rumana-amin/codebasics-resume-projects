/* Request 3. Provide a report with all the unique product counts for each segment and sort them in descending order of product counts.
The final output contains 2 fields: segment and  product_count */
    
Select segment, 
    count(product_code) as product_count
   
From dim_product

Group by segment

Order by product_count desc;

