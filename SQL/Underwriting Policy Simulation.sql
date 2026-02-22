WITH policy AS (
    SELECT
        *,
        CASE
            WHEN loan_int_rate >= 16 OR pct_income >= 0.60 THEN 1
            ELSE 0
        END AS declined_by_policy
    FROM loans_features
),
summary AS (
    SELECT
        COUNT(*) AS total_loans,
        SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS total_defaults,
        SUM(declined_by_policy) AS declined_loans,
        SUM(CASE WHEN declined_by_policy = 1 AND loan_status = 1 THEN 1 ELSE 0 END) AS defaults_captured,
        SUM(CASE WHEN declined_by_policy = 0 AND loan_status = 1 THEN 1 ELSE 0 END) AS defaults_remaining
    FROM policy
)
SELECT
    total_loans,
    total_defaults,
    declined_loans,
    ROUND(100.0 * declined_loans / NULLIF(total_loans, 0), 2) AS decline_rate_pct,
    defaults_captured,
    ROUND(100.0 * defaults_captured / NULLIF(total_defaults, 0), 2) AS default_capture_rate_pct,
    defaults_remaining,
    ROUND(100.0 * defaults_remaining / NULLIF(total_defaults, 0), 2) AS remaining_default_share_pct
FROM summary;
