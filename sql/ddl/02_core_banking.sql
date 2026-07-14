/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 02_core_banking.sql
Description : Creates core banking master tables.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- CREATE BRANCH TABLE
-- ============================================================================

CREATE TABLE branch
(
    branch_id           BIGSERIAL,
    branch_code         VARCHAR(10) NOT NULL,
    branch_name         VARCHAR(100) NOT NULL,
    city                VARCHAR(100) NOT NULL,
    state               VARCHAR(100) NOT NULL,
    country             VARCHAR(100) NOT NULL DEFAULT 'India',
    contact_number      VARCHAR(15),
    email               VARCHAR(150),
    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_branch
        PRIMARY KEY (branch_id),

    CONSTRAINT uq_branch_code
        UNIQUE (branch_code),

    CONSTRAINT uq_branch_email
        UNIQUE (email)
);

-- ============================================================================
-- COMMENTS : BRANCH
-- ============================================================================

COMMENT ON TABLE branch IS
'Stores bank branch master information.';

COMMENT ON COLUMN branch.branch_id IS
'Unique identifier for each bank branch.';

COMMENT ON COLUMN branch.branch_code IS
'Unique code assigned to the bank branch.';

COMMENT ON COLUMN branch.branch_name IS
'Official name of the bank branch.';

COMMENT ON COLUMN branch.city IS
'City where the branch is located.';

COMMENT ON COLUMN branch.state IS
'State where the branch is located.';

COMMENT ON COLUMN branch.country IS
'Country where the branch operates.';

COMMENT ON COLUMN branch.contact_number IS
'Primary contact number of the branch.';

COMMENT ON COLUMN branch.email IS
'Official email address of the branch.';

COMMENT ON COLUMN branch.created_at IS
'Timestamp when the record was created.';

COMMENT ON COLUMN branch.updated_at IS
'Timestamp when the record was last updated.';
-- ============================================================================
-- CREATE CUSTOMER TABLE
-- ============================================================================

CREATE TABLE customer
(
    customer_id             BIGSERIAL,
    branch_id               BIGINT NOT NULL,
    first_name              VARCHAR(50) NOT NULL,
    last_name               VARCHAR(50) NOT NULL,
    date_of_birth           DATE NOT NULL,
    gender                  VARCHAR(10) NOT NULL,
    email                   VARCHAR(150) NOT NULL,
    phone_number            VARCHAR(15) NOT NULL,
    pan_number              VARCHAR(10) NOT NULL,
    aadhaar_number          VARCHAR(12) NOT NULL,
    address_line            VARCHAR(255) NOT NULL,
    city                    VARCHAR(100) NOT NULL,
    state                   VARCHAR(100) NOT NULL,
    postal_code             VARCHAR(10) NOT NULL,
    customer_status         VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_customer
        PRIMARY KEY (customer_id),

    CONSTRAINT fk_customer_branch
        FOREIGN KEY (branch_id)
        REFERENCES branch(branch_id),

    CONSTRAINT uq_customer_email
        UNIQUE (email),

    CONSTRAINT uq_customer_phone
        UNIQUE (phone_number),

    CONSTRAINT uq_customer_pan
        UNIQUE (pan_number),

    CONSTRAINT uq_customer_aadhaar
        UNIQUE (aadhaar_number),

    CONSTRAINT chk_customer_gender
        CHECK (gender IN ('MALE', 'FEMALE', 'OTHER')),

    CONSTRAINT chk_customer_status
        CHECK (customer_status IN ('ACTIVE', 'INACTIVE', 'BLOCKED')),

    CONSTRAINT chk_customer_dob
        CHECK (date_of_birth <= CURRENT_DATE)
);

-- ============================================================================
-- COMMENTS : CUSTOMER
-- ============================================================================

COMMENT ON TABLE customer IS
'Stores customer master information.';

COMMENT ON COLUMN customer.customer_id IS
'Unique identifier for each customer.';

COMMENT ON COLUMN customer.branch_id IS
'Branch where the customer account is registered.';

COMMENT ON COLUMN customer.first_name IS
'Customer first name.';

COMMENT ON COLUMN customer.last_name IS
'Customer last name.';

COMMENT ON COLUMN customer.date_of_birth IS
'Customer date of birth.';

COMMENT ON COLUMN customer.gender IS
'Customer gender.';

COMMENT ON COLUMN customer.email IS
'Registered email address.';

COMMENT ON COLUMN customer.phone_number IS
'Registered mobile number.';

COMMENT ON COLUMN customer.pan_number IS
'Permanent Account Number (PAN).';

COMMENT ON COLUMN customer.aadhaar_number IS
'Unique Aadhaar identification number.';

COMMENT ON COLUMN customer.address_line IS
'Residential address.';

COMMENT ON COLUMN customer.city IS
'Customer city.';

COMMENT ON COLUMN customer.state IS
'Customer state.';

COMMENT ON COLUMN customer.postal_code IS
'Postal or ZIP code.';

COMMENT ON COLUMN customer.customer_status IS
'Current status of the customer.';

COMMENT ON COLUMN customer.created_at IS
'Timestamp when the customer record was created.';

