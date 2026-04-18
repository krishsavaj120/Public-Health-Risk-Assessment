# Public Health Risk Assessment: Predictive Modeling & Population Analytics 🏥🔬

## 📌 Project Overview
Diabetes is one of the most significant global health challenges, costing the healthcare industry billions annually in reactive treatments. This project transforms **253,680 patient records** from the BRFSS 2015 dataset into a **Clinical Decision Support System**. 

By utilizing **Python** for feature engineering, **MySQL** for population-level audits, and **Power BI** for visual intelligence, this project identifies high-risk demographics and quantifies the impact of lifestyle interventions.

---

## 🚀 The Analytical Workflow

### 1. Data Engineering & Composite Scoring (Python)
Raw clinical data is often binary and flat. To extract deeper meaning, I engineered three primary indices:
* **Lifestyle Score:** Aggregated Physical Activity and Nutrition metrics to measure overall behavioral wellness.
* **Vulnerability Index:** A composite measure of chronic comorbidities (Stroke, Heart Disease, and Mobility issues).
* **Mental-Physical Correlation:** Binned 30 days of mental health data to analyze how psychological distress predicts physical illness frequency.

### 2. Relational Warehousing (MySQL)
The "Golden Dataset" was migrated to a relational environment to perform large-scale aggregations that flat files cannot handle efficiently.
* **Comorbidity Audit:** Discovered the **"Risk Multiplier"**—where having both High Blood Pressure and High Cholesterol leads to a **3.5x higher** diabetes rate.
* **Access Barriers:** Quantified how healthcare affordability and insurance coverage correlate with late-stage diagnosis.

### 3. Executive Dashboard (Power BI)
I developed a **"Public Health Command Center"** designed for policy-makers.
* **Age-Risk Spike:** Identified the exact age window (**55–69**) where cases peak, enabling targeted screening.
* **The Wellness Dividend:** A visual proof that physical activity reduces monthly sick days by **46%** for diabetic patients.

---

## 📊 Business & Clinical Impact
* **Preventive Focus:** Identified that targeting the **45–54 age bracket** for early intervention could catch **30% of cases** before they become critical.
* **Economic Insight:** Provided a roadmap for resource allocation in low-income brackets where the education-health gap is most prominent.
* **Operational Efficiency:** Reduced the "noise" in the data by isolating the top 3 clinical biomarkers (**Glucose, BMI, High BP**) using WEKA feature selection.

---

## 🛠️ Tech Stack

| Component | Technology |
| :--- | :--- |
| **Language** | Python (Pandas, Numpy, SQLAlchemy) |
| **Database** | MySQL (Relational Data Warehousing) |
| **Machine Learning** | WEKA (Random Forest, Information Gain) |
| **Visualization** | Power BI (DAX, Decomposition Trees) |

---

## 📂 Repository Structure
* `data/`: Raw and Processed datasets.
* `notebooks/`: Jupyter Notebooks for Data Cleaning & Feature Engineering.
* `sql_queries/`: Strategic SQL scripts for population auditing.
* `dashboard/`: Power BI (.pbix) files and dashboard screenshots.
* `docs/`: Full Clinical Project Report.
