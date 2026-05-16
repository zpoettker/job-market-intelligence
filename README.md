# Job Market Intelligence Platform

A full-stack data analytics platform that ingests real job posting data and surfaces insights through an interactive dashboard — built to demonstrate MySQL database design, query optimization, and Python data engineering.

## Overview

This project analyzes 100,000+ real job listings to answer questions like:
- What skills are most in demand right now?
- How do salaries vary by role, location, and company size?
- Which companies are hiring the most?
- How has demand for specific skills shifted over time?
- What does the remote vs. on-site breakdown look like?

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Database | MySQL 8.0 (Docker) |
| Backend | Python / Flask |
| Frontend | Python / Streamlit |
| Visualization | Plotly |
| Data Source | LinkedIn Job Postings (Kaggle, ~124k listings) |

## Database Highlights

- Normalized schema (3NF) with 6 core tables
- Indexed for analytical query performance
- Window functions for trend analysis and rankings
- CTEs for multi-step aggregations
- Views for pre-built dashboard queries
- Stored procedures for reusable business logic
- Full-text search on job descriptions

## Project Structure

```
├── database/
│   ├── schema.sql             # Table definitions
│   ├── indexes.sql            # Index strategy
│   ├── views.sql              # Analytical views
│   ├── stored_procedures.sql  # Reusable DB logic
│   └── seed/import.py         # Data ingestion script
├── backend/
│   ├── app.py                 # Flask entry point
│   ├── db.py                  # Database connection
│   └── routes/                # API endpoints
├── frontend/
│   └── dashboard.py           # Streamlit dashboard
├── docs/
│   └── er_diagram.png         # Entity-relationship diagram
├── data/                      # CSV files (git-ignored, see setup)
├── docker-compose.yml
└── requirements.txt
```

## Setup

### Prerequisites
- Docker
- Python 3.9+
- Kaggle account (for dataset)

### 1. Clone and configure
```bash
git clone https://github.com/zpoettker/job-market-intelligence.git
cd job-market-intelligence
cp .env.example .env
# Edit .env with your preferred credentials
```

### 2. Start the database
```bash
docker compose up -d
```

### 3. Install Python dependencies
```bash
pip install -r requirements.txt
```

### 4. Download the dataset
```bash
# Place your kaggle.json API key in the project root, then:
kaggle datasets download -d arshkon/linkedin-job-postings -p data/ --unzip
```

### 5. Load the schema and seed data
```bash
mysql -h 127.0.0.1 -P 3307 -u jobmarket -pjobmarket123 job_market < database/schema.sql
python database/seed/import.py
```

### 6. Run the app
```bash
# Terminal 1 — backend
python backend/app.py

# Terminal 2 — dashboard
streamlit run frontend/dashboard.py
```

## ER Diagram

_Coming soon_

## Sample Queries

_Coming soon as the analytics layer is built out_

## License

MIT
