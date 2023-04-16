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

@web_api.get("/products")
async def get_products():
    products = _retrieve_data("select * from products")

    # Return data as JSON response
    return jsonable_encoder(products)


@web_api.get("/customers")
async def get_customers():
    customers = _retrieve_data("select * from customers")

    return jsonable_encoder(customers) 


@web_api.get("/orders")
async def get_customers():
    customers = _retrieve_data("select * from orders")

    return jsonable_encoder(customers) 


def _retrieve_data(query: str):
    # Connect to database
    conn = pymssql.connect(**db_config)
    cursor = conn.cursor()
    
    # Execute SQL query to retrieve data
    cursor.execute(query)
    data = cursor.fetchall()

    # Close database connection
    conn.close()

    return data