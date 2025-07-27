📦 **DBT_Project_2**

> A full-stack dbt analytics pipeline transforming raw warehouse data into clean, BI-ready tables.

---

### 🛠 Tech Stack

- 🐍 **Python 3.8+** – for scripting & packages  
- 🐘 **Data Warehouse** – PostgreSQL / Snowflake / BigQuery / Redshift  
- 🐉 **dbt Core** – SQL transformation framework  
- 💻 **VS Code** – development IDE  
- 🔧 **DBeaver** – database browsing & ad-hoc SQL  
- 🔗 **Git & GitHub** – version control & collaboration  

---

### 📂 Project Structure

DBT_Project_2/
├── analyses/ # Ad-hoc exploration & notebooks
├── data/ # Seed CSVs for static lookup tables
├── macros/ # Reusable SQL snippets & jinja macros
├── models/
│ ├── staging/ # 1_raw → 2_staging: clean & standardize source tables
│ ├── core/ # business logic & canonical entities
│ └── marts/ # final reporting tables for BI consumers
├── snapshots/ # SCD snapshots for historical tracking
├── tests/ # custom schema & data tests
├── dbt_project.yml # dbt configuration
├── profiles.yml.example # example connection profiles
├── requirements.txt # Python dependencies
└── README.md # this file

