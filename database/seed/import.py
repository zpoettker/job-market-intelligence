# Reads the Kaggle CSV files from data/ and loads them into MySQL
import mysql.connector
import pandas as pd

conn = mysql.connector.connect(
    host="127.0.0.1",
    port=3307,
    user="jobmarket",
    password="jobmarket123",
    database="job_market"
)

df = pd.read_csv("data/archive/companies/companies.csv")

cursor = conn.cursor()