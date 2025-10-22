import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Moustapha2001",
        )

        if mydb.is_connected():
            cursor = mydb.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database alx_book_store created successfully")
    except mysql.connector.Error as err:
        print('Error connecting to db',err)
    finally:
        if mydb.is_connected():
            cursor.close()
            mydb.close()
            print("MySQL connection closed")

if __name__ == "__main__":
    create_database()