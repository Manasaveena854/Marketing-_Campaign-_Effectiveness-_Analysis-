import pandas as pd
import os

# ==============================
# 1️⃣ File paths
# ==============================
raw_hospital = "data/raw/hospital_data.csv"
raw_campaign = "data/raw/campaign_data.csv"
processed_folder = "data/processed"
cleaned_file = os.path.join(processed_folder, "cleaned_data.csv")

# ==============================
# 2️⃣ Ensure processed folder exists
# ==============================
os.makedirs(processed_folder, exist_ok=True)

# ==============================
# 3️⃣ Load raw CSVs
# ==============================
try:
    hospital = pd.read_csv(raw_hospital)
    campaign = pd.read_csv(raw_campaign)
except FileNotFoundError as e:
    print(f"❌ File not found: {e}")
    exit()

# ==============================
# 4️⃣ Rename ID columns to match
# ==============================
hospital.rename(columns={'PatientID': 'customer_id'}, inplace=True)
campaign.rename(columns={'CustomerID': 'customer_id'}, inplace=True)

# ==============================
# 5️⃣ Merge datasets
# ==============================
cleaned_data = pd.merge(hospital, campaign, on="customer_id", how="inner")

# ==============================
# 6️⃣ Handle missing values
# ==============================
if 'age' in cleaned_data.columns:
    cleaned_data['age'] = cleaned_data['age'].fillna(cleaned_data['age'].median())

# ==============================
# 7️⃣ Calculate ROI
# ==============================
if 'cost' in cleaned_data.columns and 'revenue' in cleaned_data.columns:
    cleaned_data['roi'] = (cleaned_data['revenue'] - cleaned_data['cost']) / cleaned_data['cost']

# ==============================
# 8️⃣ Handle conversion column
# ==============================
# Detect conversion column (common names)
conversion_cols = ['converted', 'Converted', 'Conversion', 'IsConverted']

for col in conversion_cols:
    if col in cleaned_data.columns:
        cleaned_data['converted'] = cleaned_data[col].astype(int)
        break
else:
    # If no column exists, create a default column with 0
    cleaned_data['converted'] = 0
    print("⚠️ No conversion column found, created default 'converted' column with 0s.")

# ==============================
# 9️⃣ Funnel stage
# ==============================
def funnel_stage(row):
    return 'Converted' if row['converted'] == 1 else 'Engaged'

cleaned_data['funnel_stage'] = cleaned_data.apply(funnel_stage, axis=1)

# ==============================
# 10️⃣ Save cleaned CSV
# ==============================
cleaned_data.to_csv(cleaned_file, index=False)
print(f"✅ Cleaned data saved to {cleaned_file}")
