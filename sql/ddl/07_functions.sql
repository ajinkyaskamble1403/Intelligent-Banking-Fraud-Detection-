/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 07_functions.sql
Description : Creates reusable database functions.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- FUNCTION : GET CUSTOMER TOTAL BALANCE
-- Description : Returns the total balance across all active accounts
-- ============================================================================

CREATE OR REPLACE FUNCTION fn_get_customer_total_balance
(
    p_customer_id BIGINT
)

RETURNS NUMERIC(15,2)

LANGUAGE plpgsql

AS
$$

DECLARE

    v_total_balance NUMERIC(15,2);

BEGIN

    SELECT
        COALESCE(SUM(balance), 0)

    INTO v_total_balance

    FROM account

    WHERE customer_id = p_customer_id;

    RETURN v_total_balance;

END;

$$;

-- ============================================================================
-- FUNCTION : GET ACTIVE LOAN COUNT
-- Description : Returns the number of active loans of a customer
-- ============================================================================

CREATE OR REPLACE FUNCTION fn_get_active_loan_count
(
    p_customer_id BIGINT
)

RETURNS INTEGER

LANGUAGE plpgsql

AS
$$

DECLARE

    v_active_loans INTEGER;

BEGIN

    SELECT
        COUNT(*)

    INTO v_active_loans

    FROM loan

    WHERE customer_id = p_customer_id
      AND loan_status = 'ACTIVE';

    RETURN v_active_loans;

END;

$$;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

/*SELECT
    fn_get_customer_total_balance(1);

SELECT
    fn_get_active_loan_count(1);

-- ============================================================================
-- FUNCTION : CALCULATE RISK SCORE
-- Description : Calculates a basic fraud risk score for a transaction
-- ============================================================================
*/

CREATE OR REPLACE FUNCTION fn_calculate_risk_score
(
    p_transaction_id BIGINT
)

RETURNS NUMERIC(5,2)

LANGUAGE plpgsql

AS
$$

DECLARE

    v_amount           NUMERIC(15,2);
    v_channel          VARCHAR(20);
    v_is_suspicious    BOOLEAN;
    v_risk_score       NUMERIC(5,2) := 0;

BEGIN

    SELECT
        transaction_amount,
        transaction_channel,
        is_suspicious

    INTO
        v_amount,
        v_channel,
        v_is_suspicious

    FROM bank_transaction

    WHERE transaction_id = p_transaction_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION
            'Transaction ID % does not exist.',
            p_transaction_id;
    END IF;

    -- Amount Based Risk

    IF v_amount >= 100000 THEN
        v_risk_score := v_risk_score + 40;
    ELSIF v_amount >= 50000 THEN
        v_risk_score := v_risk_score + 25;
    ELSIF v_amount >= 10000 THEN
        v_risk_score := v_risk_score + 10;
    END IF;

    -- Channel Based Risk

    IF v_channel IN ('ONLINE', 'MOBILE') THEN
        v_risk_score := v_risk_score + 20;
    END IF;

    -- Existing Suspicious Flag

    IF v_is_suspicious THEN
        v_risk_score := v_risk_score + 40;
    END IF;

    IF v_risk_score > 100 THEN
        v_risk_score := 100;
    END IF;

    RETURN v_risk_score;

END;

$$;

-- ============================================================================
-- VERIFICATION
-- ============================================================================

/*SELECT
    fn_calculate_risk_score(1);
*/
SELECT
    routine_name,
    routine_type

FROM information_schema.routines

WHERE routine_schema = 'public'

AND routine_type = 'FUNCTION'

ORDER BY routine_name;

-- ============================================================================
-- END OF FILE
-- ============================================================================