COMMENT ON COLUMN customer.updated_at IS
'Timestamp when the customer record was last updated.';
-- ============================================================================
-- CREATE EMPLOYEE TABLE
-- ============================================================================

CREATE TABLE employee
(
    employee_id             BIGSERIAL,
    branch_id               BIGINT NOT NULL,
    first_name              VARCHAR(50) NOT NULL,
    last_name               VARCHAR(50) NOT NULL,
    designation             VARCHAR(100) NOT NULL,
    email                   VARCHAR(150) NOT NULL,
    phone_number            VARCHAR(15) NOT NULL,
    hire_date               DATE NOT NULL,
    salary                  NUMERIC(12,2) NOT NULL,
    is_active               BOOLEAN NOT NULL DEFAULT TRUE,
    created_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_employee
        PRIMARY KEY (employee_id),

    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id)
        REFERENCES branch(branch_id),

    CONSTRAINT uq_employee_email
        UNIQUE (email),

    CONSTRAINT uq_employee_phone
        UNIQUE (phone_number),

    CONSTRAINT chk_employee_salary
        CHECK (salary > 0)
);

-- ============================================================================
-- COMMENTS : EMPLOYEE
-- ============================================================================

COMMENT ON TABLE employee IS
'Stores bank employee master information.';

COMMENT ON COLUMN employee.employee_id IS
'Unique identifier for each employee.';

COMMENT ON COLUMN employee.branch_id IS
'Branch where the employee is assigned.';

COMMENT ON COLUMN employee.first_name IS
'Employee first name.';

COMMENT ON COLUMN employee.last_name IS
'Employee last name.';

COMMENT ON COLUMN employee.designation IS
'Current job designation of the employee.';

COMMENT ON COLUMN employee.email IS
'Official employee email address.';

COMMENT ON COLUMN employee.phone_number IS
'Official employee contact number.';

COMMENT ON COLUMN employee.hire_date IS
'Date on which the employee joined the bank.';

COMMENT ON COLUMN employee.salary IS
'Current monthly salary of the employee.';

COMMENT ON COLUMN employee.is_active IS
'Indicates whether the employee is currently active.';

COMMENT ON COLUMN employee.created_at IS
'Timestamp when the employee record was created.';

COMMENT ON COLUMN employee.updated_at IS
'Timestamp when the employee record was last updated.';
-- ============================================================================
-- CREATE MERCHANT TABLE
-- ============================================================================

CREATE TABLE merchant
(
    merchant_id                BIGSERIAL,
    merchant_category_id       SMALLINT NOT NULL,
    merchant_name              VARCHAR(150) NOT NULL,
    contact_email              VARCHAR(150),
    contact_number             VARCHAR(15),
    city                       VARCHAR(100) NOT NULL,
    state                      VARCHAR(100) NOT NULL,
    country                    VARCHAR(100) NOT NULL DEFAULT 'India',
    is_active                  BOOLEAN NOT NULL DEFAULT TRUE,
    created_at                 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at                 TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_merchant
        PRIMARY KEY (merchant_id),

    CONSTRAINT fk_merchant_category
        FOREIGN KEY (merchant_category_id)
        REFERENCES merchant_category (merchant_category_id),

    CONSTRAINT uq_merchant_name
        UNIQUE (merchant_name),

    CONSTRAINT uq_merchant_email
        UNIQUE (contact_email),

    CONSTRAINT chk_merchant_email
        CHECK
        (
            contact_email IS NULL
            OR contact_email LIKE '%@%.%'
        )
);

-- ============================================================================
-- COMMENTS : MERCHANT
-- ============================================================================

COMMENT ON TABLE merchant IS
'Stores merchant master information.';

COMMENT ON COLUMN merchant.merchant_id IS
'Unique identifier for each merchant.';

COMMENT ON COLUMN merchant.merchant_category_id IS
'Merchant category reference.';

COMMENT ON COLUMN merchant.merchant_name IS
'Registered merchant name.';

COMMENT ON COLUMN merchant.contact_email IS
'Official merchant email address.';

COMMENT ON COLUMN merchant.contact_number IS
'Official merchant contact number.';

COMMENT ON COLUMN merchant.city IS
'City where the merchant operates.';

COMMENT ON COLUMN merchant.state IS
'State where the merchant operates.';

COMMENT ON COLUMN merchant.country IS
'Country where the merchant operates.';

COMMENT ON COLUMN merchant.is_active IS
'Indicates whether the merchant is currently active.';

COMMENT ON COLUMN merchant.created_at IS
'Timestamp when the merchant record was created.';

COMMENT ON COLUMN merchant.updated_at IS
'Timestamp when the merchant record was last updated.';

-- ============================================================================
-- VERIFICATION
-- ============================================================================

SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN
(
    'branch',
    'customer',
    'employee',
    'merchant'
)
ORDER BY table_name;

SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.table_schema = 'public'
  AND tc.table_name IN
(
    'branch',
    'customer',
    'employee',
    'merchant'
)
ORDER BY
    tc.table_name,
    tc.constraint_type,
    tc.constraint_name;

-- ============================================================================
-- END OF FILE
-- ============================================================================