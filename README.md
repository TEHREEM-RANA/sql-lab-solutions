# 🗄️ SQL Lab Vault

Welcome to my **SQL Lab Vault**! This repository contains my hands-on database lab tasks, schema designs, and query solutions developed during my Database Management Systems (DBMS) lab coursework.

---

## 📁 Repository Structure

```text
sql-lab-vault/
├── README.md
├── Lab-01-DDL-DML-Fundamentals/
│   └── lab01_company_db.sql
└── Lab-02-Relational-Schemas-And-Joins/
    └── lab02_joins_and_relationships.sql
🧪 Labs Overview
📌 Lab 01: DDL & DML Fundamentals (Company Database)
Focuses on core SQL operations including Database & Table creation, Data Insertion, Modifications, Data Filtering, Column Manipulations, and Cleanup operations.

Database Name: Company

Key Topics Covered:

DDL Commands: CREATE DATABASE, CREATE TABLE, ALTER TABLE, TRUNCATE TABLE, DROP TABLE, DROP DATABASE

DML Commands: INSERT INTO, UPDATE (with conditional filtering), DELETE

Data Querying: Filtering with WHERE, duplicate removal via DISTINCT, column aliasing (AS)

String Operations: Data formatting using CONCAT() and string concatenation (+)

📌 Lab 02: Relational Schemas & JOIN Operations (Lab2 Database)
Focuses on relational entity modeling, primary & foreign key relationships, and implementing various SQL JOIN techniques.

Database Name: Lab2

Schemas Implemented:

Sailors, Boats & Reserves System: Multi-table reservation tracking using INNER JOIN and condition filters (OR, ORDER BY).

Department & Projects System: Handling optional attributes and unassigned entities using LEFT OUTER JOIN.

University Management System: Modeling Many-to-Many (N:M) relationships using junction/bridge tables (Student_Course).

Teacher Hierarchy: Self-referential relationship mapping using SELF JOIN.

Key Topics Covered:

Referential integrity with PRIMARY KEY and FOREIGN KEY constraints

Multi-table INNER JOIN (up to 4 tables)

LEFT OUTER JOIN for null handling

SELF JOIN for internal reporting hierarchies

🚀 How to Run
Open SQL Server Management Studio (SSMS) or any preferred SQL IDE.

Clone this repository:

Bash
git clone [https://github.com/your-username/sql-lab-vault.git](https://github.com/your-username/sql-lab-vault.git)
Open the .sql file for the corresponding lab.

Execute the script sequentially to initialize the database, insert sample records, and view query output.

🛠️ Tools & Technologies
Database Platform: Microsoft SQL Server / T-SQL

IDE: SQL Server Management Studio (SSMS)


