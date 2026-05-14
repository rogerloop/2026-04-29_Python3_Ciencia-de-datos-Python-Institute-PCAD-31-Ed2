from db.connection import create_connection


def main():

    connection = create_connection()

    if connection:

        cursor = connection.cursor()

        cursor.execute("SELECT DATABASE();")

        result = cursor.fetchone()

        print(f"📦 Base de datos actual: {result[0]}")

        cursor.close()
        connection.close()

        print("🔒 Conexión cerrada")


if __name__ == "__main__":
    main()