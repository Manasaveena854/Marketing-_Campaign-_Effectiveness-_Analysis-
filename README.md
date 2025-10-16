# 🎯 Marketing Campaign Effectiveness Analysis

## 📊 Overview
This project analyzes multi-channel hospital marketing campaigns to evaluate their effectiveness in driving patient admissions and engagement.  
It combines **SQL**, **Python (Pandas)**, and **Power BI** for end-to-end marketing analytics — from data extraction and cleaning to visualization.

---

## 🧱 Project Structure
marketing-campaign-analysis/
│
├── README.md
├── requirements.txt
│
├── data/
│   ├── raw/                     # Original CSV files
│   │   ├── hospital_patients.csv
│   │   └── marketing_campaigns.csv
│   └── processed/               # Cleaned and processed CSV
│       └── campaign_cleaned.csv
│
├── scripts/
│   ├── marketing_analysis.py    # Python script for cleaning and processing data
│   └── queries.sql              # SQL queries for extracting campaign and hospital data
│
├── dashboards/
│   ├── campaign_dashboard.pbix  # Power BI dashboard file
│   ├── overview_screenshot.png  # Screenshot or overview of the dashboard

---

## ⚙️ Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/marketing-campaign-analysis.git
   cd marketing-campaign-analysis
2.Install dependencies:

  pip install -r requirements.txt


3.Run the Python script for data cleaning:

  python scripts/marketing_analysis.py


4.Open the Power BI dashboard:

  dashboards/campaign_dashboard.pbix
  
 Key Insights:

Identified top-performing marketing channels by conversion rate and cost-effectiveness.

Analyzed patient admissions linked to campaigns, helping measure ROI for each channel.

Created interactive Power BI visuals for admissions, campaign reach, and patient segmentation.

Tools & Technologies:

Python – Pandas, NumPy, Seaborn, Matplotlib

SQL – Data extraction and joins

Power BI – Dashboard creation and visualization

Excel/CSV – Raw and cleaned data storage
