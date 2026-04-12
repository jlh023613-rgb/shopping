import mysql.connector
import codecs

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123456',
    database='shopping',
    charset='utf8mb4'
)

cursor = conn.cursor()

with codecs.open(r'c:\Users\35373\Desktop\编程\idea\shopping\src\main\resources\init-computer.sql', 'r', 'utf-8') as f:
    sql = f.read()

for statement in sql.split(';'):
    statement = statement.strip()
    if statement:
        try:
            cursor.execute(statement)
        except Exception as e:
            print(f"Error: {e}")
            print(f"Statement: {statement[:100]}...")

conn.commit()
cursor.close()
conn.close()
print("Done!")
