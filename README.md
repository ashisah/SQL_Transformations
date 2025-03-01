# SQL_Transformations
Ingesting a csv into Postgres and normalizing it in SQL and creating relations for analysis.

<h4>Steps</h4>
<ul>
*note: must have Python 3 and Postgres set up and installed on your computer
    <li>Create a Postgres Database for ingesting csv<li>
    <li>Set up a .env file with appropriate fields (see settign up .env file)</li>
    <li>Run create_tables.sql</li>
    <li>Run python3 load_data_postgres</li>
    <li>Run insert_data.sql</li>
    <li>Run modify_employee_table.sql</li>
    <li>Run analysis_tables.sql</li>
    <li>Run dataframe_extract.py</li>
     <li>Run dataframe_analysis.py</li>
</ul>

<h4>Setup .env file</h4>
The .env file needs the following fields
<ul>
<li>DB_NAME: the name of the database</li>
<li>DB_USER: the username for Postgres</li>
<li>DB_PASSWORD: the password for Postgres</li>
<li>DB_HOST: the host (if running locally write localhost)</li>
<li>DB_PORT: the port number (Postgres uses 5432 by default)</li>
</ul>