/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 08_triggers.sql
Description : Creates trigger functions and triggers.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- TRIGGER FUNCTION : UPDATE UPDATED_AT COLUMN
-- Description : Automatically updates updated_at before record modification
-- ============================================================================

CREATE OR REPLACE FUNCTION fn_update_updated_at()

RETURNS TRIGGER

LANGUAGE plpgsql

AS
$$

BEGIN

    NEW.updated_at := CURRENT_TIMESTAMP;

    RETURN NEW;

END;

$$;

-- ============================================================================
-- TRIGGER : CUSTOMER
-- ============================================================================

DROP TRIGGER IF EXISTS trg_customer_updated_at
ON customer;

CREATE TRIGGER trg_customer_updated_at

BEFORE UPDATE

ON customer

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER : BRANCH
-- ============================================================================

DROP TRIGGER IF EXISTS trg_branch_updated_at
ON branch;

CREATE TRIGGER trg_branch_updated_at

BEFORE UPDATE

ON branch

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER : EMPLOYEE
-- ============================================================================

DROP TRIGGER IF EXISTS trg_employee_updated_at
ON employee;

CREATE TRIGGER trg_employee_updated_at

BEFORE UPDATE

ON employee

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER : ACCOUNT
-- ============================================================================

DROP TRIGGER IF EXISTS trg_account_updated_at
ON account;

CREATE TRIGGER trg_account_updated_at

BEFORE UPDATE

ON account

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER : CARD
-- ============================================================================

DROP TRIGGER IF EXISTS trg_card_updated_at
ON card;

CREATE TRIGGER trg_card_updated_at

BEFORE UPDATE

ON card

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER : LOAN
-- ============================================================================

DROP TRIGGER IF EXISTS trg_loan_updated_at
ON loan;

CREATE TRIGGER trg_loan_updated_at

BEFORE UPDATE

ON loan

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER : MERCHANT
-- ============================================================================

DROP TRIGGER IF EXISTS trg_merchant_updated_at
ON merchant;

CREATE TRIGGER trg_merchant_updated_at

BEFORE UPDATE

ON merchant

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER : BANK TRANSACTION
-- ============================================================================

DROP TRIGGER IF EXISTS trg_bank_transaction_updated_at
ON bank_transaction;

CREATE TRIGGER trg_bank_transaction_updated_at

BEFORE UPDATE

ON bank_transaction

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER : FRAUD ALERT
-- ============================================================================

DROP TRIGGER IF EXISTS trg_fraud_alert_updated_at
ON fraud_alert;

CREATE TRIGGER trg_fraud_alert_updated_at

BEFORE UPDATE

ON fraud_alert

FOR EACH ROW

EXECUTE FUNCTION fn_update_updated_at();

-- ============================================================================
-- TRIGGER FUNCTION : MARK SUSPICIOUS TRANSACTIONS
-- Description : Automatically flags high-risk transactions
-- ============================================================================

CREATE OR REPLACE FUNCTION fn_mark_suspicious_transaction()

RETURNS TRIGGER

LANGUAGE plpgsql

AS
$$

BEGIN

    IF
    (
        NEW.transaction_amount >= 100000
    )
    OR
    (
        NEW.transaction_channel IN ('ONLINE', 'MOBILE')
        AND NEW.transaction_amount >= 50000
    )
    THEN

        NEW.is_suspicious := TRUE;

    END IF;

    RETURN NEW;

END;

$$;

-- ============================================================================
-- TRIGGER : MARK SUSPICIOUS TRANSACTIONS
-- ============================================================================

DROP TRIGGER IF EXISTS trg_mark_suspicious_transaction
ON bank_transaction;

CREATE TRIGGER trg_mark_suspicious_transaction

BEFORE INSERT OR UPDATE

ON bank_transaction

FOR EACH ROW

EXECUTE FUNCTION fn_mark_suspicious_transaction();

-- ============================================================================
-- VERIFICATION
-- ============================================================================

SELECT
    trigger_name,
    event_object_table
FROM information_schema.triggers
WHERE trigger_schema = 'public'
ORDER BY event_object_table,
         trigger_name;

-- ============================================================================
-- END OF FILE
-- ============================================================================