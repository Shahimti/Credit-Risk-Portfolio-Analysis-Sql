WITH intent_kpi AS (
    SELECT
        loan_intent,
        COUNT(*) AS n_loans,
        SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults,
        ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct
    FROM loans_features
    GROUP BY loan_intent
)
SELECT
    loan_intent,
    n_loans,
    defaults,
    default_rate_pct,
    DENSE_RANK() OVER (ORDER BY default_rate_pct DESC) AS risk_rank
FROM intent_kpi
ORDER BY risk_rank, loan_intent;