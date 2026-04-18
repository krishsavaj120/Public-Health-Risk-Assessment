--Q1 What is the Diabetes Prevalence by BMI Category?

      SELECT bmi_category, 
             COUNT(*) AS total_patients,
             ROUND(100.0 * SUM(diabetes_binary) / COUNT(*), 2) AS diabetes_prevalence_pct
      FROM patient_data
      GROUP BY bmi_category
      ORDER BY diabetes_prevalence_pct DESC;

--Q2 How does the "Comorbidity Multiplier" (High BP & High Chol) affect Diabetes risk?

      SELECT 
          CASE WHEN highbp = 1 AND highchol = 1 THEN 'Both Conditions'
               WHEN highbp = 1 OR highchol = 1 THEN 'One Condition'
               ELSE 'No Condition' END AS medical_profile,
          COUNT(*) AS patient_count,
          ROUND(AVG(diabetes_binary) * 100, 2) AS diabetes_rate_pct
      FROM patient_data
      GROUP BY medical_profile
      ORDER BY diabetes_rate_pct DESC;

--Q3 Which Age Brackets have the highest Diabetes Prevalence?

      SELECT age_bracket, 
             COUNT(*) AS total_patients,
             ROUND(100.0 * SUM(diabetes_binary) / COUNT(*), 2) AS prevalence_rate
      FROM patient_data
      GROUP BY age_bracket
      ORDER BY prevalence_rate DESC;

--Q4 Compare average Physical Health days for Active vs. Inactive Diabetics.

      SELECT physactivity, 
             COUNT(*) AS total_diabetics,
             ROUND(AVG(physhlth), 2) AS avg_monthly_sick_days
      FROM patient_data
      WHERE diabetes_binary = 1
      GROUP BY physactivity;

--Q5 Find patients whose Risk Score is higher than the average of their specific Age Bracket.

      SELECT age_bracket, bmi_category, risk_score
      FROM patient_data p1
      WHERE risk_score > (SELECT AVG(risk_score) 
                          FROM patient_data p2 
                          WHERE p1.age_bracket = p2.age_bracket);

--Q6 Rank the Top 3 "High Risk" groups in each Education Level.

      WITH EduRiskRank AS (
          SELECT edu_level, bmi_category, AVG(risk_score) as avg_risk,
                 DENSE_RANK() OVER (PARTITION BY edu_level ORDER BY AVG(risk_score) DESC) as risk_rank
          FROM patient_data
          GROUP BY edu_level, bmi_category
      )
      SELECT * FROM EduRiskRank WHERE risk_rank <= 3;

--Q7 Segment patients by "Mental Wellness" (using the Mental Health bins).

      SELECT mental_health_status, 
             COUNT(*) as patient_count,
             ROUND(AVG(physhlth), 2) as avg_physical_illness_days
      FROM patient_data
      GROUP BY mental_health_status
      ORDER BY avg_physical_illness_days DESC;

--Q8 What is the Diabetes Rate based on the Lifestyle Score (Nutrition + Activity)?

      SELECT lifestyle_score, 
             COUNT(*) AS total_patients,
             ROUND(100.0 * SUM(diabetes_binary) / COUNT(*), 2) AS diabetes_rate
      FROM patient_data
      GROUP BY lifestyle_score
      ORDER BY lifestyle_score DESC;

--Q9 Are patients with high "Access Barriers" more likely to have poor health perception?

      SELECT 
          CASE WHEN access_barriers > 0 THEN 'Has Barriers' ELSE 'No Barriers' END AS access_status,
          health_perception,
          COUNT(*) as patient_count
      FROM patient_data
      GROUP BY access_status, health_perception
      ORDER BY access_status, patient_count DESC;

--Q10 Calculate the total potential "Healthcare Burden" (Illness Days) per Income Bracket.

      SELECT income_bracket, 
             SUM(physhlth) AS total_monthly_illness_days,
             ROUND(AVG(physhlth), 2) AS avg_days_per_patient
      FROM patient_data
      GROUP BY income_bracket
      ORDER BY total_monthly_illness_days DESC;
