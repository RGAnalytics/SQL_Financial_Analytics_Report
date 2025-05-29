# SQL_Financial_Analytics_Report
Generating financial report for Atliq hardware (Imaginary) as tasked by the product owner of the company. 

Full documentation can be found here:https://www.notion.so/Atliq-Hardware-169f74a7e49d808da9c2c85a49781edc?pvs=4

Generate a report of individual product sales (aggregated on a monthly basis at the product code level) for Croma India customers for fiscal year 2021.
# Business Model

- Atliq Hardware - Let us understand the  domain before generating the report
    
    Atliq is a consumer goods company that sells hardware like PC, mouse, printers, so on to different customers. These stores than sells the hardwares to the consumers.
    
    For Atliq the customer is the stores, consumer is consuming the product.
    
    The company has its manufacturing unit from there it goes to warehouses and shipped to different countries.
    
    There are two types of customers for Atliq
    
    - Brick & Mortar : Croma, Best Buy, etc
    - E-Commerce: Amazon, Flipkart

## Understanding Concept of Financial Statements (P&L)

- Gross Price - Total price of a product before any discounts or deduction.
**Example:** Atliq Hardware sells a laptop for ₹50,000.
    
    **Gross Price = ₹50,000**
    
- Pre-Invoice Deduction - These are discounts or rebates applied before the invoice is generated.
    
    **Example:** A customer gets a **10% discount** on the laptop.
    
    **Pre-Invoice Deduction = ₹5,000**
    
    **Price After Pre-Invoice Deduction = ₹50,000 - ₹5,000 = ₹45,000**
    
- Post-Invoice Deduction - These are deductions applied after the invoice, such as promotional discount or adjustments.
    
    **Example:** After the invoice, Atliq offers an additional **₹2,000 cashback** for a festive sale.
    **Post-Invoice Deduction = ₹2,000**
    
    **Price after deduction = ₹45,000 - ₹2,000 = ₹43,000**
    
- Net Sales - This is the actual amount Atliq Hardware receives after all deductions (both pre-invoice and post-invoice).
    
    **Example: Net Sales = ₹43,000**
    
- COGS (Cost of Goods Sold) - This is the cost Atliq Hardware incurs to produce or purchase the laptop. It includes material, labor, and overhead costs.
    
    **Example:** The cost to produce the laptop is **₹30,000.**
    
    **COGS = ₹30,000**
    
- Profit or Gross Margin - This is the profit made after subtracting the cost of goods sold (COGS) from Net Sales.
    
     **Example: Gross Margin = Net Sales - COGS = ₹43,000 - ₹30,000 = ₹13,000**
    
- Gross Margin Percentage - This shows how profitable Atliq Hardware is on this sale as a percentage of Net Sales.
    
    **Formula: Gross Margin % = (Gross Margin ÷ Net Sales) × 100**
    
    **Example: Gross Margin % = (₹13,000 ÷ ₹43,000) × 100 ≈ 30.23%**

  ## Task

1. Report 1- The report should have the following fields
    - Month
    - Product Name
    - Variant
    - Sold Quantity
    - Gross Price per Item
    - Gross Price Total
2. Gross monthly total sales report for Croma - The report should have the following fields,
    - Month
    - Total gross sales amount to Croma India in this month
  
## Techniques and Functions Used

- To focus exclusively on **Croma**, customer codes were extracted from the `dim_customer` table by applying a filter that identifies customers whose names contain "Croma" and are part of the **Indian market**. The SQL `LIKE` operator was used for pattern matching, ensuring flexibility in identifying relevant records.
- **Converting Calendar Year to Fiscal Year**
    - Atliq Hardware follows a **fiscal year starting in September** (September = Month 1 for the company).
    - To handle this, the SQL function `DATE_ADD()` was used to shift calendar dates, and the `YEAR()` function extracted fiscal years.

- Additionally I Created a User-defined function named `get_fiscal_year()` for frequent reuse.
- **Detailed Sales Analysis for FY**
    - A `User-defined` SQL function `get_fiscal_quarter()`was implemented to focus on specific fiscal quarters (e.g., Q4).

- **Joins**
    - Data from the `fact_sales_monthly` table was joined with the `dim_product` table to include product names and variants.
    - A join with the `fact_gross_price` table provided the gross price per item and calculated the total gross price for each transaction.
 
## Summary

- This project demonstrates my ability to:
    - Analyze customer-specific sales data for defined timeframes.
    - Use SQL efficiently by creating reusable **user-defined functions (UDFs)**.
    - Perform advanced data transformations and **joins** to enrich datasets.
    - Deliver comprehensive **gross sales reports** with accurate metrics.
- **Tools Used**: Joins, User-defined functions, In-built function such as round, year, date_add, etc
