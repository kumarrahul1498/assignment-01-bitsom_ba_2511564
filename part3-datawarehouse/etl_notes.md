## ETL Decisions

### Decision 1 — Standardized mixed date formats
Problem: The raw `date` column used multiple formats such as `29/08/2023`, `12-12-2023`, and `2023-02-05`, which makes grouping and filtering unreliable.
Resolution: I converted all dates into ISO format (`YYYY-MM-DD`) before loading and built `dim_date` using those cleaned values.

### Decision 2 — Normalized category values
Problem: The `category` field had inconsistent casing and naming such as `electronics`, `Electronics`, `Grocery`, and `Groceries`.
Resolution: I standardized the values into a controlled set: `Electronics`, `Clothing`, and `Grocery`. This prevents duplicate categories in BI reports.

### Decision 3 — Resolved missing store city values
Problem: Some records had NULL `store_city` values even though the `store_name` clearly identified the location, such as `Mumbai Central` or `Chennai Anna`.
Resolution: I inferred the missing city from the store name and loaded a single clean row per store into `dim_store`, ensuring referential consistency in the warehouse.
