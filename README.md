# 📊 Customer Churn Analysis

### An End-to-End Data Analytics Project

**Excel → Python → MySQL → SQL → Power BI**

A complete customer churn analysis project focused on understanding customer retention, subscription behavior, tenure, revenue, customer support interactions, and observed churn patterns.

**Dataset:** 521 Customers
**Prepared by:** Nabin Roy

---

## 📌 Project Overview

Customer churn is an important business problem because losing existing customers can affect customer retention and revenue.

This project analyzes customer churn using:

* Customer demographics
* Subscription information
* Contract and plan details
* Customer tenure
* Revenue-related information
* Churn risk
* Customer complaints
* Escalations
* Customer satisfaction

The project follows an end-to-end data analytics workflow:

> **Excel → Python → MySQL → SQL → Power BI**

Python was used for data cleaning, preparation, feature engineering, exploratory data analysis, and visualization.

MySQL was used to store the prepared dataset and perform business-oriented SQL analysis.

Power BI was used to build an interactive **five-page dashboard** for presenting the major findings.

The final analytical dataset contains **521 customers**.

---

# 🎯 Business Problem

The primary goal of this project is to understand customer churn patterns and identify customer segments or characteristics associated with observed churn.

The analysis focuses on questions such as:

* What percentage of customers have churned?
* How does churn vary across customer groups?
* Does customer tenure differ between churned and active customers?
* Does subscription, plan, or contract type vary in churn rate?
* How does churn relate to revenue?
* Do customers with complaints have different observed churn rates?
* How does customer satisfaction differ between churned and active customers?
* Which states have the highest numbers of churned customers?

> **Note:** This project focuses on descriptive analysis of the available dataset rather than building a predictive churn model.

---

# 🎯 Project Objectives

1. Clean and prepare the raw customer datasets.
2. Combine customer, subscription, and support information.
3. Create useful analytical features.
4. Perform exploratory data analysis using Python.
5. Perform business-oriented SQL analysis using MySQL.
6. Build an interactive Power BI dashboard.
7. Identify important patterns related to customer churn.
8. Present the findings in a clear and business-oriented format.

---

# 🗂️ Dataset

The project uses three main datasets:

### 👤 Customer Data

* Customer ID
* Customer Name
* Country
* State
* Gender
* Date of Birth
* Age
* Age Group

### 💳 Subscription Data

* Customer ID
* Subscription Start Date
* Subscription Type
* Renewal Date
* Plan Type
* Contract Type
* Cancellation Date
* Cancellation Reason
* Monthly Charges
* CLTV
* Churn Score
* Churn Flag
* Tenure
* Annual Charges
* Tenure Group
* Churn Risk Group

### 🎧 Customer Support Data

* Customer ID
* Complaint Date
* Escalation Status
* CSAT Score
* Complaint Count
* Escalation Count
* Average CSAT Score
* Last Complaint Date

After cleaning and combining the datasets, the final analytical dataset contained **521 customer records**.

---

# 🧹 Data Cleaning & Preparation

Python and Pandas were used to prepare the datasets for analysis.

The main data preparation steps included:

* Checking dataset structure and data types
* Checking missing values
* Removing unnecessary columns
* Converting date columns into appropriate datetime formats
* Checking duplicate records
* Handling missing country information using available state-country relationships
* Standardizing relevant fields
* Checking customer-level uniqueness
* Aggregating customer support records
* Combining customer, subscription, and support datasets

The customer and subscription datasets contained one record per customer, while the support dataset could contain multiple records for the same customer.

Therefore, support information was aggregated at the customer level before merging.

---

# ⚙️ Feature Engineering

Several analytical features were created to make the raw data more useful for analysis.

### Age

Calculated from the customer's date of birth.

### Age Group

Customers were grouped into:

* 18–25
* 26–35
* 36–45
* 46–55
* 56–65

### Churn Flag

A binary churn indicator was created:

* `0` = Not Churned
* `1` = Churned

The flag was derived from cancellation information.

### Tenure

Customer tenure was calculated using subscription dates and represented in days and years.

### Tenure Group

Customers were grouped into:

* 0–1 years
* 1–3 years
* 3–5 years
* 5–7 years
* 7+ years

### Annual Charges

Calculated using:

`Annual Charges = Monthly Charges × 12`

### Churn Risk Group

Customers were categorized according to their churn scores.

### Support Features

Additional support-related features included:

* Escalation Flag
* Complaint Year
* Complaint Month
* Complaint Count
* Escalation Count
* Average CSAT Score
* Last Complaint Date

---

# 🔍 Exploratory Data Analysis

