
-- Step 1: Retrieve customer codes for Croma India
	SELECT * FROM dim_customer WHERE customer like "%croma%" AND market="india";

-- Step 2: Fetch all sales transaction data for customer Croma (Customer Code: 90002002) from the fact_sales_monthly table for the fiscal year 2021
	SELECT * FROM fact_sales_monthly 
	WHERE 
            customer_code=90002002 AND
            YEAR(DATE_ADD(date, INTERVAL 4 MONTH))=2021 
	ORDER BY date asc
	LIMIT 100000;

-- Additional user defined function to fetch data for specific quarter

Select * from fact_sales_monthly
where 
	customer_code=90002002 and
    get_fiscal_year(date)=2021 and
    get_fiscal_quarter(date)="Q4"
order by date asc

### Gross Sales Report: Monthly Product Transactions

-- Performing joins to pull product, variant from dim_product table
	SELECT s.date as month, s.product_code, p.product, p.variant, s.sold_quantity 
	FROM fact_sales_monthly s
	JOIN dim_product p
        ON s.product_code=p.product_code
	WHERE 
            customer_code=90002002 AND 
    	    get_fiscal_year(date)=2021     
	LIMIT 1000000;

-- b. Performing join with 'fact_gross_price' table to get Gross price per Item and Gross Price total
	SELECT 
    	    s.date as month, 
            s.product_code, 
            p.product, 
            p.variant, 
            s.sold_quantity, 
            g.gross_price,
            ROUND(s.sold_quantity*g.gross_price,2) as gross_price_total
	FROM fact_sales_monthly s
	JOIN dim_product p
            ON s.product_code=p.product_code
	JOIN fact_gross_price g
            ON g.fiscal_year=get_fiscal_year(s.date)
    	AND g.product_code=s.product_code
	WHERE 
    	    customer_code=90002002 AND 
            get_fiscal_year(s.date)=2021     
	LIMIT 1000000;

