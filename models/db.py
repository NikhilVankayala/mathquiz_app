import mysql.connector
import os

def get_connection():
    """
    Establishes a connection to the MySQL database using environment variables.
    This allows the application to connect correctly in different environments
    (e.g., local development vs. GitHub Actions CI).
    """
    try:
        connection = mysql.connector.connect(
            # Use environment variables, with fallbacks for local development
            host=os.getenv('DB_HOST', 'localhost'), # Default to 'localhost' for local
            port=int(os.getenv('DB_PORT', 3306)),
            user=os.getenv('DB_USER', 'root'), # Default to 'root' for local
            password=os.getenv('DB_PASSWORD', ''), # Default to empty for local
            database=os.getenv('DB_NAME', 'mathquiz_app') # Default to 'mathquiz_app' for local
        )
        return connection
    except mysql.connector.Error as err:
        print(f"Error connecting to database: {err}")
        # Re-raise the exception to ensure test failures are propagated
        raise
