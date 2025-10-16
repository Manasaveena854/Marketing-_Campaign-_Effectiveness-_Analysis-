CREATE TABLE cleaned_data (
    customer_id INT,
    AdmissionDate DATE,
    DischargeDate DATE,
    Treatment VARCHAR(100),
    Outcome VARCHAR(100),
    Age INT,
    Gender VARCHAR(20),
    Channel VARCHAR(50),
    CampaignID INT,
    EngagementScore INT,
    Conversion INT,
    Spend NUMERIC(10,2),
    Date DATE,
    converted INT,
    funnel_stage VARCHAR(50)
);


-- 1️⃣ Total patients and average age
SELECT 
    COUNT(*) AS total_patients,
    ROUND(AVG(Age), 2) AS average_age
FROM cleaned_data;

-- 2️⃣ Number of patients by treatment type
SELECT 
    Treatment,
    COUNT(*) AS patient_count
FROM cleaned_data
GROUP BY Treatment
ORDER BY patient_count DESC;

-- 3️⃣ Outcome distribution
SELECT 
    Outcome,
    COUNT(*) AS outcome_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM cleaned_data
GROUP BY Outcome
ORDER BY outcome_count DESC;

-- 4️⃣ Monthly admission trend
SELECT 
    DATE_TRUNC('month', AdmissionDate)::DATE AS month,
    COUNT(*) AS admissions
FROM cleaned_data
GROUP BY month
ORDER BY month;

-- 5️⃣ Average spend per channel
SELECT 
    Channel,
    ROUND(AVG(Spend), 2) AS avg_spend
FROM cleaned_data
GROUP BY Channel
ORDER BY avg_spend DESC;

-- 6️⃣ Conversion rate by channel
SELECT 
    Channel,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Conversion = 1 THEN 1 ELSE 0 END) AS converted_patients,
    ROUND(SUM(CASE WHEN Conversion = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate
FROM cleaned_data
GROUP BY Channel
ORDER BY conversion_rate DESC;

-- 7️⃣ Engagement vs Conversion correlation summary
SELECT 
    ROUND(AVG(EngagementScore), 2) AS avg_engagement,
    ROUND(AVG(Conversion), 2) AS avg_conversion_rate
FROM cleaned_data;

-- 8️⃣ Patient outcomes by gender
SELECT 
    Gender,
    Outcome,
    COUNT(*) AS count
FROM cleaned_data
GROUP BY Gender, Outcome
ORDER BY Gender, count DESC;

-- 9️⃣ Readmission or repeat conversion pattern
SELECT 
    customer_id,
    COUNT(*) AS visit_count
FROM cleaned_data
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY visit_count DESC;





