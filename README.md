# Retail Sales Analysis using R

An R-based retail sales analysis project that explores sales performance, product demand, regional performance, payment preferences, and monthly sales trends using a retail transactions dataset.

## Project objectives

- Calculate key sales metrics: total sales, average sales, maximum sale, minimum sale, total orders, and quantity sold.
- Compare sales and orders across product categories.
- Analyze sales by region.
- Identify the top 10 products by quantity sold.
- Compare revenue across payment modes.
- Examine monthly sales trends.
- Classify transactions as **High Sales** or **Normal Sales** using the script's threshold of INR 5,000.

## Dataset

File: `data/Retail_Sales.csv`

The supplied dataset contains **1,000 rows and 11 columns**:

| Column | Description |
|---|---|
| `Order_ID` | Order identifier |
| `Order_Date` | Order date |
| `Product` | Product name |
| `Category` | Product category |
| `Quantity` | Quantity sold |
| `Unit_Price_INR` | Unit price in INR |
| `Total_Sales_INR` | Total sales amount in INR |
| `Region` | Sales region |
| `Payment_Mode` | Payment method |
| `Customer_Age` | Customer age |
| `Gender` | Customer gender |

## Tools and packages

- R
- RStudio (recommended)
- `dplyr` – data manipulation
- `ggplot2` – visualizations
- `lubridate` – date parsing and monthly grouping
- `readr` – CSV import

## How to run

1. Clone or download this repository.
2. Open `Retail-Sales-Analysis.Rproj` in RStudio, or set the working directory to the repository root.
3. Install the required packages once:

   ```r
   install.packages(c("dplyr", "ggplot2", "lubridate", "readr"))
   ```

4. Run `R/Retail_Sales_R_Project.R`.

The script reads the CSV from `data/Retail_Sales.csv` and saves four charts in `visualizations/`.

## Repository structure

```text
Retail-Sales-Analysis/
├── README.md
├── Retail-Sales-Analysis.Rproj
├── .gitignore
├── LICENSE
├── data/
│   └── Retail_Sales.csv
├── R/
│   └── Retail_Sales_R_Project.R
└── visualizations/
    └── README.md
```

## Notes

- The script uses the provided dataset and the analysis topics in the supplied R project.
- The sales classification threshold is `Total_Sales_INR > 5000`.
- Verify that you have permission to publish the dataset, especially because it includes customer age and gender fields.
- Add screenshots or exported charts to the `visualizations/` folder if you want them displayed in the repository.

## Future improvements

- Add interactive charts or a Shiny dashboard.
- Add filters for date, category, and region.
- Add automated data-quality checks and a reproducible analysis report.
