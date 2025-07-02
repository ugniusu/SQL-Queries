# SQL Task Documentation

This repository contains SQL tasks related to employee job data extraction and reporting. The tasks are divided into two parts: **JOB1** and **JOB2**.

The solution was built and validated on a local setup running MySQL under XAMPP, enabling efficient testing and data management

---

## JOB1: Retrieve the Most Recent Active Job Record for a Specific Employee

**Objective:**  
Retrieve the latest active job record for a single employee by their employee ID. The result shows the most recent active employment entry, which reflects the current job status of that employee.

---

## JOB2: Retrieve Latest Active Job Records for All Employees with Additional Personal Details

**Objective:**  
Extract the most recent active job records for each employee in the database. Since employees may have multiple job entries, the query filters out to only keep the latest active record per employee.

Additionally, the query retrieves related personal data including:

- Birthdate
- Calculated age
- Gender (formatted as 'Male' or 'Female')
- Preferred phone number

The second part of JOB2 also generates a summary list of all job record IDs (EMPL_RCD) associated with each employee in a single concatenated string.

---

## Summary

- **JOB1** targets one employee, returning their most recent active job record.
- **JOB2** handles all employees, returning their latest active job records along with personal details and a summary of their job records.

---

## Queries

All SQL queries related to this project are available in the file linked below.  
You can easily access, copy, and run them by clicking the link:  
[SQL Queries](https://github.com/ugniusu/SQL-Queries/blob/main/sql_queries.sql)
