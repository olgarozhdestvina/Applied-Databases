# Olga Rozhdestvina
# Program that allows a user to interact with two databases: MySQL "world" and MondoDB "mongo"
# through a menu with 8 different options

# importing supporting libraries  
import mysql
import mongo

# defining a function that displays a main menu
def menu():
    print("\nWorld DB")
    print("--------\n")
    print("MENU")
    print("====")
    print("1 - View People")
    print("2 - View Countries by Independence Year")
    print("3 - Add New Person")
    print("4 - View Countries by Name")
    print("5 - View Countries by Population")
    print("6 - Find Students by Address")
    print("7 - Add New Course")
    print("x - Exit Application")

# defining a main function for interacting with a user
def main():
    # setting an infinite loop that only breaks if "x" is chosen
    while True:
        # displaying the menu
        menu()
        # requesting a choice from a user
        choice = input("Choice: ").strip()

        # if a user chose 1
        if choice == "1":
            # printing the heading 
            print("\n View People")
            print("--------------")
            i = 0
            # setting another infinite loop that only breaks if "q" is chosen
            while True:
                people = mysql.viewPeople(i)
                # iterating over a sequence of results 
                for person in people:
                    # printing the result in a structured format 
                    print(person["personID"], "|", person["personname"], "|", person["age"])
                print("-- Quit (q) --")
                x = input()
                # If any key but "q" is pressed the next 2 people in the database are shown 
                if x != "q":
                    i = i + 2 # to avoid repetion of the previously shown results
                else:
                    break

        # if a user chose 2
        elif choice == "2": 
            print("\n Countries by Independence Year")
            print("---------------------------------")
            # requesting from a user to input a year 
            iy = input("Enter Year: ")
            print("\n")
            countries = mysql.byIndepYear(iy)
            for country in countries:
                print(country["name"], "|", country["continent"], "|", country["indepYear"])
            print("\n")

        # if a user chose 3
        elif choice == "3":
            print("\n Add New Person")
            print("-----------------")
            # asking a user to enter name and age 
            name = input("Name: ").strip()
            age = input("Age: ").strip()
            mysql.addNewPerson(name, age)
            print("\n")

        # if a user chose 4
        elif choice == "4":
            print("\n Countries by Name")
            print("---------------------")
            # a user needs to enter a partial or full name of a country
            cn = input("Enter Country Name: ")
            print("\n")
            countries = mysql.byName(cn)
            for country in countries:
                print(country["Name"], "|", country["Continent"], "|", country["Population"], "|", country["HeadOfState"])
            print("\n")

        # if a user chose 5
        elif choice == "5":
            print("\n Countries by Pop")
            print("-------------------")
            try: 
                sym = None
                # creating a while loop that only intakes symbols "<", ">" or "="
                # if anything else is entered the loop requests the input again
                while sym != "<" and sym != ">" and sym != "=":
                    sym = input("Enter < > or = : ")
                # asking a user to input population 
                pop = int(input("Enter population: "))
                countries = mysql.byPop(sym, pop)
                for country in countries:
                    print(country["code"], "|", country["name"], "|", country["continent"], "|", country["population"])
                print("\n")
            # in case a user inputs anything but an integer 
            except ValueError:
                print("***ERROR***: population must be an integer")

        # if a user chose 6
        elif choice == "6":
            print("\n Find Students by Address")
            print("---------------------------")
            # calling for a function in mongo.py
            mongo.studByAddress()
            print("\n")

        # if a user chose 7
        elif choice == "7":
            print("\n Add New Course")
            print("-----------------")
            try:
                mongo.addCourse()
                print("\n")
            # in case a user inputs into level anything but an integer 
            except ValueError:
                print("***ERROR***: level must be an integer")
              
        # quit if a user selects "x"
        elif choice == "x":
            break


# in order to prevent this code from being run when the module is imported
if __name__ == "__main__":
    main()