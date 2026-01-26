# Blinkit Sales & Supply Analysis Dashboard 
![blinkit data analysis project](https://github.com/user-attachments/assets/216de1e0-d6f3-43b0-8d1f-8b6ddec20a69)

### Overview
This Power BI project analyzes both Sales and Supply performance using the Blinkit dataset. The dashboard provides:
* Interactive KPIs and visuals for business-level analysis
* Clean layout focused on readability and decision-making
* Supports filtering and drill-down for detailed exploration

### Tools Used
* Power BI for data modeling and dashboard creation
* Power Query for data cleaning and transformations
* DAX measures for KPI calculations
* Excel as the data source [Source dataset](https://github.com/ayshashama-portfolio/blinkit_sales-supply_analysis_dashboard/blob/main/blinkit_dataset.xlsx)

### Project Scope
* Sales and supply-side performance analysis using transactional and product data
* Comparison of Organic vs Regular products
* Product-level analysis using Shelf Life Categories
* Time-based analysis with Year → Month hierarchy

### Data Transformation & Modeling
* Replaced boolean values in is_organic with Organic / Regular for better readability
* Created Shelf_Life_Category using conditional logic on shelf_life_days column
* Extracted Year and Month from date fields to enable drill-down analysis
* Created 4 custom DAX measures to represent key KPIs displayed on the dashboard
