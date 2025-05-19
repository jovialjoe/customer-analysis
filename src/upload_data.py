import pandas as pd
from sqlalchemy import create_engine

df = pd.read_csv('C:/Users/jovij/OneDrive/Desktop/StackSports/dataset1/shopping_trends.csv')

engine = create_engine('postgresql://postgres:9S7M7VnMlHtd8XaaCPJW@stacksports.chy6eciuay8o.us-east-2.rds.amazonaws.com:5432/stacksports')

df.to_sql('sales_data', engine, if_exists='replace', index=False)