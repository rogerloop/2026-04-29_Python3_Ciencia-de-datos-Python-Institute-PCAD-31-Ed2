import os
import mysql.connector

from dotenv import load_dotenv
from mysql.connector import Error


# Cargar variables .env
load_dotenv()


def create_connection():

    try:

        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),
            port=os.getenv("DB_PORT"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            database=os.getenv("DB_NAME")
        )

        if connection.is_connected():

            print("✅ Conexión correcta a MySQL")

            return connection

    except Error as e:

        print(f"❌ Error conectando: {e}")

        return None