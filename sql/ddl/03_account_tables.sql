/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 03_account_tables.sql
Description : Creates account, card and loan tables.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- CREATE ACCOUNT TABLE
-- ============================================================================

CREATE TABLE account
(
    account_id              BIGSERIAL,
    customer_id             BIGINT NOT NULL,
    branch_id               BIGINT NOT NULL,
    account_type_id         SMALLINT NOT NULL,
    account_status_id       SMALLINT NOT NULL,

    account_number          VARCHAR(20) NOT NULL,
    ifsc_code               VARCHAR(11) NOT NULL,

    balance                 NUMERIC(15,2) NOT NULL DEFAULT 0.00,

    opened_date             DATE NOT NULL DEFAULT CURRENT_DATE,

    created_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_account
        PRIMARY KEY (account_id),

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),

    CONSTRAINT fk_account_branch
        FOREIGN KEY (branch_id)
        REFERENCES branch (branch_id),

    CONSTRAINT fk_account_type
        FOREIGN KEY (account_type_id)
        REFERENCES account_type (account_type_id),

    CONSTRAINT fk_account_status
        FOREIGN KEY (account_status_id)
        REFERENCES account_status (account_status_id),

    CONSTRAINT uq_account_number
        UNIQUE (account_number),

    CONSTRAINT chk_account_number
        CHECK (length(account_number) BETWEEN 10 AND 20),

    CONSTRAINT chk_account_balance
        CHECK (balance >= 0)
);

-- ============================================================================
-- COMMENTS : ACCOUNT
-- ============================================================================

COMMENT ON TABLE account IS
'Stores customer bank accounts.';

COMMENT ON COLUMN account.account_id IS
'Unique identifier for each account.';

COMMENT ON COLUMN account.customer_id IS
'Customer who owns the account.';

COMMENT ON COLUMN account.branch_id IS
'Branch where the account was opened.';

COMMENT ON COLUMN account.account_type_id IS
'Reference to the account type lookup table.';

COMMENT ON COLUMN account.account_status_id IS
'Reference to the account status lookup table.';

COMMENT ON COLUMN account.account_number IS
'Unique bank account number.';

COMMENT ON COLUMN account.ifsc_code IS
'Indian Financial System Code (IFSC) of the account branch.';

COMMENT ON COLUMN account.balance IS
'Current available account balance.';

COMMENT ON COLUMN account.opened_date IS
'Date when the account was opened.';

COMMENT ON COLUMN account.created_at IS
'Timestamp when the account record was created.';

COMMENT ON COLUMN account.updated_at IS
'Timestamp when the account record was last updated.';
-- ============================================================================
-- CREATE CARD TABLE
-- ============================================================================

CREATE TABLE card
(
    card_id                 BIGSERIAL,
    account_id              BIGINT NOT NULL,

    card_number             VARCHAR(19) NOT NULL,

    card_type               VARCHAR(20) NOT NULL,

    card_network            VARCHAR(20) NOT NULL,

    expiry_date             DATE NOT NULL,

    cvv_hash                VARCHAR(255) NOT NULL,

    card_status             VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',

    is_active               BOOLEAN NOT NULL DEFAULT TRUE,

    created_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_card
        PRIMARY KEY (card_id),

    CONSTRAINT fk_card_account
        FOREIGN KEY (account_id)
        REFERENCES account (account_id),

    CONSTRAINT uq_card_number
        UNIQUE (card_number),

    CONSTRAINT chk_card_number_length
        CHECK (length(card_number) BETWEEN 16 AND 19),

    CONSTRAINT chk_card_type
        CHECK
        (
            card_type IN
            (
                'DEBIT',
                'CREDIT'
            )
        ),

    CONSTRAINT chk_card_network
        CHECK
        (
            card_network IN
            (
                'VISA',
                'MASTERCARD',
                'RUPAY',
                'AMEX'
            )
        ),

    CONSTRAINT chk_card_status
        CHECK
        (
            card_status IN
            (
                'ACTIVE',
                'BLOCKED',
                'EXPIRED',
                'LOST',
                'STOLEN'
            )
        ),

    CONSTRAINT chk_card_expiry
        CHECK (expiry_date > CURRENT_DATE)
);

-- ============================================================================
-- COMMENTS : CARD
-- ============================================================================

COMMENT ON TABLE card IS
'Stores debit and credit cards issued against customer accounts.';

COMMENT ON COLUMN card.card_id IS
'Unique identifier for each card.';

