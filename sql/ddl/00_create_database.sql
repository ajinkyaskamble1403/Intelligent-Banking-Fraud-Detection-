/*
===============================================================================
Project     : Intelligent Banking Fraud Detection
File        : 00_create_database.sql
Description : Database setup and initialization script.
Author      : Ajinkya Kamble
===============================================================================
*/

-- ============================================================================
-- DATABASE SETUP
-- ============================================================================

/*
    Execute the following statement while connected to the default
    'postgres' database if the project database does not already exist.

    CREATE DATABASE banking_fraud_analytics
    WITH
        OWNER = postgres
        ENCODING = 'UTF8'
        TEMPLATE = template0;
*/

-- ============================================================================
-- CONNECT TO PROJECT DATABASE
-- ============================================================================

-- Open a new Query Tool connected to:
-- Database : banking_fraud_analytics

-- ============================================================================
-- SESSION CONFIGURATION
-- ============================================================================

SET client_encoding = 'UTF8';

SET datestyle = 'ISO, DMY';

SET timezone = 'Asia/Kolkata';

-- ============================================================================
-- VERIFICATION
-- ============================================================================

SELECT current_database() AS database_name;

SELECT current_user AS database_user;

SELECT version() AS postgresql_version;

SHOW server_encoding;

SHOW datestyle;

SHOW timezone;

-- ============================================================================
-- END OF FILE
-- ============================================================================