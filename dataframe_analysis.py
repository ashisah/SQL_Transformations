import pickle
import pandas as pd
import matplotlib.pyplot as plt

with open("analysis_tables_dataframes.pkl", "rb") as file:  # 'rb' mode for reading binary
    df_dict = pickle.load(file)



def plot_analysis(df1_key, df2_key, merge_col, x_col, y_col, bar, x_lab, y_label, title):
    df1 = df_dict[df1_key]

    if(df2_key is not None):
        df2 = df_dict[df2_key]
        df1 = pd.merge(df1, df2 , on=merge_col, how = 'inner')
    
    print(x_col)
    print(y_col)
    
    if(bar):
        plt.bar(df1[x_col], df1[y_col])
    else:
        print(f"{df1_key}.sort_values({x_col})")
        df1 = df1.sort_values(x_col)
        plt.plot(df1[x_col], df1[y_col])
    
    plt.xlabel(x_lab)
    plt.xticks(rotation = 30)
    plt.ylabel(y_label)
    plt.title(title)
    plt.grid(True)
    plt.show()

plot_analysis('salary_to_tensure_analysis',
              None,
              None,
              'year_xp',
              'avg_salary',
              False,
              'Years of Experience',
              'Average Salary',
              'Avg. Salary by Years of Experience')

plot_analysis('salary_to_department_analysis',
              'department',
              'dept_id',
              'dept_name',
              'avg_salary',
              True,
              'Department',
              'Average Salary',
              'Average Salary by Department')

plot_analysis('performance_by_salary_analysis',
              'performance',
              'perf_rating_id',
              'perf_rating_name',
              'avg_salary',
              True,
              'Performance Rating',
              'Average Salary',
              'Average Salary by Performance Rating')

plot_analysis('high_performers_by_department', 
              'department', 
              'dept_id', 
              'dept_name', 
              'high_performers_percentage', 
              True, 
              'Department', 
              'Percentage of High Performers', 
              'Percentage of High Performers by Dept.')

plot_analysis('high_performers_by_country',
              'country',
              'country_id',
              'country_name',
              'high_performers_percentage',
              True,
              'Country',
              'High Performance Percentage',
              'Percentage of High Performers by Country')

plot_analysis('high_performers_by_country',
              'country',
              'country_id',
              'country_name',
              'high_performers_percentage',
              True,
              'Country',
              'High Performance Percentage',
              'Percentage of High Performers by Country')

#Plot for 6th analysis
import numpy as np

high_performers_vs_regular_performers_analysis = df_dict['high_performers_vs_regular_performers_analysis']
department = df_dict['department']
high_performers_vs_regular_performers_analysis = pd.merge(high_performers_vs_regular_performers_analysis, department, 
                                                          on = 'dept_id', how = 'inner')
x =  x = np.arange(len(high_performers_vs_regular_performers_analysis['dept_name'])) # x-axis positions	

y1 = high_performers_vs_regular_performers_analysis['avg_salary_all_employees']   # First attribute
y2 = high_performers_vs_regular_performers_analysis['avg_salary_high_performers'] # Second attribute
width = 0.35  # Width of the bars

# Plotting
plt.bar(x - width/2, y1, width, label='Average Salary all performers')
plt.bar(x + width/2, y2, width, label='Average Salary high Performers')
plt.xlabel('Department')
plt.ylabel('Values')
plt.title('Avg Salary of High Performers vs Avg Salary of All Performers Comparison')
plt.xticks(x, high_performers_vs_regular_performers_analysis['dept_name'], rotation = 30)  # Set x-axis labels
plt.legend()
plt.show()
