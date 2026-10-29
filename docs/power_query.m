// Power Query (M) used to load and clean blinkit_dataset
// Exported from powerbi/blinkit_sales_supply_dashboard.pbix
// Update the file path to where data/blinkit_dataset.xlsx is on your computer.

let
    Source = Excel.Workbook(File.Contents("C:\Projects\blinkit_sales-supply_analysis_dashboard\data\blinkit_dataset.xlsx"), null, true),
    Table1_Table = Source{[Item = "Table1", Kind = "Table"]}[Data],

    // 1. Set a data type for each of the 25 columns
    #"Changed Type" = Table.TransformColumnTypes(Table1_Table, {
        {"product_id", Int64.Type}, {"product_name", type text}, {"category", type text},
        {"brand", type text}, {"price", type number}, {"discount_pct", Int64.Type},
        {"final_price", type number}, {"rating", type number}, {"num_reviews", Int64.Type},
        {"delivery_time_min", Int64.Type}, {"city", type text}, {"seller", type text},
        {"stock", Int64.Type}, {"sold_quantity", Int64.Type}, {"profit_margin_pct", type number},
        {"is_organic", type logical}, {"packaging_type", type text}, {"weight_g", Int64.Type},
        {"shelf_life_days", Int64.Type}, {"reorder_level", Int64.Type}, {"demand_index", Int64.Type},
        {"date_added", type date}, {"expiry_date", type date}, {"offer_type", type text},
        {"delivery_status", type text}
    }),

    // 2. Replace TRUE/FALSE in is_organic with readable labels
    #"Changed Type1" = Table.TransformColumnTypes(#"Changed Type", {{"is_organic", type text}}),
    #"Replaced Value" = Table.ReplaceValue(#"Changed Type1", "true", "Organic", Replacer.ReplaceText, {"is_organic"}),
    #"Replaced Value1" = Table.ReplaceValue(#"Replaced Value", "false", "Regular", Replacer.ReplaceText, {"is_organic"}),

    // 3. Make sure stock columns stay whole numbers
    #"Changed Type2" = Table.TransformColumnTypes(#"Replaced Value1", {{"stock", Int64.Type}, {"reorder_level", Int64.Type}})
in
    #"Changed Type2"
