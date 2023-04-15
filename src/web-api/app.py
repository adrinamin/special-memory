import pymssql
from flask import Flask, jsonify

app = Flask(__name__)

# Database configuration
db_config = {
    'host': 'localhost',
    'user': 'sa',
    'password': 'Super@Admin123',
    'database': 'onlineStoreDb'
}

# API endpoint to retrieve data
@app.route('/data', methods=['GET'])
def get_data():
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
    return jsonify({'data': data})

if __name__ == '__main__':
    app.run()