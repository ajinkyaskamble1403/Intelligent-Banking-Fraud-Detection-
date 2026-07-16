# Intelligent Banking Fraud Detection & Risk Analytics System

## Project Overview

The Intelligent Banking Fraud Detection & Risk Analytics System is a PostgreSQL database project designed to simulate the core operations of a modern banking system while incorporating fraud detection and risk monitoring capabilities.

The project demonstrates database design principles, relational modeling, SQL programming, analytical reporting, and database testing through a realistic banking environment. It includes customers, accounts, cards, loans, merchants, banking transactions, fraud alerts, reporting views, reusable functions, triggers, stored procedures, analytical SQL queries, and comprehensive testing scripts.

This project was developed as a portfolio project to strengthen SQL and database development skills while following industry-oriented database design practices.

---

## Project Objectives

- Design a normalized relational banking database.
- Implement banking entities and relationships using PostgreSQL.
- Simulate banking transactions and fraud detection workflows.
- Demonstrate advanced SQL programming techniques.
- Develop reusable database functions and stored procedures.
- Generate analytical business reports using SQL.
- Validate the database through structured testing scripts.
- Build a professional GitHub portfolio project that reflects practical database development skills.

---

## Key Features

- Customer Management
- Branch Management
- Employee Management
- Account Management
- Debit/Credit Card Management
- Loan Management
- Merchant Management
- Banking Transaction Processing
- Fraud Alert Management
- Reporting Views
- User Defined Functions
- Database Triggers
- Stored Procedures
- Analytical SQL Queries
- Database Testing and Validation

---

## Technologies Used

| Category | Technology |
|----------|------------|
| Database | PostgreSQL |
| Query Language | SQL |
| Version Control | Git |
| Repository Hosting | GitHub |
| Documentation | Markdown |
| Development Environment | Visual Studio Code |

---

## Database Architecture

The database follows a normalized relational design to ensure data consistency, integrity, and scalability. The system models the core operations of a banking environment while supporting fraud detection and analytical reporting.

The database consists of the following major modules:

- Banking Branches
- Customers
- Employees
- Accounts
- Cards
- Loans
- Merchants
- Banking Transactions
- Fraud Alerts

The project also includes reporting views, reusable SQL functions, triggers, stored procedures, analytical queries, and testing scripts to simulate real-world banking operations.

---

## Project Structure

```text
Intelligent-Banking-Fraud-Detection/

├── sql/
│   ├── ddl/
│   │   ├── 00_create_database.sql
│   │   ├── 01_lookup_tables.sql
│   │   ├── 02_core_banking.sql
│   │   ├── 03_account_card_loan.sql
│   │   ├── 04_transactions_fraud.sql
│   │   ├── 05_indexes.sql
│   │   ├── 06_views.sql
│   │   ├── 07_functions.sql
│   │   ├── 08_triggers.sql
│   │   ├── 09_seed_data.sql
│   │   ├── 10_stored_procedures.sql
│   │   ├── 11_analytical_queries.sql
│   │   └── 12_testing.sql
│   │
│   └── documentation/
│       ├── README.md
│       ├── Database_Design_Specification.md
│       └── Project_Roadmap.md
│
└── diagrams/
    └── ER_Diagram.png
```

---

## Database Schema Overview

The database contains entities representing the major components of a banking system.

### Core Banking Tables

- branch
- customer
- employee
- account
- card
- loan
- merchant
- bank_transaction
- fraud_alert

### Lookup Tables

- account_type
- account_status
- card_type
- card_status
- loan_type
- transaction_type
- transaction_status
- fraud_status

These lookup tables improve data consistency by eliminating redundant values and enforcing controlled reference data throughout the database.

---

## SQL Concepts Demonstrated

This project demonstrates a wide range of SQL concepts, from fundamental queries to advanced database programming techniques.

### Database Design

- Database Creation
- Normalization
- Primary Keys
- Foreign Keys
- Constraints
- Data Integrity
- Relational Modeling

