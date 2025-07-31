🎬 DBT_Project_2 Analytics Pipeline

A full-stack dbt analytics pipeline transforming raw warehouse data into clean, BI-ready tables.
Demonstrates a workflow using DBeaver, Supabase, dbt, and VS Code, with optional Power BI integration and GitHub deployment.
🛠️ Tech Stack

    🐘 PostgreSQL via Supabase
    🐉 dbt (Data Build Tool) for data modeling & transformation
    💻 VS Code for development
    🛠️ DBeaver for ad-hoc SQL & database browsing
    🔗 Git & GitHub for version control
    📊 (Optional) Power BI for dashboard visualizations

📁 Project Structure

DBT_Project_2/
├── dbt_project.yml        # dbt project configuration
├── profiles.yml.example   # example dbt profiles.yml
├── models/
│   ├── staging/           # clean & standardize raw tables
│   └── marts/             # business logic & final reporting tables
├── snapshots/             # SCD snapshots for historical tracking
├── data/                  # seed CSVs for static lookup tables
├── macros/                # reusable SQL snippets & Jinja macros
├── analyses/              # ad-hoc analysis & exploration SQL
├── tests/                 # custom schema & data tests
├── requirements.txt       # Python dependencies
├── .gitignore             # files & folders to ignore
└── README.md              # this file

