# DataDigger SQL Database Documentation

## Introduction

Relational Database Management Systems (RDBMS) rely on SQL (Structured Query Language) to define, manipulate, and analyze data across interconnected entities. This database model establishes an E-commerce system architecture consisting of four core tables: **Customers**, **Orders**, **Products**, and **OrderDetails**. It demonstrates the complete lifecycle of data management—from initial schema creation and data insertion to record updates, deletions, referential integrity management, and business analytics extraction.

---

## Core SQL Concepts & Theory

### 1. Data Definition Language (DDL)
* **`CREATE TABLE`**: Defines the structural schema of relational entities by declaring column names, data types (e.g., `INT`, `VARCHAR`, `DECIMAL`, `DATE`), and constraints.

### 2. Data Manipulation Language (DML)
* **`INSERT INTO`**: Adds new rows of data into existing database tables.
* **`UPDATE`**: Modifies existing records based on specified filtering criteria.
* **`DELETE`**: Permanently removes records that match specific conditions.

### 3. Data Query Language (DQL)
* **`SELECT`**: Retrieves data from one or more tables based on functional parameters.

### 4. Database Integrity & Constraints
* **Primary Key (`PRIMARY KEY`)**: Uniquely identifies each record within a table, ensuring no duplicate entries exist.
* **Foreign Key (`FOREIGN KEY`)**: Maintains referential integrity by establishing parent-child relationships between tables (e.g., referencing `CustomerID` from `Customers` inside `Orders`).

### 5. Data Filtering & Analytical Aggregations
* **Conditional Filtering (`WHERE`, `BETWEEN`)**: Restricts returned rows using logical evaluations, price boundaries, or specific date ranges.
* **Aggregate Functions (`SUM`, `AVG`, `MAX`, `MIN`, `COUNT`)**: Evaluates numerical columns to produce summary metrics like total revenue, average order value, max/min prices, and transaction counts.
* **Grouping & Sorting (`GROUP BY`, `ORDER BY`, `LIMIT`)**: Organizes data into categorical subsets, orders results in ascending or descending sequence, and isolates top-performing records.

---

## Script Operations & Query Explanations

* **Customers Table Management:**
  * Schema created to maintain customer profiles.
  * Five initial customer records inserted.
  * Address updated for `CustomerID = 2`.
  * Inactive record removed where `CustomerID = 5`.
  * Filtered query executed to fetch active records matching the name 'Alice'.

* **Orders Table Management:**
  * Relational table created linking orders to customers via `CustomerID` as a Foreign Key.
  * Five customer orders recorded with transaction amounts and dates.
  * Total amount revised for `OrderID = 1` and canceled order (`OrderID = 3`) deleted.
  * Statistical metrics calculated to find the maximum, minimum, and average order values.

* **Products & Inventory Control:**
  * Inventory table defined containing product names, prices, and stock counts.
  * Products sorted in descending order based on unit price.
  * Unit price updated for `ProductID = 2`.
  * Out-of-stock items (`Stock = 0`) automatically purged from inventory.
  * Price range query executed for items priced between $500 and $2000, along with queries identifying the highest and lowest-priced items.

* **OrderDetails & Revenue Analytics:**
  * Junction table established to map products to orders, tracking item quantities and calculated sub-totals.
  * Line items queried for `OrderID = 1`.
  * Total revenue generated across all sales computed using `SUM(SubTotal)`.
  * Product sales performance aggregated using `GROUP BY` and sorted to output the top 3 best-selling products by quantity ordered.

---

## Database Execution Output Tables

### 1. Customers Table (Final State)

| CustomerID | Name | Email | Address |
| :--- | :--- | :--- | :--- |
| 1 | Alice | alice@example.com | 123 Main St |
| 2 | Bob | bob@example.com | 999 New Ville St |
| 3 | Charlie | charlie@example.com | 789 Pine St |
| 4 | Alice | alice.smith@example.com | 101 Maple St |

### 2. Orders Table (Final State)

| OrderID | CustomerID | OrderDate | TotalAmount |
| :--- | :--- | :--- | :--- |
| 1 | 1 | 2023-10-01 | $1300.00 |
| 2 | 1 | 2023-10-15 | $800.00 |
| 4 | 4 | 2023-11-10 | $600.00 |
| 5 | 1 | 2023-11-12 | $2500.00 |

### 3. Products Table (Final State)

| ProductID | ProductName | Price | Stock |
| :--- | :--- | :--- | :--- |
| 1 | Laptop | $55000.00 | 10 |
| 2 | Wireless Mouse | $650.00 | 50 |
| 4 | Headphones | $1800.00 | 25 |
| 5 | USB Cable | $300.00 | 100 |

### 4. OrderDetails Table

| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
| :--- | :--- | :--- | :--- | :--- |
| 1 | 1 | 1 | 1 | $55000.00 |
| 2 | 1 | 2 | 2 | $1300.00 |
| 3 | 2 | 4 | 1 | $1800.00 |
| 4 | 4 | 2 | 3 | $1950.00 |
| 5 | 4 | 5 | 2 | $600.00 |

### 5. Orders Summary Analytics

| Highest Amount | Lowest Amount | Average Amount |
| :--- | :--- | :--- |
| $2500.00 | $600.00 | $1300.00 |

### 6. Top 3 Best-Selling Products

| ProductID | Total Ordered Quantity |
| :--- | :--- |
| 2 | 5 |
| 5 | 2 |
| 4 | 1 |

---

## Conclusion

This SQL database script demonstrates an end-to-end transactional pipeline typical of production E-commerce platforms. By combining schema definition, relational constraints, conditional data modification, and analytical aggregations, the database maintains data integrity while generating essential business intelligence metrics such as total revenue, customer purchasing patterns, and inventory demand trends.