### Data Definition Language (DDL)

- CREATE DATABASE
- CREATE TABLE
- ALTER TABLE
- CREATE INDEX
- CREATE VIEW

### Data Manipulation Language (DML)

- INSERT
- UPDATE
- DELETE
- SELECT

### SQL Programming

- INNER JOIN
- LEFT JOIN
- Aggregate Functions
- GROUP BY
- HAVING
- Common Table Expressions (CTEs)
- Subqueries
- Window Functions
- User Defined Functions
- Stored Procedures
- Triggers

### Database Testing

- Object Verification
- Data Integrity Validation
- Stored Procedure Testing
- Trigger Testing
- View Testing
- Function Testing

---

## Installation & Setup

### Prerequisites

- PostgreSQL
- pgAdmin (or any PostgreSQL client)
- Git
- Visual Studio Code (recommended)

### Clone the Repository

```bash
git clone <repository-url>
```

### Create the Database

Execute the following SQL scripts in order using PostgreSQL.

---

## Execution Order

1. `00_create_database.sql`
2. `01_lookup_tables.sql`
3. `02_core_banking.sql`
4. `03_account_card_loan.sql`
5. `04_transactions_fraud.sql`
6. `05_indexes.sql`
7. `06_views.sql`
8. `07_functions.sql`
9. `08_triggers.sql`
10. `09_seed_data.sql`
11. `10_stored_procedures.sql`
12. `11_analytical_queries.sql`
13. `12_testing.sql`

---

## Sample Analytical Queries

The project includes fifty analytical SQL queries covering multiple reporting scenarios.

Some examples include:

- Customer Account Summary
- Branch Performance Analysis
- Merchant Transaction Analysis
- Fraud Alert Reporting
- Account Balance Analysis
- Transaction Trend Analysis
- Customer Ranking
- Merchant Ranking
- Running Transaction Totals
- Window Function Reporting

---

## Future Enhancements

The current implementation focuses on relational database design and SQL-based analytics. Future enhancements may include:

- Machine Learning based fraud detection models.
- Real-time transaction monitoring.
- Risk scoring using predictive analytics.
- Interactive dashboards using Power BI or Tableau.
- REST API integration.
- Role-Based Access Control (RBAC).
- Audit logging and compliance reporting.
- Scheduled reporting and automated notifications.
- Performance optimization for large-scale transaction datasets.
- Cloud deployment using managed PostgreSQL services.

---

## Project Statistics

| Metric | Value |
|---------|------:|
| SQL Scripts | 13 |
| Core Tables | 9 |
| Lookup Tables | 8 |
| Indexes | Multiple |
| Views | 4 |
| Functions | 5 |
| Triggers | 5 |
| Stored Procedures | 5 |
| Seeded Customers | 50 |
| Seeded Accounts | 70 |
| Seeded Cards | 70 |
| Seeded Loans | 20 |
| Seeded Merchants | 25 |
| Seeded Transactions | 300 |
| Seeded Fraud Alerts | 20 |
| Analytical Queries | 50 |

---

## Learning Outcomes

This project demonstrates practical experience with:

- Relational Database Design
- PostgreSQL Development
- Data Modeling
- Database Normalization
- SQL Programming
- Query Optimization
- Analytical Reporting
- Window Functions
- Common Table Expressions (CTEs)
- Stored Procedures
- User Defined Functions
- Database Triggers
- Data Integrity Validation
- Database Testing
- Git and GitHub Version Control

---

## Author

**Ajinkya Kamble**

Final Year Engineering Student  
Artificial Intelligence & Data Science

---

## License

This project is intended for educational and portfolio purposes.

---

## Acknowledgements

This project was developed as a hands-on SQL portfolio project to strengthen database design, SQL programming, analytical querying, and PostgreSQL development skills through the implementation of a realistic banking fraud detection and risk analytics system.