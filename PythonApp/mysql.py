# Olga Rozhdestvina
# MySQL module for the main program

# importing MySQL library
import pymysql

# declaring a global variable outside functions
conn = None

# defining a function for connecting to the MySQL database "world"
def connect():
    global conn
    conn = pymysql.connect(host="localhost", user="root", password="root", db="world", cursorclass=pymysql.cursors.DictCursor)

# defining a function for viewing a list of people 
def viewPeople(n):
    # if not connected to the database, to connect 
    if not conn:
        connect()
    # writing a MySQL query to output a list of people in groups of two and avoids repetion of the previous results
    query = "SELECT * FROM person LIMIT 2 OFFSET %s"
    with conn:
        # exception handling block 
        try:
            # creating a database cursor
            cursor = conn.cursor()
            # executing the query first and then awating for a user's input
            cursor.execute(query, (n))
            # showing the results of the query
            return cursor.fetchall()
        # in case of an error
        except Exception as e:
            print("***ERROR***", e) 

# defining a function for viewing countries by independence year
def byIndepYear(iy):
    if not conn:
        connect()
    query = "SELECT name, continent, indepYear FROM country WHERE indepYear = %s"
    with conn:
        try:
            cursor = conn.cursor()
            cursor.execute(query, (iy))
            return cursor.fetchall()
        except Exception as e:
            print("***ERROR***:", e)

# defining a function for adding a new person to the database  
def addNewPerson(name, age):
    if not conn:
        connect()
    query = "INSERT INTO person (personname, age) VALUES (%s, %s)"
    with conn:
        try: 
            cursor = conn.cursor()
            cursor.execute(query, (name, age))
            conn.commit()
        # in case a user inputs an existing name 
        except pymysql.err.IntegrityError:
            print("***ERROR***:", name, "already exists")
        # in case of any other error
        except Exception as e:
            print("***ERROR***:", e)

# defining a function for viewing countries by name
def byName(cn):
    if not conn:
        connect()
    query = "SELECT * FROM country WHERE name LIKE %s"
    # by not including "with conn" statement the information is read from database only once
    try:
        cursor = conn.cursor()
        cursor.execute(query, ("%" + cn + "%"))
        return cursor.fetchall()
    except Exception as e:
        print("***ERROR***:", e)

# defining a function for viewing countries by population
def byPop(sym,pop):
    if not conn:
        connect()
    query2 = "SELECT code, name, continent, population FROM country WHERE population %s %s" % (sym, pop)
    # two format specifiers are mixed. Solution found here https://www.educative.io/edpresso/resolving-typeerror-not-all-arguments-converted-in-python
    try:
        cursor = conn.cursor()
        cursor.execute(query2)
        return cursor.fetchall()
    except Exception as e:
        print("***ERROR***:", e)