COMMENT ON COLUMN card.account_id IS
'Account to which the card is linked.';

COMMENT ON COLUMN card.card_number IS
'Full card number stored for internal banking operations. Application queries and reporting views should expose only a masked value.';

COMMENT ON COLUMN card.card_type IS
'Type of card issued by the bank.';

COMMENT ON COLUMN card.card_network IS
'Payment network associated with the card.';

COMMENT ON COLUMN card.expiry_date IS
'Card expiry date.';

COMMENT ON COLUMN card.cvv_hash IS
'Hashed representation of the CVV for educational purposes. Production systems should never store the plain CVV.';

COMMENT ON COLUMN card.card_status IS
'Current operational status of the card.';

COMMENT ON COLUMN card.is_active IS
'Indicates whether the card is currently active.';

COMMENT ON COLUMN card.created_at IS
'Timestamp when the card record was created.';

COMMENT ON COLUMN card.updated_at IS
'Timestamp when the card record was last updated.';
-- ============================================================================
-- CREATE LOAN TABLE
-- ============================================================================

CREATE TABLE loan
(
    loan_id                 BIGSERIAL,
    customer_id             BIGINT NOT NULL,
    branch_id               BIGINT NOT NULL,

    loan_type               VARCHAR(30) NOT NULL,

    loan_amount             NUMERIC(15,2) NOT NULL,

    interest_rate           NUMERIC(5,2) NOT NULL,

    loan_status             VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',

    start_date              DATE NOT NULL,

    end_date                DATE NOT NULL,

    created_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_loan
        PRIMARY KEY (loan_id),

    CONSTRAINT fk_loan_customer
        FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id),

    CONSTRAINT fk_loan_branch
        FOREIGN KEY (branch_id)
        REFERENCES branch (branch_id),

    CONSTRAINT chk_loan_amount
        CHECK (loan_amount > 0),

    CONSTRAINT chk_interest_rate
        CHECK (interest_rate BETWEEN 0 AND 100),

    CONSTRAINT chk_loan_dates
        CHECK (end_date > start_date),

    CONSTRAINT chk_loan_status
        CHECK
        (
            loan_status IN
            (
                'ACTIVE',
                'CLOSED',
                'DEFAULTED'
            )
        ),

    CONSTRAINT chk_loan_type
        CHECK
        (
            loan_type IN
            (
                'HOME_LOAN',
                'PERSONAL_LOAN',
                'VEHICLE_LOAN',
                'EDUCATION_LOAN',
                'BUSINESS_LOAN'
            )
        )
);

-- ============================================================================
-- COMMENTS : LOAN
-- ============================================================================

COMMENT ON TABLE loan IS
'Stores customer loan information.';

COMMENT ON COLUMN loan.loan_id IS
'Unique identifier for each loan.';

COMMENT ON COLUMN loan.customer_id IS
'Customer who owns the loan.';

COMMENT ON COLUMN loan.branch_id IS
'Branch that issued the loan.';

COMMENT ON COLUMN loan.loan_type IS
'Type of loan issued by the bank.';

COMMENT ON COLUMN loan.loan_amount IS
'Principal loan amount.';

COMMENT ON COLUMN loan.interest_rate IS
'Annual interest rate of the loan.';

COMMENT ON COLUMN loan.loan_status IS
'Current operational status of the loan.';

COMMENT ON COLUMN loan.start_date IS
'Loan start date.';

COMMENT ON COLUMN loan.end_date IS
'Loan maturity date.';

COMMENT ON COLUMN loan.created_at IS
'Timestamp when the loan record was created.';

COMMENT ON COLUMN loan.updated_at IS
'Timestamp when the loan record was last updated.';
-- ============================================================================
-- VERIFICATION : ACCOUNT TABLE
-- ============================================================================

SELECT
    COUNT(*) AS account_count
FROM account;

-- ============================================================================
-- VERIFICATION : CARD TABLE
-- ============================================================================

SELECT
    COUNT(*) AS card_count
FROM card;

-- ============================================================================
-- VERIFICATION : LOAN TABLE
-- ============================================================================

SELECT
    COUNT(*) AS loan_count
FROM loan;

-- ============================================================================
-- VERIFY TABLE CREATION
-- ============================================================================

SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN
(
    'account',
    'card',
    'loan'
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
    'account',
    'card',
    'loan'
)
ORDER BY
    tc.table_name,
    tc.constraint_type,
    tc.constraint_name;

-- ============================================================================
-- END OF FILE
-- ============================================================================