/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 01_lookup_tables.sql
Description : Creates lookup tables used across the banking database.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- CREATE TRANSACTION TYPE LOOKUP TABLE
-- ============================================================================

CREATE TABLE transaction_type
(
    transaction_type_id      SMALLSERIAL,
    transaction_type_name    VARCHAR(50) NOT NULL,
    description              VARCHAR(255),

    CONSTRAINT pk_transaction_type
        PRIMARY KEY (transaction_type_id),

    CONSTRAINT uq_transaction_type_name
        UNIQUE (transaction_type_name)
);

COMMENT ON TABLE transaction_type IS
'Stores the master list of banking transaction types.';

COMMENT ON COLUMN transaction_type.transaction_type_name IS
'Unique name of the transaction type.';


-- ============================================================================
-- CREATE MERCHANT CATEGORY LOOKUP TABLE
-- ============================================================================

CREATE TABLE merchant_category
(
    merchant_category_id      SMALLSERIAL,
    category_name             VARCHAR(100) NOT NULL,
    description               VARCHAR(255),

    CONSTRAINT pk_merchant_category
        PRIMARY KEY (merchant_category_id),

    CONSTRAINT uq_merchant_category_name
        UNIQUE (category_name)
);

COMMENT ON TABLE merchant_category IS
'Stores merchant category classifications.';

COMMENT ON COLUMN merchant_category.category_name IS
'Unique merchant category name.';


-- ============================================================================
-- CREATE FRAUD RULE LOOKUP TABLE
-- ============================================================================

CREATE TABLE fraud_rule
(
    fraud_rule_id         SMALLSERIAL,
    rule_name             VARCHAR(100) NOT NULL,
    risk_level            VARCHAR(20) NOT NULL,
    description           VARCHAR(255),
    is_active             BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_fraud_rule
        PRIMARY KEY (fraud_rule_id),

    CONSTRAINT uq_fraud_rule_name
        UNIQUE (rule_name),

    CONSTRAINT chk_fraud_rule_risk_level
        CHECK (risk_level IN ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL'))
);

COMMENT ON TABLE fraud_rule IS
'Stores configurable fraud detection rules.';

COMMENT ON COLUMN fraud_rule.risk_level IS
'Risk classification assigned to the fraud rule.';


-- ============================================================================
-- CREATE ACCOUNT TYPE LOOKUP TABLE
-- ============================================================================

CREATE TABLE account_type
(
    account_type_id        SMALLSERIAL,
    account_type_name      VARCHAR(50) NOT NULL,
    description            VARCHAR(255),

    CONSTRAINT pk_account_type
        PRIMARY KEY (account_type_id),

    CONSTRAINT uq_account_type_name
        UNIQUE (account_type_name)
);

COMMENT ON TABLE account_type IS
'Stores supported bank account types.';

COMMENT ON COLUMN account_type.account_type_name IS
'Unique account type name.';


-- ============================================================================
-- CREATE ACCOUNT STATUS LOOKUP TABLE
-- ============================================================================

CREATE TABLE account_status
(
    account_status_id      SMALLSERIAL,
    status_name            VARCHAR(50) NOT NULL,
    description            VARCHAR(255),

    CONSTRAINT pk_account_status
        PRIMARY KEY (account_status_id),

    CONSTRAINT uq_account_status_name
        UNIQUE (status_name)
);

COMMENT ON TABLE account_status IS
'Stores valid account status values.';

COMMENT ON COLUMN account_status.status_name IS
'Current operational status of an account.';


-- ============================================================================
-- VERIFICATION
-- ============================================================================

SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN
(
    'transaction_type',
    'merchant_category',
    'fraud_rule',
    'account_type',
    'account_status'
)
ORDER BY table_name;

-- ============================================================================
-- END OF FILE
-- ============================================================================