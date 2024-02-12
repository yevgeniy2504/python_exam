import mysql.connector

# Установка параметров подключения к базе данных
config = {
    'user': 'your_yevgeniy',
    'password': 'your_password',
    'host': '127.0.0.1',
    'database': 'your_database_name',
    'raise_on_warnings': True
}

try:
    # Подключение к базе данных
    cnx = mysql.connector.connect(**config)

    # Создание объекта Cursor для выполнения SQL-запросов
    cursor = cnx.cursor()

    # Пример выполнения SQL-запроса
    cursor.execute("SELECT * FROM your_table")

    # Получение результатов запроса
    rows = cursor.fetchall()
    for row in rows:
        print(row)

except mysql.connector.Error as err:
    print("Ошибка при подключении к базе данных:", err)

finally:
    # Закрытие курсора и соединения с базой данных
    if 'cursor' in locals():
        cursor.close()
    if 'cnx' in locals():
        cnx.close()
