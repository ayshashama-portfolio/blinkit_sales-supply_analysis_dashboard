# Blinkit Sales & Supply Analysis Dashboard

An interactive Power BI dashboard that connects sales performance with supply-side risk for a quick-commerce grocery business, built on 13,000 product listings across 8 categories, 28 brands and 10 Indian cities (Oct 2023 – Oct 2025).

## Tech Skills

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Power Query](https://img.shields.io/badge/Power%20Query-217346?style=for-the-badge)
![DAX](https://img.shields.io/badge/DAX-742774?style=for-the-badge)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Data Modeling](https://img.shields.io/badge/Data%20Modeling-FF6C61?style=for-the-badge)
![Supply Chain Analysis](https://img.shields.io/badge/Supply%20Chain%20Analysis-2E8B57?style=for-the-badge)
![Sales Analysis](https://img.shields.io/badge/Sales%20Analysis-8A2BE2?style=for-the-badge)

## Problem

Quick-commerce businesses like Blinkit promise delivery in minutes, so they have to balance two things at once: **selling** the right products and **keeping supply healthy** (fresh stock, on-time delivery). Sales teams and operations teams usually look at separate reports, so questions that need both views go unanswered:

1. Which categories and product types (organic vs regular) bring in the revenue and profit?
2. Where is delivery slowing down, and is packaging or location the cause?
3. How much stock is at risk of expiring soon?
4. Do promotional offers actually increase sales?

## Solution

A one-page interactive Power BI dashboard that puts sales and supply side by side, with slicers for **city, category, brand and offer type**.

![Blinkit Sales & Supply Dashboard](https://github.com/user-attachments/assets/216de1e0-d6f3-43b0-8d1f-8b6ddec20a69)

**Dashboard visuals**

| Visual | Business question |
|---|---|
| KPI cards: Total Revenue, Total Profit, Avg Delivery Time, Rating | How is the business doing overall? |
| Revenue by Organic vs Regular (donut) | How much do organic products contribute? |
| Demand vs. Sales Gap (column + line by category) | Is supply meeting demand in each category? |
| Logistics Friction Analysis (delivery time by packaging and status) | Which packaging types are linked to delays? |
| Stock Exposure by Category (by shelf-life band) | How much stock is close to expiry? |
| Revenue over time (Year → Month drill-down) | How is revenue trending? |

**Data transformation and modelling** (full code in [`docs/power_query.m`](docs/power_query.m) and [`docs/dax_measures.md`](docs/dax_measures.md))

- Set data types for all 25 columns in Power Query.
- Replaced the boolean `is_organic` with readable **Organic / Regular** labels.
- Created a **Shelf Life Category** column with DAX `SWITCH`: Critical (≤ 30 days), Short-Term (31–180 days), Stable (> 180 days).
- Extracted **Year** and **Month** from `date_added` for the time drill-down.
- Built **Total Revenue** and **Total Profit** with `SUMX`, so each product's own price, quantity and margin are used, plus **Avg Delivery Time**.

## Key Metrics Tracked

- Total Revenue (final price × units sold) and Total Profit (revenue × product margin)
- Profit margin, average delivery time, on-time vs delayed deliveries
- Revenue by category, organic vs regular, offer type and city
- Stock by shelf-life band; units sold vs demand index by category

## Key Insights Found

- **Revenue of ₹509.0M with ₹115.2M profit (22.6% margin).** Average delivery time is 27.6 minutes and the average product rating is 4.2 / 5.
- **Two categories drive 43% of revenue.** Household (₹120.6M, 23.7%) and Personal Care (₹99.8M, 19.6%) lead, well ahead of Dairy (7.0%) and Snacks (7.3%). Margins are flat at about 22.5% in every category, so revenue share equals profit share.
- **Organic products bring in 24.4% of revenue.** Regular products bring in the other 75.6%.
- **Delays depend on the city, not the packaging.** One in five deliveries (20.0%) is delayed. By packaging, the delay rate only ranges from 18.3% (Jar) to 21.5% (Box), and average delivery time stays between 27.3 and 27.9 minutes. By city, it ranges from 11.9% in Pune to 31.1% in Lucknow and 28.5% in Jaipur.
- **38% of stock is at expiry risk.** 38.2% of units in stock have a shelf life of 30 days or less (Critical), but these products generate only 28.8% of revenue.
- **Offers barely change sales.** Products with an offer sell 1.2% more units on average than products without one (about 163 vs 161.5 units), and products with a discount sell the same as those without (162.4 vs 162.5). The promotions cost margin without lifting volume.

## Recommendations

1. **Fix last-mile delivery in Lucknow and Jaipur first.** Their delay rates are 2.5× Pune's, so the problem is local operations, not packaging.
2. **Cut critical shelf-life stock** in categories where it piles up, or move it with targeted clearance offers before it expires.
3. **Review the promotion budget.** Offers in their current form don't increase units sold; test fewer, targeted offers and measure the lift.
4. **Protect Household and Personal Care availability**, since they carry 43% of revenue.

## Data Limitations

- The dataset appears to be **simulated**: categories, cities and offer types are almost evenly spread and margins are nearly identical, so insights show the analysis method rather than real Blinkit performance.
- Each row is a product listing with cumulative sales, not individual orders, so customer behaviour and basket size can't be analysed.
- 2023 (Oct–Dec) and 2025 (Jan–Oct) are partial years, so year-on-year revenue comparisons are not like-for-like.

## Tech Stack

- **Power BI Desktop** — data model, visuals and interactivity
- **Power Query** — data typing and cleaning
- **DAX** — measures and calculated columns
- **Excel** — source data

## Project Structure

```
blinkit_sales-supply_analysis_dashboard/
├── data/blinkit_dataset.xlsx                      # source data (13,000 rows, 25 columns)
├── powerbi/blinkit_sales_supply_dashboard.pbix    # Power BI report
├── docs/
│   ├── dax_measures.md                            # all measures and calculated columns
│   └── power_query.m                              # Power Query cleaning steps
└── README.md
```

## How to Use

1. Download `powerbi/blinkit_sales_supply_dashboard.pbix`.
2. Open it in Power BI Desktop (free download from Microsoft).
3. If asked, point the data source to `data/blinkit_dataset.xlsx` (**Transform data → Data source settings**).
4. Use the City, Category, Brand and Offer Type slicers to explore.

## Future Improvements

- Add a **Delay rate by city** page and a **Profit Margin %** KPI (DAX ready in [`docs/dax_measures.md`](docs/dax_measures.md)).
- Add a what-if parameter to estimate the profit gained by cutting discounts that don't lift sales.
- Publish to the web so the dashboard can be explored without Power BI Desktop.

## Author

**Aysha Shama** · Data Analyst

[![Portfolio](https://img.shields.io/badge/Portfolio-2F80ED?style=for-the-badge&logo=googlechrome&logoColor=white)](https://ayshashamamusamil.netlify.app/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/aysha-shama-b5029a229/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:ayshashama003@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ayshashama-portfolio)
