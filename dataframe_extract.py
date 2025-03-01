import psycopg2
import pandas as pd
from dotenv import load_dotenv
import os
import json
import pickle

load_dotenv()
dbname = os.getenv("DB_NAME")
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")


# Database connection parameters
db_config = {
    'dbname': dbname,
    'user': user,
    'password': password,
    'host': host,  # e.g., 'localhost' or an IP address
    'port': port   # default is usually 5432
}


analysis_tables = ["salary_to_department_analysis", 
                   "salary_to_tensure_analysis",
                   "performance_by_salary_analysis",
                   "high_performers_by_department",
                   "high_performers_by_country",
                   "high_performers_vs_regular_performers_analysis",
                   "department", 
                   "performance",
                   "country"]

df_dict = {}
for analysis_table in analysis_tables:
    
    print(analysis_table)
    query = f"SELECT * FROM {analysis_table};"
    try:
        conn = psycopg2.connect(**db_config)
        
        # Use pandas to load the query result into a DataFrame
        df = pd.read_sql_query(query, conn)
        df_dict[analysis_table] = df
        # Display the DataFrame
        #print(df)
        
    except Exception as e:
        print(f"An error occurred: {e}")
        
    finally:
        # Close the connection
        if conn:
            conn.close()

print(f"df_dict keys: {df_dict.keys()}")
with open("analysis_tables_dataframes.pkl", "wb") as file:  # 'wb' mode for writing binary
    pickle.dump(df_dict, file)