# DAX Measures and Calculated Columns

All measures live on the `blinkit_dataset` table in [`powerbi/blinkit_sales_supply_dashboard.pbix`](../powerbi/blinkit_sales_supply_dashboard.pbix).

## Measures

| Measure | DAX | What it answers |
|---|---|---|
| Total Revenue | `SUMX('blinkit_dataset', 'blinkit_dataset'[final_price] * 'blinkit_dataset'[sold_quantity])` | Revenue after discount, row by row (price × units), then summed |
| Total Profit | `SUMX('blinkit_dataset', ('blinkit_dataset'[final_price] * 'blinkit_dataset'[sold_quantity]) * ('blinkit_dataset'[profit_margin_pct] / 100))` | Profit using each product's own margin, not an average margin |
| Avg Delivery Time | `AVERAGE('blinkit_dataset'[delivery_time_min])` | Average minutes from order to delivery |

`SUMX` is used instead of `SUM` because revenue and profit must be calculated per row (each product has its own price, quantity and margin) before being added up.

## Calculated columns

| Column | DAX | Purpose |
|---|---|---|
| Shelf Life Category | `SWITCH(TRUE(), 'blinkit_dataset'[shelf_life_days] <= 30, "Critical", 'blinkit_dataset'[shelf_life_days] <= 180, "Short-Term", "Stable")` | Groups products by spoilage risk for the stock exposure chart |
| year | `YEAR(blinkit_dataset[date_added])` | Year level of the time drill-down |
| month | `MONTH(blinkit_dataset[date_added])` | Month level of the time drill-down |

## Suggested additions (v2)

```DAX
Profit Margin % = DIVIDE ( [Total Profit], [Total Revenue] )

Avg Rating = AVERAGE ( 'blinkit_dataset'[rating] )

Delayed Delivery % =
DIVIDE (
    CALCULATE ( COUNTROWS ( 'blinkit_dataset' ), 'blinkit_dataset'[delivery_status] = "Delayed" ),
    COUNTROWS ( 'blinkit_dataset' )
)

Critical Stock % =
DIVIDE (
    CALCULATE ( SUM ( 'blinkit_dataset'[stock] ), 'blinkit_dataset'[Shelf Life Category] = "Critical" ),
    SUM ( 'blinkit_dataset'[stock] )
)
```
