/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 12_testing.sql
Description : Database testing and validation script.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- SECTION 1 : DATABASE OBJECT VERIFICATION
-- ============================================================================

-- Verify Branch table

SELECT
    COUNT(*) AS total_branches

FROM branch;

-- Verify Customer table

SELECT
    COUNT(*) AS total_customers

FROM customer;

-- Verify Employee table

SELECT
    COUNT(*) AS total_employees

FROM employee;

-- Verify Account table

SELECT
    COUNT(*) AS total_accounts

FROM account;

-- Verify Card table

SELECT
    COUNT(*) AS total_cards

FROM card;

-- Verify Loan table

SELECT
    COUNT(*) AS total_loans

FROM loan;

-- Verify Merchant table

SELECT
    COUNT(*) AS total_merchants

FROM merchant;

-- Verify Transaction table

SELECT
    COUNT(*) AS total_transactions

FROM bank_transaction;

-- Verify Fraud Alert table

SELECT
    COUNT(*) AS total_fraud_alerts

FROM fraud_alert;

-- ============================================================================
-- SECTION 2 : VIEW TESTING
-- ============================================================================

-- Execute Customer Account Summary View

SELECT
    *

FROM vw_customer_account_summary

LIMIT 10;

-- Execute Branch Performance View

SELECT
    *

FROM vw_branch_performance

LIMIT 10;

-- Execute Transaction Details View

SELECT
    *

FROM vw_transaction_details

LIMIT 10;

-- Execute Fraud Alert Summary View

SELECT
    *

FROM vw_fraud_alert_summary

LIMIT 10;

-- ============================================================================
-- SECTION 3 : FUNCTION TESTING
-- ============================================================================
-- Execute fn_get_customer_total_balance()

SELECT
    fn_get_customer_total_balance(1) AS customer_1_total_balance;

-- Execute fn_get_customer_total_balance()

SELECT
    fn_get_customer_total_balance(10) AS customer_10_total_balance;

-- Execute fn_get_account_transaction_count()

SELECT
    fn_get_account_transaction_count(1) AS account_1_transaction_count;

-- Execute fn_get_account_transaction_count()

SELECT
    fn_get_account_transaction_count(25) AS account_25_transaction_count;

-- Execute fn_calculate_loan_emi()

SELECT
    fn_calculate_loan_emi
    (
        500000,
        8.50,
        60
    ) AS monthly_emi;

-- ============================================================================
-- SECTION 4 : STORED PROCEDURE TESTING
-- ============================================================================
-- Execute sp_transfer_funds()

CALL sp_transfer_funds
(
    1,
    2,
    1000.00
);

-- Execute sp_update_account_status()

CALL sp_update_account_status
(
    5,
    2
);

-- Execute sp_block_card()

CALL sp_block_card
(
    10,
    2
);

-- Execute sp_create_fraud_alert()

CALL sp_create_fraud_alert
(
    50,
    1,
    92.50,
    'OPEN',
    'RULE_ENGINE',
    'Testing stored procedure execution.'
);

-- Execute sp_update_loan_status()

CALL sp_update_loan_status
(
    3,
    'CLOSED'
);

-- ============================================================================
-- SECTION 5 : TRIGGER TESTING
-- ============================================================================
-- Verify trigger after fund transfer

SELECT
    account_id,
    balance

FROM account

WHERE account_id IN
(
    1,
    2
);

-- Verify blocked card

SELECT
    card_id,
    card_status_id

FROM card

WHERE card_id = 10;

-- Verify updated loan status

SELECT
    loan_id,
    loan_status

FROM loan

WHERE loan_id = 3;

-- Verify newly created fraud alert

SELECT
    fraud_alert_id,
    transaction_id,
    risk_score,
    alert_status

FROM fraud_alert

ORDER BY fraud_alert_id DESC

LIMIT 1;

-- ============================================================================
-- SECTION 6 : ANALYTICAL QUERY VALIDATION
-- ============================================================================
-- Execute Customer Account Summary View

SELECT
    *

FROM vw_customer_account_summary

ORDER BY total_balance DESC

LIMIT 10;

-- Execute Branch Performance View

SELECT
    *

FROM vw_branch_performance

ORDER BY total_deposits DESC;

-- Execute Fraud Alert Summary View

SELECT
    *

FROM vw_fraud_alert_summary

ORDER BY risk_score DESC

LIMIT 10;

-- Verify total suspicious transactions

SELECT
    COUNT(*) AS suspicious_transactions

FROM bank_transaction

WHERE is_suspicious = TRUE;

-- Verify total fraud alerts

SELECT
    COUNT(*) AS fraud_alerts

FROM fraud_alert;

-- ============================================================================
-- SECTION 7 : DATA INTEGRITY VALIDATION
-- ============================================================================

-- Verify duplicate account numbers

SELECT
    account_number,
    COUNT(*) AS duplicate_count

FROM account

GROUP BY
    account_number

HAVING
    COUNT(*) > 1;

-- Verify duplicate card numbers

SELECT
    card_number,
    COUNT(*) AS duplicate_count

FROM card

GROUP BY
    card_number

HAVING
    COUNT(*) > 1;

-- Verify orphan accounts

SELECT
    COUNT(*) AS orphan_accounts

FROM account a

LEFT JOIN customer c

ON a.customer_id = c.customer_id

WHERE c.customer_id IS NULL;

-- Verify orphan cards

SELECT
    COUNT(*) AS orphan_cards

FROM card cd

LEFT JOIN account a

ON cd.account_id = a.account_id

WHERE a.account_id IS NULL;

-- Verify orphan loans

SELECT
    COUNT(*) AS orphan_loans

FROM loan l

LEFT JOIN customer c

ON l.customer_id = c.customer_id

WHERE c.customer_id IS NULL;

-- Verify orphan transactions

SELECT
    COUNT(*) AS orphan_transactions

FROM bank_transaction bt

LEFT JOIN account a

ON bt.account_id = a.account_id

WHERE a.account_id IS NULL;

-- Verify orphan fraud alerts

SELECT
    COUNT(*) AS orphan_fraud_alerts

FROM fraud_alert fa

LEFT JOIN bank_transaction bt

ON fa.transaction_id = bt.transaction_id

WHERE bt.transaction_id IS NULL;

-- ============================================================================
-- SECTION 8 : EXECUTION SUMMARY
-- ============================================================================

SELECT
    'Database testing completed successfully.' AS execution_status,
    CURRENT_DATE AS execution_date,
    CURRENT_TIME AS execution_time;

-- ============================================================================
-- END OF FILE
-- ============================================================================