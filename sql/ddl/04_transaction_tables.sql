/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 04_transaction_tables.sql
Description : Creates transaction processing and fraud alert tables.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- CREATE BANK_TRANSACTION TABLE
-- ============================================================================

CREATE TABLE bank_transaction
(
    transaction_id             BIGSERIAL,
    account_id                 BIGINT NOT NULL,
    merchant_id                BIGINT,
    employee_id                BIGINT,
    transaction_type_id        SMALLINT NOT NULL,

    transaction_reference      VARCHAR(50) NOT NULL,

    transaction_amount         NUMERIC(15,2) NOT NULL,

    transaction_timestamp      TIMESTAMP NOT NULL
                               DEFAULT CURRENT_TIMESTAMP,

    transaction_status         VARCHAR(20) NOT NULL
                               DEFAULT 'SUCCESS',

    transaction_channel        VARCHAR(20) NOT NULL,

    device_ip                  VARCHAR(45),

    device_location            VARCHAR(100),

    is_suspicious              BOOLEAN NOT NULL
                               DEFAULT FALSE,

    created_at                 TIMESTAMP NOT NULL
                               DEFAULT CURRENT_TIMESTAMP,

    updated_at                 TIMESTAMP NOT NULL
                               DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_bank_transaction
        PRIMARY KEY (transaction_id),

    CONSTRAINT fk_transaction_account
        FOREIGN KEY (account_id)
        REFERENCES account(account_id),

    CONSTRAINT fk_transaction_merchant
        FOREIGN KEY (merchant_id)
        REFERENCES merchant(merchant_id),

    CONSTRAINT fk_transaction_employee
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id),

    CONSTRAINT fk_transaction_type
        FOREIGN KEY (transaction_type_id)
        REFERENCES transaction_type(transaction_type_id),

    CONSTRAINT uq_transaction_reference
        UNIQUE (transaction_reference),

    CONSTRAINT chk_transaction_reference
        CHECK (length(transaction_reference) BETWEEN 12 AND 50),

    CONSTRAINT chk_transaction_amount
        CHECK (transaction_amount > 0),

    CONSTRAINT chk_transaction_status
        CHECK
        (
            transaction_status IN
            (
                'SUCCESS',
                'FAILED',
                'PENDING',
                'REVERSED'
            )
        ),

    CONSTRAINT chk_transaction_channel
        CHECK
        (
            transaction_channel IN
            (
                'ATM',
                'POS',
                'ONLINE',
                'MOBILE',
                'UPI',
                'NEFT',
                'RTGS',
                'IMPS'
            )
        )
);

-- ============================================================================
-- COMMENTS : BANK_TRANSACTION
-- ============================================================================

COMMENT ON TABLE bank_transaction IS
'Stores all financial transactions processed by the banking system.';

COMMENT ON COLUMN bank_transaction.transaction_id IS
'Unique identifier for each banking transaction.';

COMMENT ON COLUMN bank_transaction.account_id IS
'Account from which the transaction originates.';

COMMENT ON COLUMN bank_transaction.merchant_id IS
'Merchant involved in the transaction, if applicable.';

COMMENT ON COLUMN bank_transaction.employee_id IS
'Employee handling the transaction, if applicable.';

COMMENT ON COLUMN bank_transaction.transaction_type_id IS
'Reference to the transaction type lookup table.';

COMMENT ON COLUMN bank_transaction.transaction_reference IS
'Unique reference number assigned to the transaction.';

COMMENT ON COLUMN bank_transaction.transaction_amount IS
'Monetary value of the transaction.';

COMMENT ON COLUMN bank_transaction.transaction_timestamp IS
'Date and time when the transaction occurred.';

COMMENT ON COLUMN bank_transaction.transaction_status IS
'Processing status of the transaction.';

COMMENT ON COLUMN bank_transaction.transaction_channel IS
'Channel used to perform the transaction.';

COMMENT ON COLUMN bank_transaction.device_ip IS
'IP address of the originating device when available.';

COMMENT ON COLUMN bank_transaction.device_location IS
'Approximate geographical location of the originating device.';

COMMENT ON COLUMN bank_transaction.is_suspicious IS
'Indicates whether the transaction has been flagged as suspicious.';

COMMENT ON COLUMN bank_transaction.created_at IS
'Timestamp when the record was created.';

COMMENT ON COLUMN bank_transaction.updated_at IS
'Timestamp when the record was last updated.';
-- ============================================================================
-- CREATE FRAUD_ALERT TABLE
-- ============================================================================

