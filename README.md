# 📊 Freelancer-Data-Cleaning-Standardization-using-SQL

## 📌 Project Overview
This project focuses on cleaning and standardizing a raw freelancer dataset using SQL.  
The dataset contains inconsistent values, missing data, and unstructured formats which are transformed into a clean and analysis-ready dataset.

---

## ❗ Problem Statement
The dataset contains inconsistent formats, missing values, and unstructured data.  
This makes analysis difficult and unreliable without proper cleaning.

---

## 🎯 Objective
To convert raw freelancer data into a structured format by:
- Handling missing values
- Standardizing text and categorical data
- Cleaning numeric fields
- Creating reusable SQL views for analysis

---

## 🛠️ Tools & Technologies Used
- SQL (MySQL / PostgreSQL / pg4Admin)
- Views
- CTE (Common Table Expressions)
- String Functions (REPLACE, TRIM)
- Aggregation Functions (AVG, PERCENTILE_CONT)
- CASE WHEN logic

---

## 📁 Dataset Used
- [Noisy Dataset](https://github.com/Maanu-Hue/Freelancer-Data-Cleaning-Standardization-using-SQL/blob/main/global_freelancers_raw.csv)

---

## 🖼️ Noisy Data Preview
![Noisy Preview](https://github.com/Maanu-Hue/Freelancer-Data-Cleaning-Standardization-using-SQL/blob/main/Screenshot%202026-05-03%20140104.png)

---

## 🧹 Data Cleaning Steps

- Standardized gender values into Male, Female, Other  
- Cleaned names by removing titles and suffixes  
- Converted primary skills into consistent format  
- Cleaned hourly rate by removing symbols ($, USD)
- Calculated median hourly rate of freelancers as **40 USD**
- Handled missing age using mean imputation  
- Filled missing years of experience using median 
- Standardized boolean values (YES/NO/UNKNOWN)  
- Replaced missing rating and satisfaction values using median  

---

## 📊 Final Output
A cleaned and standardized freelancer dataset ready for:
- Data analysis
- Reporting

---

## 🖼️ Output / Results

![Output 1](https://github.com/Maanu-Hue/Freelancer-Data-Cleaning-Standardization-using-SQL/blob/main/Screenshot%202026-05-03%20140925.png)

![Output 2](https://github.com/Maanu-Hue/Freelancer-Data-Cleaning-Standardization-using-SQL/blob/main/Screenshot%202026-05-03%20135930.png)

![Output 3](https://github.com/Maanu-Hue/Freelancer-Data-Cleaning-Standardization-using-SQL/blob/main/Screenshot%202026-05-03%20141044.png)

![Output 4](https://github.com/Maanu-Hue/Freelancer-Data-Cleaning-Standardization-using-SQL/blob/main/Screenshot%202026-05-03%20141013.png)

---

## 📁 Project Structure

Freelancer-Data-Cleaning-Standardization-using-SQL/
│
├── sqlproject.sql
├── global_freelancers_raw.csv
├── README.md

---

## ✨ Key Features
- Data cleaning using SQL
- Missing value imputation (mean & median)
- Data standardization
- Use of views for modular transformation

---

## 👩‍💻 Project By
**Manasa**  
B.Sc Data Analytics Student  
Aspiring Data Analyst