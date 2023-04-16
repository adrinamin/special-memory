import pymssql
from fastapi import FastAPI
from fastapi.encoders import jsonable_encoder

web_api = FastAPI()

# Database configuration
db_config = {
    'host': 'localhost',
    'user': 'sa',
    'password': 'Super@Admin123',
    'database': 'onlineStoreDb'
}

@web_api.get("/")
async def root():
    # Connect to database
    conn = pymssql.connect(**db_config)
    cursor = conn.cursor()
    
    # Execute SQL query to retrieve data
    query = "SELECT * FROM products"
    cursor.execute(query)
    data = cursor.fetchall()

    # Close database connection
    conn.close()

    # Return data as JSON response
    return jsonable_encoder(data)

