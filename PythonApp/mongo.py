# Olga Rozhdestvina
# MongoDB module for the main program

# importing mongoDB library
import pymongo

# declaring a global variable outside functions
myclient = None

# defining a function for connecting to the MongoDB database "mongo"
def connect():
    global myclient
    myclient = pymongo.MongoClient()
    myclient.admin.command("ismaster")

# defining a function for viewing students by address
def studByAddress():
    # if not connected to the database, to connect 
    if not myclient:
        connect()
    db = myclient["proj20DB"]
    docs = db["docs"]
    # requesting an input of an address from a user 
    address = input("Enter address: ").title() # in case a user inputs the address with no capital letter 
    # writing a filter for a query to output students with qualifications
    filter = {"details.address": address, "qualifications": {"$exists": True}}
    # exception handling block 
    try:
        # full MongoDB query with the filter
        students = docs.find(filter)
        # iterating over a sequence of results
        for student in students:
            # printing the result in a structured format
            print(student["_id"], "|", student["details"]["name"], "|", student["details"]["age"], "|", student["qualifications"])
    except Exception as e:
        print(e)

    # writing a filter for a query to output students with no qualifications
    filter = {"details.address": address, "qualifications": {"$exists": False}}
    try:
        students = docs.find(filter)
        for student in students:
            print(student["_id"], "|", student["details"]["name"], "|", student["details"]["age"])
    except Exception as e:
        print(e)

# defining a function for adding a course to the database
def addCourse():
    if not myclient:
        connect()
    db = myclient["proj20DB"]
    docs = db["docs"]
    # asking a user to input id, name and level of a course
    id = input("_id: ").strip()
    name = input("Name: ").strip()
    level = int(input("Level: "))
    filter = [{"_id": id, "name": name, "level": level}]
    try:
        docs.insert(filter)
        print("Course with an id", id, "entered into the database")
    # in case a user inputs an id that already exists
    except pymongo.errors.DuplicateKeyError:
        print("***ERROR***: _id", id, "already exists")
    # in case of any other error
    except Exception as e:
        print("***ERROR***:", e)