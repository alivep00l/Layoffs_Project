# 📉 Global Job Layoffs Analysis

This project presents a comprehensive analysis of global job layoffs using real-world data from 2020–2023. The primary goals were to **clean the dataset**, perform **exploratory data analysis (EDA)** using SQL, and visualize insights through an interactive **Tableau dashboard**.

---

## 📂 Project Structure

```
🔹 layoffs.csv                        # Raw dataset used for analysis
🔹 Layoffs Data Cleaning.sql         # SQL script for data cleaning and transformation
🔹 Layoffs ExploratoryDataAnalysis.sql # SQL queries for exploratory data analysis
🔹 Dashboard 2.png                   # Tableau dashboard image
🔹 README.md                         # Project overview and documentation
```

---

## 🧹 1. Data Cleaning (`Layoffs Data Cleaning.sql`)

Performed in **MySQL**, cleaning steps included:

* ✅ **Removing Duplicates** using `ROW_NUMBER() OVER (...)` to identify and eliminate exact duplicate rows.
* ✅ **Trimming Whitespaces** from textual fields like `company`, `industry`, and `country`.
* ✅ **Standardizing Values** (e.g., normalizing industry names like `'crypto'` → `'Crypto'`).
* ✅ **Date Format Conversion**: Converted string-based dates to proper `DATE` format using `STR_TO_DATE()`.
* ✅ **Handling NULLs**: Filled missing `industry` data using other records from the same company.
* ✅ **Removing Irrelevant Entries**: Dropped rows where both `total_laid_off` and `percentage_laid_off` were null.

Cleaned data was stored in a final table: `layoffs_staging3`.

---

## 📊 2. Exploratory Data Analysis (`Layoffs ExploratoryDataAnalysis.sql`)

Key analyses performed include:

* 🔍 **Top 5 Layoffs**: Companies with the highest individual layoffs.
* 🌍 **Layoffs by Country & Location**: Identifying global regions most affected.
* 📆 **Year-wise Layoff Trends**: Tracking job losses from 2020 to 2023.
* 🏢 **Company-wise Trends**: Ranking firms by yearly layoff volume.
* 💰 **Funding Insights**: Analyzing layoffs in relation to capital raised.
* 📈 **Layoff Percentages**: Highlighting companies with 100% workforce layoffs.

---

## 📈 3. Tableau Dashboard

An interactive dashboard was created to visualize insights from the cleaned data.

### 📌 Key Components

| Section                     | Description                                                               |
| --------------------------- | ------------------------------------------------------------------------- |
| **Total Layoffs (Yearly)**  | Visual trend of layoffs from 2020 to 2023                                 |
| **Top 5 Layoffs**           | Google, Meta, Amazon, Microsoft, Ericsson dominate highest layoff counts  |
| **Layoffs by Industry**     | Industries like Consumer, Retail, and Transport top the layoff chart      |
| **Layoffs by Country**      | USA leads layoffs with a massive margin followed by India and Netherlands |
| **Funds Raised vs Layoffs** | Analyzes layoffs relative to the company’s funding                        |

![Dashboard Preview](Dashboard%202.png)

---

## 📌 Key Insights

* ⬆️ **2022** had the **highest number of layoffs** (\~160.7K), nearly **4x** that of 2021.
* 🏢 **Tech giants** like Google and Meta were among the top contributors to layoffs.
* 🌐 The **United States** witnessed the most layoffs across all years.
* 📉 Many companies had layoffs even after raising millions in funding.

---

## 🔧 Tools Used

* **SQL (MySQL)** – Data Cleaning & EDA
* **Tableau** – Dashboard Creation & Visualization
* **Dataset Source** – Publicly available layoff dataset

---

## 📌 References

* `layoffs.csv` – Raw dataset
* `Layoffs Data Cleaning.sql` – Cleaning process
* `Layoffs ExploratoryDataAnalysis.sql` – Analysis queries
* `Dashboard 2.png` – Tableau dashboard snapshot

---
