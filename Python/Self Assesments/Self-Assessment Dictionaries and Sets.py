# Name: Andrew Hailey
# Date: 24/03/2023

set = {"Jeff", "John", "Katie", "Sophie", "Mark"}
print(set)
print("to stop this program from running enter 'QUIT' when prompted for a Name")
while True:
    value = str(input("Enter a name: "))
    if value.upper() == "QUIT":
        break
    op = str(input("What operation would you like to perform? (Add or remove): "))
    if op.title() == "Add":
        for each in set:
            if value not in set:
                set.add(value.title())
                print(set)
                break
            elif value in set:
                print("this value is already in the set")
                break
    elif op.title() == "Remove":
        for each in set:
            if value in set:
                set.remove(value.title())
                print(set)
                break
            elif value not in set:
                print("this value is not in the set")
                break
    else:
        print("That's not a valid operation")
        continue
