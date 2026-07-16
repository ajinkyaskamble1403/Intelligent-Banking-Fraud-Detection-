/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 11_analytical_queries.sql
Description : Analytical SQL queries for reporting and business insights.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- BASIC RETRIEVAL QUERIES
-- ============================================================================

-- ============================================================================
-- QUERY 1
-- List all customers
-- ============================================================================

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    mobile_number,
    city,
    state

FROM customer

ORDER BY customer_id;

-- ============================================================================
-- QUERY 2
-- List all active accounts
-- ============================================================================

SELECT
    account_id,
    customer_id,
    account_number,
    balance

FROM account

WHERE account_status_id = 1

ORDER BY account_id;

-- ============================================================================
-- QUERY 3
-- List customers from Maharashtra
-- ============================================================================

SELECT
    customer_id,
    first_name,
    last_name,
    city

FROM customer

WHERE state = 'Maharashtra'

ORDER BY city,
         first_name;

-- ============================================================================
-- QUERY 4
-- Display accounts with balance greater than 100000
-- ============================================================================

SELECT
    account_id,
    account_number,
    balance

FROM account

WHERE balance > 100000

ORDER BY balance DESC;

-- ============================================================================
-- QUERY 5
-- Display all blocked cards
-- ============================================================================

SELECT
    card_id,
    account_id,
    masked_card_number,
    expiry_date

FROM card

WHERE card_status_id = 2

ORDER BY card_id;

-- ============================================================================
-- QUERY 6
-- Display all active loans
-- ============================================================================

SELECT
    loan_id,
    customer_id,
    loan_amount,
    interest_rate,
    loan_status

FROM loan

WHERE loan_status = 'ACTIVE'

ORDER BY loan_amount DESC;

-- ============================================================================
-- QUERY 7
-- Display all suspicious transactions
-- ============================================================================

SELECT
    transaction_id,
    account_id,
    transaction_amount,
    transaction_channel,
    transaction_timestamp

FROM bank_transaction

WHERE is_suspicious = TRUE

ORDER BY transaction_timestamp DESC;

-- ============================================================================
-- QUERY 8
-- Display all merchants in Mumbai
-- ============================================================================

SELECT
    merchant_id,
    merchant_name,
    city,
    state

FROM merchant

WHERE city = 'Mumbai'

ORDER BY merchant_name;

-- ============================================================================
-- QUERY 9
-- Display fraud alerts with risk score greater than 80
-- ============================================================================

SELECT
    fraud_alert_id,
    transaction_id,
    risk_score,
    alert_status

FROM fraud_alert

WHERE risk_score > 80

ORDER BY risk_score DESC;

-- ============================================================================
-- QUERY 10
-- Display employees hired after 2022
-- ============================================================================

SELECT
    employee_id,
    first_name,
    last_name,
    designation,
    hire_date

FROM employee

WHERE hire_date >= '2022-01-01'

ORDER BY hire_date;

-- ============================================================================
-- JOIN QUERIES
-- ============================================================================

-- ============================================================================
-- QUERY 11
-- Display customer account details
-- ============================================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance

FROM customer c

INNER JOIN account a

ON c.customer_id = a.customer_id

ORDER BY c.customer_id;

-- ============================================================================
-- QUERY 12
-- Display account with branch details
-- ============================================================================

SELECT
    a.account_number,
    b.branch_name,
    b.city,
    a.balance

FROM account a

INNER JOIN branch b

ON a.branch_id = b.branch_id

ORDER BY b.branch_name;

-- ============================================================================
-- QUERY 13
-- Display customer card information
-- ============================================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    cd.masked_card_number,
    cd.expiry_date

FROM customer c

INNER JOIN account a

ON c.customer_id = a.customer_id

INNER JOIN card cd

ON a.account_id = cd.account_id

ORDER BY c.customer_id;

-- ============================================================================
-- QUERY 14
-- Display customer loan information
-- ============================================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    l.loan_amount,
    l.loan_status

FROM customer c

INNER JOIN loan l

ON c.customer_id = l.customer_id

ORDER BY l.loan_amount DESC;

-- ============================================================================
-- QUERY 15
-- Display transaction details with merchant information
-- ============================================================================

SELECT
    bt.transaction_id,
    bt.transaction_amount,
    bt.transaction_channel,
    m.merchant_name,
    m.city

FROM bank_transaction bt

INNER JOIN merchant m

ON bt.merchant_id = m.merchant_id

ORDER BY bt.transaction_timestamp DESC;

-- ============================================================================
-- QUERY 16
-- Display fraud alerts with transaction details
-- ============================================================================

SELECT
    fa.fraud_alert_id,
    bt.transaction_id,
    bt.transaction_amount,
    fa.risk_score,
    fa.alert_status

