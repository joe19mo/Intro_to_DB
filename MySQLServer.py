import mysql.connector

def create_database():
    connection = None
    try:
        # محاولة الاتصال بسيرفر MySQL
        connection = mysql.connector.connect(
            host='localhost',
            user='root',           # غيّر لو اسم المستخدم مختلف
            password='1332006'  # ← حط باسوردك هنا
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # إنشاء قاعدة البيانات (لو مش موجودة)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    create_database()

