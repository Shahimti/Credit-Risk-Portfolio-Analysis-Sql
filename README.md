# Credit Risk Portfolio Analysis – Aurora Consumer Lending

## Project Background

Aurora Consumer Lending is a mid-sized consumer finance company offering unsecured personal loans across multiple borrower segments.

As loan volume increased, leadership required a structured portfolio risk review to answer three core questions:

  - What is the true default exposure across the portfolio?

  - Which borrower segments drive disproportionate credit losses?

  - How can underwriting and pricing strategy be improved using data?

This project simulates an internal credit risk analytics engagement designed to evaluate portfolio performance and identify high-risk borrower characteristics using SQL-driven segmentation.

**Insights & Recommendations Delivered Across:**

- Portfolio Health Assessment – Overall default exposure and concentration analysis

- Credit Grade Performance – Risk escalation across underwriting tiers (A–G)

- Affordability & Debt Stress – Payment-to-income thresholds and default sensitivity

- Borrower Stability Indicators – Employment tenure and credit history risk patterns

- Pricing vs. Risk Alignment – Interest rate tiers and default correlation

- Underwriting Segmentation Strategy – Identification of structurally high-risk borrower groups

All MySQL scripts used for feature engineering, segmentation, portfolio KPIs, and risk analysis can be accessed **[here](https://github.com/Shahimti/Credit-Risk-Analysis/tree/main/SQL)**

Exported CSV outputs for each segmentation and portfolio KPI can be viewed **[here](https://github.com/Shahimti/Credit-Risk-Analysis/tree/main/SQL_Outputs)**

## Executive Summary

An analysis of 28,578 active loan accounts revealed:

- 21.74% portfolio default rate, representing material credit exposure.

- Severe risk concentration in lower credit grades - Grade G loans default at 98.25%, compared to 9.82% for Grade A.

- Borrowers allocating more than 60% of income to loan payments show 74.07% default rates, indicating affordability stress.

- High-interest loans (>20%) correlate with 88.06% default, suggesting pricing reflects - but does not mitigate elevated risk.

- Early-tenure borrowers (<1 year employment) and thin-file customers (<3 years credit history) display structurally higher default patterns.

- The portfolio demonstrates clear segmentation opportunities for improved underwriting controls and risk-adjusted pricing strategies.

## Data Structure Overview 

The dataset represents customer-level and loan-level attributes across 28,578 loan accounts.

### Borrower Attributes

- Age

- Income

- Employment Length

- Credit History Length

- Home Ownership Status

### Loan Attributes

- Loan Amount

- Loan Grade (A–G)

- Interest Rate

- Loan Intent

- Payment-to-Income Ratio

- Target Variable

- loan_status (1 = default, 0 = repaid)

## Analytical Approach
   
### Data Preparation

- Cleaned and standardized raw loan records

- Corrected inconsistent demographic values

- Replaced invalid age and employment entries using median-based imputation

- Standardized financial data types for accurate aggregation

### SQL-Based Feature Engineering

- Created segmentation buckets to enable structured portfolio analysis:

- Age buckets

- Income bands

- Employment length bands

- Credit history bands

- Interest rate tiers

- Payment-to-income tiers

- Loan grade numeric scoring

- Debt-to-income recalculation

A consolidated analytical view was built in MySQL to ensure consistent KPI reporting across all risk dimensions.

## Key Portfolio Findings

| Risk Dimension     | Segment                   | Default Rate |
|--------------------|---------------------------|--------------|
| Overall Portfolio  | All Loans                  | 21.74%       |
| Loan Grade         | Grade A                    | 9.82%        |
| Loan Grade         | Grade G                    | 98.25%       |
| Income Band        | <10k                       | 86.96%       |
| Employment Length  | <1 year                    | 24.67%       |
| Credit History     | <3 years                   | 23.36%       |
| Interest Rate      | >20%                       | 88.06%       |
| Affordability      | >60% income allocation     | 74.07%       |

## Risk Implications

The portfolio shows concentrated exposure in:

- Lower credit grades

- High debt-to-income segments

- High-interest pricing tiers

- Thin-file borrowers

Without tighter underwriting controls, these segments materially increase loss volatility and portfolio instability.

## Strategic Recommendations

Based on the uncovered insights, the following recommendations have been provided: 

- Introduce stricter underwriting thresholds for borrowers exceeding 50% income allocation.

- Cap portfolio exposure to Grade F and G segments.

- Implement enhanced verification for borrowers with less than 1 year of employment.

- Re-evaluate risk-adjusted pricing to ensure yield compensates for elevated loss probability.

- Monitor thin-file borrower performance separately within ongoing credit risk reporting.

## Assumptions & Limitations

- Dataset is simulated for analytical demonstration purposes.

- Macroeconomic variables were not included.

- Time-series default migration analysis was not performed.

- Loss Given Default (LGD) and Expected Loss modeling were outside scope.

## End Users & Business Application

### Primary End Users

This analysis is designed to support decision-making across Aurora Consumer Lending’s risk and underwriting functions:

**Credit Risk Managers** – Monitoring portfolio-level default exposure and risk concentration.

**Underwriting Teams** – Evaluating borrower approval thresholds based on affordability, credit grade and employment stability.

**Portfolio Monitoring Analysts** – Tracking high-risk segments and emerging default patterns.

**Finance & Risk Committees** – Reviewing segment-level exposure during monthly performance reviews.

### Business Applications

The outputs of this project can be applied in: 

**Underwriting Policy Reviews** 

Simulating approval cutoffs (e.g., interest rate ≥ 16%, affordability ≥ 60%) to evaluate trade-offs between approval volume and default capture.

**Exposure Management**

Identifying concentration risk in lower credit grades and high-debt segments to inform portfolio caps.

**Affordability Risk Controls**

Flagging structurally high-risk borrowers exceeding sustainable payment-to-income thresholds.