FROM fraud_alert fa

INNER JOIN bank_transaction bt

ON fa.transaction_id = bt.transaction_id

ORDER BY fa.risk_score DESC;

-- ============================================================================
-- QUERY 17
-- Display customer transactions with account details
-- ============================================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    bt.transaction_id,
    bt.transaction_amount

FROM customer c

INNER JOIN account a

ON c.customer_id = a.customer_id

INNER JOIN bank_transaction bt

ON a.account_id = bt.account_id

ORDER BY c.customer_id,
         bt.transaction_timestamp DESC;

-- ============================================================================
-- QUERY 18
-- Display employee and branch details
-- ============================================================================

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.designation,
    b.branch_name,
    b.city

FROM employee e

INNER JOIN branch b

ON e.branch_id = b.branch_id

ORDER BY b.branch_name,
         e.first_name;

-- ============================================================================
-- QUERY 19
-- Display customer, account and branch information
-- ============================================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    b.branch_name,
    a.balance

FROM customer c

INNER JOIN account a

ON c.customer_id = a.customer_id

INNER JOIN branch b

ON a.branch_id = b.branch_id

ORDER BY c.customer_id;

-- ============================================================================
-- QUERY 20
-- Display fraud alerts with customer information
-- ============================================================================

SELECT
    fa.fraud_alert_id,
    c.customer_id,
    c.first_name,
    c.last_name,
    bt.transaction_amount,
    fa.risk_score,
    fa.alert_status

FROM fraud_alert fa

INNER JOIN bank_transaction bt

ON fa.transaction_id = bt.transaction_id

INNER JOIN account a

ON bt.account_id = a.account_id

INNER JOIN customer c

ON a.customer_id = c.customer_id

ORDER BY fa.risk_score DESC;

-- ============================================================================
-- AGGREGATE & GROUPING QUERIES
-- ============================================================================

-- ============================================================================
-- QUERY 21
-- Display total account balance by branch
-- ============================================================================

SELECT
    b.branch_name,
    SUM(a.balance) AS total_balance

FROM branch b

INNER JOIN account a

ON b.branch_id = a.branch_id

GROUP BY
    b.branch_name

ORDER BY
    total_balance DESC;

-- ============================================================================
-- QUERY 22
-- Display number of accounts in each branch
-- ============================================================================

SELECT
    b.branch_name,
    COUNT(a.account_id) AS total_accounts

FROM branch b

INNER JOIN account a

ON b.branch_id = a.branch_id

GROUP BY
    b.branch_name

ORDER BY
    total_accounts DESC;

-- ============================================================================
-- QUERY 23
-- Display average account balance by account type
-- ============================================================================

SELECT
    at.account_type_name,
    ROUND(AVG(a.balance), 2) AS average_balance

FROM account a

INNER JOIN account_type at

ON a.account_type_id = at.account_type_id

GROUP BY
    at.account_type_name

ORDER BY
    average_balance DESC;

-- ============================================================================
-- QUERY 24
-- Display total loan amount by loan status
-- ============================================================================

SELECT
    loan_status,
    SUM(loan_amount) AS total_loan_amount

FROM loan

GROUP BY
    loan_status

ORDER BY
    total_loan_amount DESC;

-- ============================================================================
-- QUERY 25
-- Display total transaction amount by transaction channel
-- ============================================================================

SELECT
    transaction_channel,
    SUM(transaction_amount) AS total_transaction_amount

FROM bank_transaction

GROUP BY
    transaction_channel

ORDER BY
    total_transaction_amount DESC;

-- ============================================================================
-- QUERY 26
-- Display branches having more than five accounts
-- ============================================================================

SELECT
    b.branch_name,
    COUNT(a.account_id) AS total_accounts

FROM branch b

INNER JOIN account a

ON b.branch_id = a.branch_id

GROUP BY
    b.branch_name

HAVING
    COUNT(a.account_id) > 5

ORDER BY
    total_accounts DESC;

-- ============================================================================
-- QUERY 27
-- Display merchant transaction statistics
-- ============================================================================

SELECT
    m.merchant_name,
    COUNT(bt.transaction_id) AS total_transactions,
    SUM(bt.transaction_amount) AS total_transaction_amount,
    ROUND(AVG(bt.transaction_amount), 2) AS average_transaction_amount

FROM merchant m

INNER JOIN bank_transaction bt

ON m.merchant_id = bt.merchant_id

GROUP BY
    m.merchant_name

ORDER BY
    total_transaction_amount DESC;

-- ============================================================================
-- QUERY 28
-- Display fraud alerts by status
-- ============================================================================