CREATE TABLE fraud_alert
(
    alert_id                   BIGSERIAL,
    transaction_id             BIGINT NOT NULL,
    fraud_rule_id              SMALLINT NOT NULL,

    risk_score                 NUMERIC(5,2) NOT NULL,

    alert_status               VARCHAR(20) NOT NULL
                               DEFAULT 'OPEN',

    detected_by                VARCHAR(20) NOT NULL
                               DEFAULT 'RULE_ENGINE',

    alert_timestamp            TIMESTAMP NOT NULL
                               DEFAULT CURRENT_TIMESTAMP,

    remarks                    VARCHAR(500),

    created_at                 TIMESTAMP NOT NULL
                               DEFAULT CURRENT_TIMESTAMP,

    updated_at                 TIMESTAMP NOT NULL
                               DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_fraud_alert
        PRIMARY KEY (alert_id),

    CONSTRAINT fk_alert_transaction
        FOREIGN KEY (transaction_id)
        REFERENCES bank_transaction(transaction_id),

    CONSTRAINT fk_alert_rule
        FOREIGN KEY (fraud_rule_id)
        REFERENCES fraud_rule(fraud_rule_id),

    CONSTRAINT chk_risk_score
        CHECK (risk_score BETWEEN 0 AND 100),

    CONSTRAINT chk_alert_status
        CHECK
        (
            alert_status IN
            (
                'OPEN',
                'UNDER_REVIEW',
                'CONFIRMED',
                'FALSE_POSITIVE',
                'CLOSED'
            )
        ),

    CONSTRAINT chk_detected_by
        CHECK
        (
            detected_by IN
            (
                'RULE_ENGINE',
                'MANUAL_REVIEW',
                'SYSTEM'
            )
        )
);

-- ============================================================================
-- COMMENTS : FRAUD_ALERT
-- ============================================================================

COMMENT ON TABLE fraud_alert IS
'Stores fraud alerts generated for suspicious banking transactions.';

COMMENT ON COLUMN fraud_alert.alert_id IS
'Unique identifier for each fraud alert.';

COMMENT ON COLUMN fraud_alert.transaction_id IS
'Reference to the suspicious banking transaction.';

COMMENT ON COLUMN fraud_alert.fraud_rule_id IS
'Fraud detection rule responsible for generating the alert.';

COMMENT ON COLUMN fraud_alert.risk_score IS
'Calculated fraud risk score ranging from 0 to 100.';

COMMENT ON COLUMN fraud_alert.alert_status IS
'Current investigation status of the fraud alert.';

COMMENT ON COLUMN fraud_alert.detected_by IS
'Source that generated the fraud alert.';

COMMENT ON COLUMN fraud_alert.alert_timestamp IS
'Timestamp when the fraud alert was generated.';

COMMENT ON COLUMN fraud_alert.remarks IS
'Additional investigation notes or observations.';

COMMENT ON COLUMN fraud_alert.created_at IS
'Timestamp when the fraud alert record was created.';

COMMENT ON COLUMN fraud_alert.updated_at IS
'Timestamp when the fraud alert record was last updated.';
-- ============================================================================
-- VERIFICATION : BANK_TRANSACTION TABLE
-- ============================================================================

SELECT
    COUNT(*) AS bank_transaction_count
FROM bank_transaction;

-- ============================================================================
-- VERIFICATION : FRAUD_ALERT TABLE
-- ============================================================================

SELECT
    COUNT(*) AS fraud_alert_count
FROM fraud_alert;

-- ============================================================================
-- VERIFY TABLE CREATION
-- ============================================================================

SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN
(
    'bank_transaction',
    'fraud_alert'
)
ORDER BY table_name;

-- ============================================================================
-- VERIFY CONSTRAINTS
-- ============================================================================

SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.table_schema = 'public'
  AND tc.table_name IN
(
    'bank_transaction',
    'fraud_alert'
)
ORDER BY
    tc.table_name,
    tc.constraint_type,
    tc.constraint_name;

-- ============================================================================
-- VERIFY FOREIGN KEY RELATIONSHIPS
-- ============================================================================

SELECT
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS referenced_table,
    ccu.column_name AS referenced_column
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage ccu
    ON tc.constraint_name = ccu.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_name IN
(
    'bank_transaction',
    'fraud_alert'
)
ORDER BY
    tc.table_name,
    kcu.column_name;

-- ============================================================================
-- END OF FILE
-- ============================================================================