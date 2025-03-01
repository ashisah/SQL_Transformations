import pandas as pd

df = pd.read_csv('employee_data_clean.csv')

print(df['Performance Rating'].unique())