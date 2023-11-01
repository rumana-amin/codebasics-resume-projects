-- Request 1. Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region.

Select distinct customer, market, region

From dim_customer

Where customer = 'Atliq Exclusive' And region = 'APAC'

Order by market;

