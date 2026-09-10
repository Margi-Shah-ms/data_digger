# 📊 DataDigger — SQL Database Project

## 📌 Project Overview

**DataDigger** is a SQL-based database project built using **PostgreSQL** to practice and demonstrate fundamental SQL concepts.

The project manages customers, orders, products, and order details while performing different database operations and basic business analysis.

---

## 🎯 Objectives

The main objectives of this project are to:

* Create relational database tables
* Define **Primary Keys** and **Foreign Keys**
* Insert, update, and delete records
* Retrieve and filter data using `SELECT` and `WHERE`
* Sort data using `ORDER BY`
* Use aggregate functions such as `MAX()`, `MIN()`, `AVG()`, `SUM()`, and `COUNT()`
* Group data using `GROUP BY`
* Filter values using `BETWEEN`
* Limit query results using `LIMIT`
* Understand relationships between multiple tables
* Perform basic sales and product analysis

---

## 🗄️ Database Structure

The project contains four main tables:

### 1. Customers

Stores customer information.

| Column     | Description        |
| ---------- | ------------------ |
| CustomerID | Unique customer ID |
| Name       | Customer name      |
| Email      | Customer email     |
| Address    | Customer address   |

**Primary Key:** `CustomerID`

---

### 2. Orders

Stores information about customer orders.

| Column      | Description                   |
| ----------- | ----------------------------- |
| OrderID     | Unique order ID               |
| CustomerID  | Customer who placed the order |
| OrderDate   | Date of the order             |
| TotalAmount | Total order amount            |

**Primary Key:** `OrderID`
**Foreign Key:** `CustomerID → Customers(CustomerID)`

---

### 3. Products

Stores product and inventory information.

| Column      | Description         |
| ----------- | ------------------- |
| ProductID   | Unique product ID   |
| ProductName | Name of the product |
| Price       | Product price       |
| Stock       | Available stock     |

**Primary Key:** `ProductID`

---

### 4. OrderDetails

Stores individual products included in orders.

| Column        | Description                 |
| ------------- | --------------------------- |
| OrderDetailID | Unique order-detail ID      |
| OrderID       | Related order               |
| ProductID     | Related product             |
| Quantity      | Quantity purchased          |
| SubTotal      | Total price for the product |

**Primary Key:** `OrderDetailID`

**Foreign Keys:**

* `OrderID → Orders(OrderID)`
* `ProductID → Products(ProductID)`

---

## 🔗 Table Relationships

```text
Customers
    │
    │ CustomerID
    ▼
  Orders
    │
    │ OrderID
    ▼
OrderDetails
    ▲
    │ ProductID
    │
 Products
```

### Relationship Summary

* One customer can have multiple orders.
* One order can contain multiple order details.
* One product can appear in multiple order details.

This creates a simple **relational database structure**.

---

## 🛠️ SQL Concepts Used

### DDL — Data Definition Language

Used to create database tables:

```sql
CREATE TABLE
```

### DML — Data Manipulation Language

Used to modify data:

```sql
INSERT
UPDATE
DELETE
```

### DQL — Data Query Language

Used to retrieve data:

```sql
SELECT
```

---

## 🔍 Data Retrieval & Filtering

The project uses:

```sql
WHERE
```

to filter records.

Example:

```sql
SELECT * 
FROM Customers
WHERE Name = 'Alice';
```

It also uses:

```sql
BETWEEN
```

for range filtering:

```sql
SELECT *
FROM Products
WHERE Price BETWEEN 500 AND 2000;
```

---

## 📈 Sorting & Limiting Data

Products are sorted according to price:

```sql
SELECT *
FROM Products
ORDER BY Price DESC;
```

The project also uses `LIMIT` to retrieve the top results:

```sql
LIMIT 3;
```

---

## 📊 Aggregate Functions

The project demonstrates several aggregate functions:

### MAX()

Finds the highest value.

```sql
SELECT MAX(Price)
FROM Products;
```

### MIN()

Finds the lowest value.

```sql
SELECT MIN(Price)
FROM Products;
```

### AVG()

Calculates the average.

```sql
SELECT AVG(TotalAmount)
FROM Orders;
```

### SUM()

Calculates the total.

```sql
SELECT SUM(SubTotal)
FROM OrderDetails;
```

### COUNT()

Counts records.

```sql
SELECT COUNT(*)
FROM OrderDetails
WHERE ProductID = 2;
```

---

## 📦 Grouping & Sales Analysis

The project groups products by their total ordered quantity:

```sql
SELECT ProductID, SUM(Quantity) AS totalordered
FROM OrderDetails
GROUP BY ProductID
ORDER BY totalordered DESC
LIMIT 3;
```

This helps identify the **top 3 most ordered products**.

---