SELECT
    alert_status,
    COUNT(fraud_alert_id) AS total_alerts,
    ROUND(AVG(risk_score), 2) AS average_risk_score

FROM fraud_alert

GROUP BY
    alert_status

ORDER BY
    total_alerts DESC;

-- ============================================================================
-- QUERY 29
-- Display customers having multiple accounts
-- ============================================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(a.account_id) AS total_accounts

FROM customer c

INNER JOIN account a

ON c.customer_id = a.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

HAVING
    COUNT(a.account_id) > 1

ORDER BY
    total_accounts DESC,
    c.customer_id;

-- ============================================================================
-- QUERY 30
-- Display total deposits handled by each branch
-- ============================================================================

SELECT
    b.branch_name,
    COUNT(a.account_id) AS total_accounts,
    SUM(a.balance) AS total_deposits,
    ROUND(AVG(a.balance), 2) AS average_account_balance

FROM branch b

INNER JOIN account a

ON b.branch_id = a.branch_id

GROUP BY
    b.branch_name

ORDER BY
    total_deposits DESC;

-- ============================================================================
-- SUBQUERIES & CTE QUERIES
-- ============================================================================

-- ============================================================================
-- QUERY 31
-- Display accounts having balance above average balance
-- ============================================================================

SELECT
    account_id,
    account_number,
    balance

FROM account

WHERE balance >
(
    SELECT
        AVG(balance)

    FROM account
)

ORDER BY
    balance DESC;

-- ============================================================================
-- QUERY 32
-- Display customer having the highest account balance
-- ============================================================================

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance

FROM customer c

INNER JOIN account a

ON c.customer_id = a.customer_id

WHERE a.balance =
(
    SELECT
        MAX(balance)

    FROM account
);

-- ============================================================================
-- QUERY 33
-- Display merchants having transactions above average transaction amount
-- ============================================================================

SELECT DISTINCT
    m.merchant_id,
    m.merchant_name

FROM merchant m

INNER JOIN bank_transaction bt

ON m.merchant_id = bt.merchant_id

WHERE bt.transaction_amount >
(
    SELECT
        AVG(transaction_amount)

    FROM bank_transaction
)

ORDER BY
    m.merchant_name;

-- ============================================================================
-- QUERY 34
-- Display customers who have not taken any loan
-- ============================================================================

SELECT
    customer_id,
    first_name,
    last_name

FROM customer

WHERE customer_id NOT IN
(
    SELECT
        customer_id

    FROM loan
)

ORDER BY
    customer_id;

-- ============================================================================
-- QUERY 35
-- Display total transaction amount for each customer using CTE
-- ============================================================================

