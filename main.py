import logging

from faker import Faker
import random
import psycopg2
# from psycopg2 import DatabaseError

fake = Faker()

def execute_sql_from_file(filename, cursor):
    with open(filename, 'r') as file:
        sql_query = file.read()
        cursor.execute(sql_query)
        
def main():        
    # Подключение в БД
    conn = psycopg2.connect(host="localhost", database="postgres", user="postgres", password="mysecretpassword")
    cur = conn.cursor()

    # Добавление данных в таблицы
    # Группы
    for _ in range(3):
        cur.execute("INSERT INTO groups (name) VALUES (%s)", (fake.word(),))

    # Преподаватели
    for _ in range(3):
        cur.execute("INSERT INTO teachers (fullname) VALUES (%s)", (fake.name(),))

    # Предменты, принадлежность к преподователю 
    for teacher_id in range(1, 4):
        for _ in range(2):
            cur.execute("INSERT INTO subjects (name, teacher_id) VALUES (%s, %s)", (fake.word(), teacher_id))

    # Студенты и оценки студентов
    for group_id in range(1, 4):
        for _ in range(10):
            cur.execute("INSERT INTO students (fullname, group_id) VALUES (%s, %s) RETURNING id",
                        (fake.name(), group_id))
            student_id = cur.fetchone()[0]
            for subject_id in range(1, 7):
                for _ in range(3):
                    cur.execute("INSERT INTO grades (student_id, subject_id, grade, grade_date) VALUES (%s, %s, %s, %s)",
                                (student_id, subject_id, random.randint(0, 100), fake.date_this_decade()))

    
    #  SQL запросы
    query_files = [
        'query1.sql','query2.sql','query3.sql','query4.sql',
        'query5.sql','query6.sql','query7.sql',
        'query8.sql','query9.sql','query10.sql'
        ] 
    
    try:
        for file in query_files:
            execute_sql_from_file(file,cur)
            result = cur.fetchall()
            print(f"Result for '{file}':{result}")
        
        conn.commit()
    except psycopg2.Error as e:
        logging.error(e)
        conn.rollback()
    finally:
        if conn is not None:
            cur.close()
            conn.close()
            
if __name__ == "__main__":
    main()            