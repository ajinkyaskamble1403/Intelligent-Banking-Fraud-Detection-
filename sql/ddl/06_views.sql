/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 06_views.sql
Description : Creates reporting and analytics views.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- VIEW : CUSTOMER ACCOUNTS
-- ============================================================================

CREATE OR REPLACE VIEW vw_customer_accounts AS

SELECT

    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone_number,

    a.account_id,
    a.account_number,
    at.account_type_name,
    ast.account_status_name,
    a.balance,
    a.opened_date,

    b.branch_code,
    b.branch_name,
    b.city,
    b.state

FROM customer c

INNER JOIN account a
    ON c.customer_id = a.customer_id

INNER JOIN account_type at
    ON a.account_type_id = at.account_type_id

INNER JOIN account_status ast
    ON a.account_status_id = ast.account_status_id

INNER JOIN branch b
    ON a.branch_id = b.branch_id;

-- ============================================================================
-- VIEW : TRANSACTION DETAILS
-- ============================================================================

CREATE OR REPLACE VIEW vw_transaction_details AS

SELECT

    bt.transaction_id,
    bt.transaction_reference,
    bt.transaction_amount,
    bt.transaction_timestamp,
    bt.transaction_status,
    bt.transaction_channel,

    c.customer_id,
    c.first_name,
    c.last_name,

    a.account_number,

    m.merchant_name,

    tt.transaction_type_name,

    bt.is_suspicious

FROM bank_transaction bt

INNER JOIN account a
    ON bt.account_id = a.account_id

INNER JOIN customer c
    ON a.customer_id = c.customer_id

LEFT JOIN merchant m
    ON bt.merchant_id = m.merchant_id

INNER JOIN transaction_type tt
    ON bt.transaction_type_id = tt.transaction_type_id;

-- ============================================================================
-- VIEW : FRAUD ALERTS
-- ============================================================================

CREATE OR REPLACE VIEW vw_fraud_alerts AS

SELECT

    fa.alert_id,

    bt.transaction_reference,

    fr.rule_name,

    fa.risk_score,

    fa.alert_status,

    fa.detected_by,

    fa.alert_timestamp

FROM fraud_alert fa

INNER JOIN bank_transaction bt
    ON fa.transaction_id = bt.transaction_id

INNER JOIN fraud_rule fr
    ON fa.fraud_rule_id = fr.fraud_rule_id;

-- ============================================================================
-- VIEW : ACTIVE LOANS
-- ============================================================================

CREATE OR REPLACE VIEW vw_active_loans AS

SELECT

    l.loan_id,

    c.customer_id,
    c.first_name,
    c.last_name,

    l.loan_type,
    l.loan_amount,
    l.interest_rate,

    b.branch_name,

    l.start_date,
    l.end_date

FROM loan l

INNER JOIN customer c
    ON l.customer_id = c.customer_id

INNER JOIN branch b
    ON l.branch_id = b.branch_id

WHERE l.loan_status = 'ACTIVE';

-- ============================================================================
-- VIEW : CARD DETAILS
-- ============================================================================

CREATE OR REPLACE VIEW vw_card_details AS

SELECT

    cd.card_id,

    a.account_number,

    CONCAT
    (
        '**** **** **** ',
        RIGHT(cd.card_number, 4)
    ) AS masked_card_number,

    cd.card_type,
    cd.card_network,
    cd.card_status,
    cd.expiry_date

FROM card cd

INNER JOIN account a
    ON cd.account_id = a.account_id;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

SELECT
    table_name
FROM information_schema.views
WHERE table_schema = 'public'
ORDER BY table_name;

-- ============================================================================
-- END OF FILE
-- ============================================================================