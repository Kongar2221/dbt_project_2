# DBT_Project_2

> A simple, clean dbt project template for transforming raw data into an analytics-ready schema.

---

## 📋 Table of Contents

1. [Overview](#overview)  
2. [Tech Stack](#tech-stack)  
3. [Getting Started](#getting-started)  
   - [Prerequisites](#prerequisites)  
   - [Installation](#installation)  
4. [Project Structure](#project-structure)  
5. [How To Use](#how-to-use)  
   - [Run All Models](#run-all-models)  
   - [Run Specific Models](#run-specific-models)  
6. [Testing](#testing)  
7. [Snapshots](#snapshots)  
8. [Macros & Seeds](#macros--seeds)  
9. [Contributing](#contributing)  
10. [License](#license)  
11. [Contact](#contact)  

---

## Overview

This dbt project ingests raw data from your warehouse, applies cleaning and transformation steps, then builds analytics-ready tables and marts. It’s designed to be:

- **Modular**: Clear separation between staging, core, and marts  
- **Repeatable**: Fully automated with `dbt run` and `dbt test`  
- **Transparent**: Easy to inspect SQL, tests, and documentation  

---

## Tech Stack

- **dbt Core** — SQL-based transformation framework  
- **Python 3.8+** — for any custom scripting  
- **Your Data Warehouse** — Snowflake / BigQuery / Redshift / Postgres  

---

## Getting Started

### Prerequisites

- Python 3.8 or higher  
- Installed [dbt Core](https://docs.getdbt.com/docs/installation)  
- Access credentials for your warehouse  

### Installation

1. **Clone the repo**  
   ```bash
   git clone https://github.com/<your-org>/DBT_Project_2.git
   cd DBT_Project_2
