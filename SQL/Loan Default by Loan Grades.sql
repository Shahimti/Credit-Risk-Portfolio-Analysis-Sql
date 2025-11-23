-- 02_default_by_grade
SELECT 
  loan_grade,
  COUNT(*) AS n_loans,
  SUM(CASE WHEN deafult_flag = 1 THEN 1 ELSE 0 END) AS defaults,
  ROUND(100.0 * SUM(CASE WHEN deafult_flag = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct
FROM loans_features
GROUP BY loan_grade
ORDER BY loan_grade;
