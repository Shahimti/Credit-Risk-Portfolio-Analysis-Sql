WITH grade_base AS (
    SELECT
        loan_grade,
        COUNT(*) AS n_loans,
        SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults
    FROM loans_features
    GROUP BY loan_grade
),
tot AS (
    SELECT SUM(defaults) AS total_defaults
    FROM grade_base
)
SELECT
    g.loan_grade,
    g.n_loans,
    g.defaults,
    ROUND(100.0 * g.defaults / NULLIF(t.total_defaults, 0), 2) AS share_of_defaults_pct,
    ROUND(100.0 * g.defaults / NULLIF(g.n_loans, 0), 2) AS default_rate_pct
FROM grade_base g
CROSS JOIN tot t
ORDER BY share_of_defaults_pct DESC;
