Project Overview

At Mint Classics Company, I contributed to the analysis of a relational database as an entry-level data analyst, supporting strategic decisions regarding inventory management that ultimately led to the closure of a storage facility. This project showcased my SQL proficiency and its practical application in inventory optimization. My goal was to analyze warehouse data, understand product inventory distribution, and provide actionable recommendations to enhance inventory control. This experience highlights my capability for data-driven decision-making to improve the strategic and operational effectiveness of inventory management.
Project Objectives

 1. Explore products currently in inventory.
 2. Identify factors influencing inventory reorganization/reduction.
 3. Provide analytic insights and data-driven recommendations.

Task 1: Import Classic Car Model Database

1. Download the mintclassicsDB.sql file containing the script to create and populate the Mint Classics relational database.
2. Use the "Import from Self-Contained File" option in MySQL Workbench to create the Mint Classics database. The script includes commands to create the schema (named "mintclassics"), tables, fields, primary and foreign keys, and the data. After running the script, you will have a nine-table relational database populated with data from Mint Classics Company.

Task 2: Understanding the Mint Classics Database and Business Processes

1. Identify the total number of warehouses and their capacity:
        Mint Classics has four warehouses, each with a unique code, name, and current capacity in percent. Warehouse C is notable for its ample space, currently filled at only 50%.
2. Identify the total number of products offered:
        The company has a diverse inventory of 110 distinct products.
3. Determine if any products are stored in multiple warehouses:
        No products are stored across multiple warehouses. Each warehouse exclusively stores specific product lines.
4. Identify the unique product count and total stock in each warehouse:
        Warehouse B has an impressive inventory with 38 different products and a combined stock of 219,183 units, making it the warehouse with the highest storage capacity.
5. Identify which product lines are stored in each warehouse:
         Warehouse A (North): Planes (12 products) and Motorcycles (13 products) - 25 total products.
         Warehouse B (East): Classic Cars - 38 products.
         Warehouse C (West): Vintage Cars - 24 products.
         Warehouse D (South): Trucks + Buses (11 products), Ships (9 products), and Trains (3 products) - 23 total products.
6. Determine the product lines with the highest and lowest number of sales.

Task 3: Investigating Business Issues and Identifying Affected Tables
  1. Mint Classics aims to close one of its warehouses. To address this, I identified relevant tables and used SQL queries to gather necessary information.
  2. Created a temporary table to evaluate the difference between product stock and inventory remaining after fulfillment (shipped and resolved orders). This helps identify overstocked, appropriately stocked, and understocked items.
  3. Determine the quantity of well-stocked, overstocked, and understocked products in each warehouse:
     Warehouse B has the highest quantity of overstocked products (29 items).
     Warehouse A and Warehouse C each have 19 overstocked products.
  4. Analyze product lines to identify those with the highest sales percentages and gain insights into inventory and sales performance.

Task 4: Warehouse Consolidation Recommendation

1. Analysis revealed that Warehouse B, housing Classic Cars, had the lowest sales performance and the highest quantity of overstocked products. Despite this, Warehouse B has an impressive inventory with 38 products and a combined stock of 219,183 units, making it the facility with the highest storage capacity.
2. Warehouse C has the lowest storage capacity and currently operates at just 50% capacity, indicating significant unused space.
3. Recommendation: Close Warehouse C and reallocate its inventory to Warehouse B. This strategic consolidation maximizes Warehouse B's storage capacity and streamlines inventory management by consolidating similar product lines.

Benefits of Consolidation:

1. Optimized Space Utilization: Redistributing inventory from Warehouse C to Warehouse B capitalizes on the latter's extensive storage capacity, reducing operational inefficiencies.
2. Streamlined Operations: Consolidating warehouses simplifies inventory management processes, reducing complexity and enhancing operational efficiency.
3. Cost Savings: Eliminating redundant overhead costs associated with maintaining multiple warehouses leads to potential cost savings in operational expenditures and facility maintenance.

In conclusion, consolidating Warehouse C's inventory into Warehouse B enhances efficiency, reduces costs, and optimizes inventory management practices. This recommendation aligns with the objective of maximizing operational effectiveness and leveraging resources for sustained growth and success.