Exploratory analysis was performed using Python to understand customer characteristics and identify patterns related to churn.

The analysis covered:

* Age
* Gender
* Geography
* Subscription Type
* Plan Type
* Contract Type
* Tenure
* Revenue
* Churn Risk
* Complaints
* Escalations
* Customer Satisfaction

One major pattern observed was the difference in churn across customer-tenure groups. Shorter-tenure customers showed substantially higher observed churn than longer-tenure customers in this dataset.

The analysis also showed differences in observed churn across plans, subscription types, age groups, and geographic areas.

---

# 🗄️ MySQL & SQL Analysis

The prepared dataset was loaded into MySQL for business-oriented analysis.

**Database:** `customer_churn_analysis`

**Table:** `customer_churn_data`

The SQL analysis answered 12 major business questions.

### Q1. Total Number of Customers

**521 customers**

### Q2. Overall Churn Rate

**26.30% observed churn rate**

### Q3. Customers by Contract Type

| Contract Type | Customers |
| ------------- | --------: |
| Annual        |       254 |
| Monthly       |       267 |

### Q4. Churn Rate by Subscription Type

| Subscription Type | Churn Rate |
| ----------------- | ---------: |
| Referral          |     29.35% |
| Paid              |     23.64% |
| Organic           |     25.58% |

### Q5. Average Tenure of Churned vs Active Customers

| Customer Status | Average Tenure |
| --------------- | -------------: |
| Not Churned     |     4.64 years |
| Churned         |     1.68 years |

### Q6. Annualized Revenue of Active vs Churned Customers

| Customer Status | Annualized Revenue |
| --------------- | -----------------: |
| Not Churned     |          68,831.04 |
| Churned         |          24,872.64 |

### Q7. Churn Rate by Plan Type

| Plan Type | Churn Rate |
| --------- | ---------: |
| Standard  |     26.60% |
| Premium   |     28.91% |
| Basic     |     24.21% |

### Q8. Churn Rate by Age Group

| Age Group | Churn Rate |
| --------- | ---------: |
| 36–45     |     26.53% |
| 26–35     |     30.28% |
| 46–55     |     24.11% |
| 18–25     |     23.19% |
| 56–65     |     26.19% |

### Q9. Churn Rate by Tenure Group

| Tenure Group | Churn Rate |
| ------------ | ---------: |
| 0–1 years    |    100.00% |
| 1–3 years    |     41.50% |
| 3–5 years    |     12.50% |
| 5–7 years    |      3.73% |
| 7+ years     |      0.00% |

### Q10. Churn Rate — Customers With vs Without Complaints

| Complaint Status   | Customers | Churned | Churn Rate |
| ------------------ | --------: | ------: | ---------: |
| Without Complaints |       339 |      80 |     23.60% |
| With Complaints    |       182 |      57 |     31.32% |

Customers with recorded complaints had a higher observed churn rate in this dataset.

This is an observed association and does **not** establish that complaints caused customers to churn.

### Q11. Average CSAT Score by Churn Status

Among customers with available CSAT information:

| Customer Status | Customers | Average CSAT |
| --------------- | --------: | -----------: |
| Churned         |        57 |        38.46 |
| Active          |       125 |        35.98 |

### Q12. Churned Customers by State

Selected results from the geographic analysis:

| State         | Customers | Churned | Churn Rate |
| ------------- | --------: | ------: | ---------: |
| Kathmandu     |        59 |      19 |     32.20% |
| Delhi         |        63 |      15 |     23.81% |
| Telangana     |        44 |      15 |     34.09% |
| Kerala        |        34 |      13 |     38.24% |
| Karnataka     |        32 |      10 |     31.25% |
| Uttar Pradesh |        39 |      10 |     25.64% |
| Meghalaya     |        24 |       9 |     37.50% |
| Tamil Nadu    |        24 |       7 |     29.17% |
| Punjab        |        27 |       6 |     22.22% |
| Gujarat       |        23 |       6 |     26.09% |

---

# 📊 Power BI Dashboard

An interactive **five-page Power BI dashboard** was developed using the prepared customer churn dataset.

### Page 1 — Churn Overview

Provides a high-level view of customer churn and overall customer status.

### Page 2 — Customer Demographics

Analyzes customer characteristics such as age, gender, and geography.

### Page 3 — Subscription & Tenure

Focuses on subscription types, plans, contracts, and customer tenure.

### Page 4 — Revenue & Churn Risk

Analyzes revenue-related metrics and customer churn-risk segments.

### Page 5 — Customer Support

Analyzes complaints, escalations, and customer satisfaction.

---

# 💡 Key Findings