WITH customer_transactions AS
(
    SELECT
        a.customer_id,
        SUM(bt.transaction_amount) AS total_transaction_amount

    FROM account a

    INNER JOIN bank_transaction bt

    ON a.account_id = bt.account_id

    GROUP BY
        a.customer_id
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    ct.total_transaction_amount

FROM customer c

INNER JOIN customer_transactions ct

ON c.customer_id = ct.customer_id

ORDER BY
    ct.total_transaction_amount DESC;

-- ============================================================================
-- QUERY 36
-- Display branches with total deposits greater than the average branch deposits
-- ============================================================================

WITH branch_deposits AS
(
    SELECT
        branch_id,
        SUM(balance) AS total_deposits

    FROM account

    GROUP BY
        branch_id
)

SELECT
    b.branch_name,
    bd.total_deposits

FROM branch b

INNER JOIN branch_deposits bd

ON b.branch_id = bd.branch_id

WHERE bd.total_deposits >
(
    SELECT
        AVG(total_deposits)

    FROM branch_deposits
)

ORDER BY
    bd.total_deposits DESC;

-- ============================================================================
-- QUERY 37
-- Display customers whose total account balance exceeds 200000
-- ============================================================================

WITH customer_balance AS
(
    SELECT
        customer_id,
        SUM(balance) AS total_balance

    FROM account

    GROUP BY
        customer_id
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    cb.total_balance

FROM customer c

INNER JOIN customer_balance cb

ON c.customer_id = cb.customer_id

WHERE cb.total_balance > 200000

ORDER BY
    cb.total_balance DESC;

-- ============================================================================
-- QUERY 38
-- Display the latest transaction for each account
-- ============================================================================

SELECT
    bt.account_id,
    bt.transaction_id,
    bt.transaction_amount,
    bt.transaction_timestamp

FROM bank_transaction bt

WHERE bt.transaction_timestamp =
(
    SELECT
        MAX(bt2.transaction_timestamp)

    FROM bank_transaction bt2

    WHERE bt2.account_id = bt.account_id
)

ORDER BY
    bt.account_id;

-- ============================================================================
-- QUERY 39
-- Display merchants having more than ten transactions
-- ============================================================================

SELECT
    merchant_name,
    total_transactions

FROM
(
    SELECT
        m.merchant_name,
        COUNT(bt.transaction_id) AS total_transactions

    FROM merchant m

    INNER JOIN bank_transaction bt

    ON m.merchant_id = bt.merchant_id

    GROUP BY
        m.merchant_name
) merchant_summary

WHERE total_transactions > 10

ORDER BY
    total_transactions DESC;

-- ============================================================================
-- QUERY 40
-- Display customers with active loans and active accounts
-- ============================================================================

SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name

FROM customer c

INNER JOIN account a

ON c.customer_id = a.customer_id

INNER JOIN loan l

ON c.customer_id = l.customer_id

WHERE a.account_status_id = 1

AND l.loan_status = 'ACTIVE'

ORDER BY
    c.customer_id;

-- ============================================================================
-- WINDOW FUNCTION QUERIES
-- ============================================================================

-- ============================================================================
-- QUERY 41
-- Rank accounts by balance
-- ============================================================================

SELECT
    account_id,
    account_number,
    balance,
    RANK() OVER
    (
        ORDER BY balance DESC
    ) AS balance_rank

FROM account;

-- ============================================================================
-- QUERY 42
-- Dense rank customers by total account balance
-- ============================================================================

SELECT
    customer_id,
    total_balance,
    DENSE_RANK() OVER
    (
        ORDER BY total_balance DESC
    ) AS customer_rank

FROM
(
    SELECT
        customer_id,
        SUM(balance) AS total_balance

    FROM account

    GROUP BY customer_id
) customer_balance;

-- ============================================================================
-- QUERY 43
-- Row number for transactions within each account
-- ============================================================================

SELECT
    account_id,
    transaction_id,
    transaction_amount,
    transaction_timestamp,
    ROW_NUMBER() OVER
    (
        PARTITION BY account_id
        ORDER BY transaction_timestamp
    ) AS transaction_number

FROM bank_transaction;

-- ============================================================================
-- QUERY 44
-- Previous transaction amount for every account
-- ============================================================================

SELECT
    account_id,
    transaction_id,
    transaction_amount,
    LAG(transaction_amount) OVER
    (
        PARTITION BY account_id
        ORDER BY transaction_timestamp
    ) AS previous_transaction

FROM bank_transaction;

-- ============================================================================
-- QUERY 45
-- Next transaction amount for every account
-- ============================================================================

SELECT
    account_id,
    transaction_id,
    transaction_amount,
    LEAD(transaction_amount) OVER
    (
        PARTITION BY account_id
        ORDER BY transaction_timestamp
    ) AS next_transaction

FROM bank_transaction;

-- ============================================================================
-- QUERY 46
-- Running transaction total for each account
-- ============================================================================

SELECT
    account_id,
    transaction_id,
    transaction_timestamp,
    transaction_amount,
    SUM(transaction_amount) OVER
    (
        PARTITION BY account_id
        ORDER BY transaction_timestamp
    ) AS running_total

FROM bank_transaction;

-- ============================================================================
-- QUERY 47
-- Running account balance by customer
-- ============================================================================

SELECT
    customer_id,
    account_number,
    balance,
    SUM(balance) OVER
    (
        PARTITION BY customer_id
        ORDER BY account_id
    ) AS cumulative_balance

FROM account;

-- ============================================================================
-- QUERY 48
-- Highest transaction in each account
-- ============================================================================

SELECT
    account_id,
    transaction_id,
    transaction_amount,
    MAX(transaction_amount) OVER
    (
        PARTITION BY account_id
    ) AS highest_transaction

FROM bank_transaction;

-- ============================================================================
-- QUERY 49
-- Average transaction amount for each account
-- ============================================================================

SELECT
    account_id,
    transaction_id,
    transaction_amount,
    ROUND
    (
        AVG(transaction_amount) OVER
        (
            PARTITION BY account_id
        ),
        2
    ) AS average_transaction

FROM bank_transaction;

-- ============================================================================
-- QUERY 50
-- Rank merchants by total transaction amount
-- ============================================================================

SELECT
    merchant_name,
    total_transaction_amount,
    RANK() OVER
    (
        ORDER BY total_transaction_amount DESC
    ) AS merchant_rank

FROM
(
    SELECT
        m.merchant_name,
        SUM(bt.transaction_amount) AS total_transaction_amount

    FROM merchant m

    INNER JOIN bank_transaction bt

    ON m.merchant_id = bt.merchant_id

    GROUP BY
        m.merchant_name
) merchant_summary;

-- ============================================================================
-- END OF FILE
-- ============================================================================