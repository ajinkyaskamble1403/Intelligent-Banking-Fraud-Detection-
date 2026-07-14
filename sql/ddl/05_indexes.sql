/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 05_indexes.sql
Description : Creates indexes to improve query performance.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- CUSTOMER INDEXES
-- ============================================================================

CREATE INDEX idx_customer_email
ON customer (email);

CREATE INDEX idx_customer_phone_number
ON customer (phone_number);

CREATE INDEX idx_customer_pan_number
ON customer (pan_number);

CREATE INDEX idx_customer_branch_id
ON customer (branch_id);

-- ============================================================================
-- ACCOUNT INDEXES
-- ============================================================================

CREATE INDEX idx_account_customer_id
ON account (customer_id);

CREATE INDEX idx_account_branch_id
ON account (branch_id);

CREATE INDEX idx_account_account_number
ON account (account_number);

CREATE INDEX idx_account_status_id
ON account (account_status_id);

-- ============================================================================
-- CARD INDEXES
-- ============================================================================

CREATE INDEX idx_card_account_id
ON card (account_id);

CREATE INDEX idx_card_card_number
ON card (card_number);

CREATE INDEX idx_card_card_status
ON card (card_status);

-- ============================================================================
-- LOAN INDEXES
-- ============================================================================

CREATE INDEX idx_loan_customer_id
ON loan (customer_id);

CREATE INDEX idx_loan_branch_id
ON loan (branch_id);

CREATE INDEX idx_loan_status
ON loan (loan_status);

-- ============================================================================
-- BANK TRANSACTION INDEXES
-- ============================================================================

CREATE INDEX idx_bank_transaction_account_id
ON bank_transaction (account_id);

CREATE INDEX idx_bank_transaction_merchant_id
ON bank_transaction (merchant_id);

CREATE INDEX idx_bank_transaction_employee_id
ON bank_transaction (employee_id);

CREATE INDEX idx_bank_transaction_type_id
ON bank_transaction (transaction_type_id);

CREATE INDEX idx_bank_transaction_reference
ON bank_transaction (transaction_reference);

CREATE INDEX idx_bank_transaction_timestamp
ON bank_transaction (transaction_timestamp);

CREATE INDEX idx_bank_transaction_status
ON bank_transaction (transaction_status);

CREATE INDEX idx_bank_transaction_channel
ON bank_transaction (transaction_channel);

CREATE INDEX idx_bank_transaction_suspicious
ON bank_transaction (is_suspicious);

CREATE INDEX idx_bank_transaction_amount
ON bank_transaction (transaction_amount);

-- ============================================================================
-- FRAUD ALERT INDEXES
-- ============================================================================

CREATE INDEX idx_fraud_alert_transaction_id
ON fraud_alert (transaction_id);

CREATE INDEX idx_fraud_alert_rule_id
ON fraud_alert (fraud_rule_id);

CREATE INDEX idx_fraud_alert_status
ON fraud_alert (alert_status);

CREATE INDEX idx_fraud_alert_risk_score
ON fraud_alert (risk_score);

CREATE INDEX idx_fraud_alert_detected_by
ON fraud_alert (detected_by);

-- ============================================================================
-- VERIFICATION
-- ============================================================================

SELECT
    schemaname,
    tablename,
    indexname
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY
    tablename,
    indexname;

-- ============================================================================
-- END OF FILE
-- ============================================================================