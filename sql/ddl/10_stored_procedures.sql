/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 10_stored_procedures.sql
Description : Creates reusable stored procedures for banking operations.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- STORED PROCEDURE : TRANSFER FUNDS
-- Description : Transfers funds between two active accounts
-- ============================================================================

CREATE OR REPLACE PROCEDURE sp_transfer_funds
(
    IN p_from_account_id BIGINT,
    IN p_to_account_id BIGINT,
    IN p_amount NUMERIC(15,2)
)

LANGUAGE plpgsql

AS
$$

DECLARE

    v_from_balance NUMERIC(15,2);
    v_to_balance NUMERIC(15,2);

BEGIN

    IF p_from_account_id = p_to_account_id THEN

        RAISE EXCEPTION
            'Source and destination accounts cannot be the same.';

    END IF;

    IF p_amount <= 0 THEN

        RAISE EXCEPTION
            'Transfer amount must be greater than zero.';

    END IF;

    SELECT
        balance

    INTO
        v_from_balance

    FROM account

    WHERE account_id = p_from_account_id;

    IF NOT FOUND THEN

        RAISE EXCEPTION
            'Source account does not exist.';

    END IF;

    SELECT
        balance

    INTO
        v_to_balance

    FROM account

    WHERE account_id = p_to_account_id;

    IF NOT FOUND THEN

        RAISE EXCEPTION
            'Destination account does not exist.';

    END IF;

    IF v_from_balance < p_amount THEN

        RAISE EXCEPTION
            'Insufficient balance in source account.';

    END IF;

    UPDATE account

    SET
        balance = balance - p_amount

    WHERE account_id = p_from_account_id;

    UPDATE account

    SET
        balance = balance + p_amount

    WHERE account_id = p_to_account_id;

    RAISE NOTICE
        'Transfer completed successfully.';

END;

$$;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

CALL sp_transfer_funds
(
    1,
    2,
    1000.00
);

-- ============================================================================
-- STORED PROCEDURE : UPDATE ACCOUNT STATUS
-- Description : Updates the status of an existing account
-- ============================================================================

CREATE OR REPLACE PROCEDURE sp_update_account_status
(
    IN p_account_id BIGINT,
    IN p_account_status_id INTEGER
)

LANGUAGE plpgsql

AS
$$

DECLARE

    v_account_exists INTEGER;

BEGIN

    SELECT
        COUNT(*)

    INTO
        v_account_exists

    FROM account

    WHERE account_id = p_account_id;

    IF v_account_exists = 0 THEN

        RAISE EXCEPTION
            'Account ID % does not exist.',
            p_account_id;

    END IF;

    UPDATE account

    SET
        account_status_id = p_account_status_id

    WHERE account_id = p_account_id;

    RAISE NOTICE
        'Account status updated successfully.';

END;

$$;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

CALL sp_update_account_status
(
    1,
    2
);

-- ============================================================================
-- STORED PROCEDURE : BLOCK CARD
-- Description : Blocks a card by updating its status
-- ============================================================================

CREATE OR REPLACE PROCEDURE sp_block_card
(
    IN p_card_id BIGINT,
    IN p_card_status_id INTEGER
)

LANGUAGE plpgsql

AS
$$

DECLARE

    v_card_exists INTEGER;

BEGIN

    SELECT
        COUNT(*)

    INTO
        v_card_exists

    FROM card

    WHERE card_id = p_card_id;

    IF v_card_exists = 0 THEN

        RAISE EXCEPTION
            'Card ID % does not exist.',
            p_card_id;

    END IF;

    UPDATE card

    SET
        card_status_id = p_card_status_id

    WHERE card_id = p_card_id;

    RAISE NOTICE
        'Card blocked successfully.';

END;

$$;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

CALL sp_block_card
(
    1,
    2
);

-- ============================================================================
-- STORED PROCEDURE : CREATE FRAUD ALERT
-- Description : Creates a fraud alert for a transaction
-- ============================================================================

CREATE OR REPLACE PROCEDURE sp_create_fraud_alert
(
    IN p_transaction_id BIGINT,
    IN p_fraud_rule_id INTEGER,
    IN p_risk_score NUMERIC(5,2),
    IN p_alert_status VARCHAR(20),
    IN p_detected_by VARCHAR(20),
    IN p_remarks TEXT
)

LANGUAGE plpgsql

AS
$$

DECLARE

    v_transaction_exists INTEGER;

BEGIN

    SELECT
        COUNT(*)

    INTO
        v_transaction_exists

    FROM bank_transaction

    WHERE transaction_id = p_transaction_id;

    IF v_transaction_exists = 0 THEN

        RAISE EXCEPTION
            'Transaction ID % does not exist.',
            p_transaction_id;

    END IF;

    INSERT INTO fraud_alert
    (
        transaction_id,
        fraud_rule_id,
        risk_score,
        alert_status,
        detected_by,
        remarks
    )

    VALUES
    (
        p_transaction_id,
        p_fraud_rule_id,
        p_risk_score,
        p_alert_status,
        p_detected_by,
        p_remarks
    );

    RAISE NOTICE
        'Fraud alert created successfully.';

END;

$$;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

CALL sp_create_fraud_alert
(
    25,
    2,
    85.50,
    'OPEN',
    'RULE_ENGINE',
    'Suspicious high-value online transaction.'
);

-- ============================================================================
-- STORED PROCEDURE : UPDATE LOAN STATUS
-- Description : Updates the status of an existing loan
-- ============================================================================

CREATE OR REPLACE PROCEDURE sp_update_loan_status
(
    IN p_loan_id BIGINT,
    IN p_loan_status VARCHAR(20)
)

LANGUAGE plpgsql

AS
$$

DECLARE

    v_loan_exists INTEGER;

BEGIN

    SELECT
        COUNT(*)

    INTO
        v_loan_exists

    FROM loan

    WHERE loan_id = p_loan_id;

    IF v_loan_exists = 0 THEN

        RAISE EXCEPTION
            'Loan ID % does not exist.',
            p_loan_id;

    END IF;

    UPDATE loan

    SET
        loan_status = p_loan_status

    WHERE loan_id = p_loan_id;

    RAISE NOTICE
        'Loan status updated successfully.';

END;

$$;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

CALL sp_update_loan_status
(
    1,
    'CLOSED'
);

-- ============================================================================
-- VERIFY STORED PROCEDURES
-- ============================================================================

SELECT
    routine_name,
    routine_type

FROM information_schema.routines

WHERE routine_schema = 'public'

AND routine_type = 'PROCEDURE'

ORDER BY routine_name;

-- ============================================================================
-- END OF FILE
-- ============================================================================