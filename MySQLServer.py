import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    try:
        # محاولة الاتصال بسيرفر MySQL
        connection = mysql.connector.connect(
            host='localhost',      # أو 127.0.0.1
            user='root',           # غيّرها لو اسم المستخدم مختلف
            password='1332006'  # ← حط كلمة المرور بتاعتك هنا
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # إنشاء قاعدة البيانات (لو مش موجودة)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
    
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # إغلاق الاتصال مهما حصل
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    create_database()
