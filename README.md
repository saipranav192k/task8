# 
# Task 8: Stored Procedures and Functions (SQL)

## 📌 Objective
To learn how to modularize SQL logic using **stored procedures** and **user-defined functions**, with parameters and conditional logic.

## 🛠️ Tools Used
- MySQL Workbench
- DB Browser for SQLite (not compatible with procedures/functions)
- Sample dataset: `Departments` and `Employees`

## 📂 Dataset Overview

Two tables were created for this task:

### 🔹 Departments Table
| Column   | Type    | Description         |
|----------|---------|---------------------|
| DeptID   | INT     | Primary Key         |
| DeptName | VARCHAR | Department Name     |

### 🔹 Employees Table
| Column   | Type    | Description                   |
|----------|---------|-------------------------------|
| EmpID    | INT     | Primary Key                   |
| EmpName  | VARCHAR | Employee Name                 |
| Salary   | INT     | Monthly Salary                |
| DeptID   | INT     | Foreign key referencing DeptID|

### ✅ Sample Data
| DeptID | DeptName |
|--------|----------|
| 1      | HR       |
| 2      | IT       |
| 3      | Sales    |

| EmpID | EmpName | Salary | DeptID |
|-------|---------|--------|--------|
| 101   | Alice   | 50000  | 1      |
| 102   | Bob     | 60000  | 2      |
| 103   | Charlie | 45000  | 1      |
| 104   | David   | 70000  | 3      |

---

## 🔧 SQL Logic

### 1️