### 📌 Overall Churn

The dataset contains **521 customers**, with an observed churn rate of **26.30%**.

### 📌 Tenure & Churn

Churn varied substantially across tenure groups.

The observed churn rate was:

* **100.00%** for customers with 0–1 years of tenure
* **41.50%** for 1–3 years
* **12.50%** for 3–5 years
* **3.73%** for 5–7 years
* **0.00%** for 7+ years

Average tenure was **1.68 years for churned customers** compared with **4.64 years for customers who had not churned**.

### 📌 Complaints & Churn

Customers with recorded complaints had an observed churn rate of **31.32%**, compared with **23.60%** among customers without recorded complaints.

### 📌 Plan-Level Differences

Observed churn rates were:

* Basic: **24.21%**
* Standard: **26.60%**
* Premium: **28.91%**

### 📌 Subscription-Type Differences

Observed churn rates were:

* Referral: **29.35%**
* Paid: **23.64%**
* Organic: **25.58%**

### 📌 Geographic Variation

The analysis showed differences in both churn counts and observed churn rates across states.

### 📌 Revenue

The analysis separates annualized revenue associated with active and churned customers, allowing churn to be examined from both customer-count and revenue perspectives.

---

# 🧠 Business Insights

Based on the observed patterns in the dataset, businesses could investigate:

* The early customer lifecycle and onboarding experience.
* Customer experience during the first few years of subscription.
* Complaint patterns and their relationship with churn.
* Customer satisfaction and support interactions.
* Differences between subscription and plan types.
* Geographic variation in observed churn.
* Revenue exposure associated with churn.

These observations describe patterns in the dataset and should be investigated further before being used for operational decisions.

---

# ⚠️ Limitations

* The dataset contains **521 customers**, so findings describe this dataset and should not automatically be generalized to a larger population.
* Some support-related variables are available only for customers with recorded support interactions.
* Observed relationships do not establish causation.
* The project is descriptive and does not constitute a predictive churn model.
* Some groups contain relatively small numbers of customers, so their observed churn rates should be interpreted carefully.
* Revenue figures shown as annualized revenue are calculated using `Monthly Charges × 12`.

---

# 🛠️ Tools & Technologies

* **Microsoft Excel** — Initial data source
* **Python** — Data cleaning, EDA & feature engineering
* **Pandas** — Data manipulation
* **NumPy** — Numerical operations
* **Matplotlib** — Data visualization
* **Seaborn** — Data visualization
* **MySQL** — Database management
* **SQL** — Business analysis
* **Power BI** — Interactive dashboard
* **Jupyter Notebook** — Python analysis
* **Git & GitHub** — Version control and project sharing

---

# 📁 Project Workflow

```text
Raw Excel Data
      ↓
Data Cleaning & Preparation
      ↓
Feature Engineering
      ↓
Exploratory Data Analysis
      ↓
MySQL Database
      ↓
SQL Business Analysis
      ↓
Power BI Dashboard
      ↓
Business Insights
```

---

# 📂 Project Structure

```text
customer-churn-analysis/
│
├── data/
│
├── python/
│
├── sql/
│
├── powerbi/
│
├── images/
│
├── .gitignore
│
└── README.md
```

> Folder names above should match the actual structure of the repository.

---

# 🚀 How to Run the Project

## 1. Clone the Repository

```bash
git clone https://github.com/Nabin-Roy-10/customer-churn-analysis.git
```

```bash
cd customer-churn-analysis
```

## 2. Install Python Dependencies

```bash
pip install pandas numpy matplotlib seaborn openpyxl sqlalchemy pymysql
```

## 3. Run the Python Analysis

Open the Python notebook/script and run the analysis from the appropriate project directory.

## 4. MySQL

Create the required MySQL database and configure the connection according to your local environment.

Then run the SQL queries included in the SQL folder.

## 5. Power BI

Open the `.pbix` dashboard file using **Power BI Desktop**.

If required, update the data-source connection and credentials for your local environment.

---



---

# 👨‍💻 Author

## Nabin Roy

Data Analytics Project

**GitHub:** [Nabin-Roy-10](https://github.com/Nabin-Roy-10)

---

# ⭐ Project Summary

This project demonstrates an end-to-end data analytics workflow:

**Excel → Python → MySQL → SQL → Power BI**

It covers:

* Data Cleaning
* Data Preparation
* Feature Engineering
* Exploratory Data Analysis
* SQL Business Analysis
* Customer Segmentation
* Churn Analysis
* Revenue Analysis
* Customer Support Analysis
* Data Visualization
* Power BI Dashboard Development
* Business Insights
