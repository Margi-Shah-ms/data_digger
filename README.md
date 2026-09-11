 video link: https://drive.google.com/file/d/1lvXxLDhA38hb7v3S8kfaXFPVxGXzRXyz/view?usp=sharing
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

<img width="611" height="178" alt="image" src="https://github.com/user-attachments/assets/4d08eb71-7b7b-48c4-a3bf-2e68c0984386" />


### 2. Orders Table (Final State)

<img width="419" height="165" alt="image" src="https://github.com/user-attachments/assets/2882d6cb-3c5e-40cf-8aee-994e9a9ec861" />


### 3. Products Table (Final State)

<img width="473" height="171" alt="image" src="https://github.com/user-attachments/assets/6f7d17d3-84b2-4b51-8f45-85ec2b940117" />


### 4. OrderDetails Table

<img width="477" height="168" alt="image" src="https://github.com/user-attachments/assets/d2815d1f-8c25-435c-ab0a-dfc3337befd5" />


### 5. Orders Summary Analytics

<img width="425" height="74" alt="image" src="https://github.com/user-attachments/assets/54f4b4c8-393c-43d5-804b-52af165fa31b" />


### 6. Top 3 Best-Selling Products

<img width="226" height="122" alt="image" src="https://github.com/user-attachments/assets/3e0ab7ae-1b19-4dc6-9c6c-377b88e9f2c2" />


---

## Conclusion

This SQL database script demonstrates an end-to-end transactional pipeline typical of production E-commerce platforms. By combining schema definition, relational constraints, conditional data modification, and analytical aggregations, the database maintains data integrity while generating essential business intelligence metrics such as total revenue, customer purchasing patterns, and inventory demand trends.
