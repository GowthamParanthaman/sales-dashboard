# Sales performance dashboard

Power BI dashboard, built on a PostgreSQL database and a Python cleaning pipeline, that shows where a retail business earns and loses profit.

> **Note:** This project uses a synthetically generated dataset. The numbers and findings below do not describe a real business. The goal is to demonstrate data cleaning, SQL analysis, and dashboard design.

![Dashboard](dashboard/screenshots/dashboard.png)

## Business problem

A retail company sells furniture, office supplies, and technology across five regions in India. Management wants to know:

- How are sales and profit trending month by month?
- Which regions and categories drive profit?
- How do discounts affect profitability?
- Which top customers are actually unprofitable?

## Dataset

- Synthetic Indian retail sales data, 2021 to 2024
- 7,739 order lines (3,400 orders) after cleaning, 20 columns
- Includes deliberate data quality issues for cleaning practice: 30 duplicate rows and 15 missing `Ship Mode` values

## Tools

Python (pandas, matplotlib), PostgreSQL (SQLAlchemy), Power BI, DAX

## Approach

1. **Cleaning (Python):** standardized column names, parsed dates, removed duplicates, created `year`, `month`, `profit_margin_pct`, `delivery_days`.
2. **Exploration (Python):** monthly trends, profit by category, profit by discount level.
3. **SQL (PostgreSQL):** loaded the cleaned data and wrote KPI queries with `GROUP BY` and `CASE WHEN` (see `sql/queries.sql`).
4. **Dashboard (Power BI):** 4 KPI cards, monthly trend, region, category, discount band, top 10 customers, and slicers for year, region, and category.

## Key findings

- **Total sales ₹2.39 crore, profit ₹26.46 lakh, margin 11.1%** across 3,400 orders.
- **Discounts above 20% lose money.** Those order lines produced a net loss of ₹5.60 lakh, while undiscounted lines earned ₹23.65 lakh.
- **Central region is the weakest:** ₹0.38 lakh profit, compared with ₹9.19 lakh in the South.
- **Office Supplies leads profit** (₹15.72 lakh), followed by Technology (₹6.99 lakh) and Furniture (₹3.75 lakh).
- **Sales grew about 60% from 2021 to 2024** (₹46.4 lakh to ₹74.4 lakh), with peaks every October and November.
- **Highest-sales month was November 2023 (₹9.79 lakh), but its profit was only ₹0.15 lakh.**
- **Two top-10 customers by sales are loss-making:** Geetha Nair and Manoj Kulkarni.

## Recommendations

- Cap discounts at 20% unless approved, since deeper discounts consistently destroy profit.
- Review the discount policy in the Central region.
- Review pricing for loss-making high-volume customers.
- Plan stock and campaigns ahead of the October to November peak, with discount limits in place.

## How to run

```bash
pip install -r requirements.txt
```

1. Put the dataset in `data/raw/`.
2. Run `notebooks/01_cleaning_eda.ipynb` to create `data/cleaned/superstore_clean.csv`.
3. Create a PostgreSQL database named `superstore_db`, then run the load cell in the notebook.
4. Open `dashboard/sales_dashboard.pbix` in Power BI Desktop.

## Author

[GOWTHAM P] | [www.linkedin.com/in/gowtham-p-333ab035a] | Open to freelance data analysis and machine learning projects
