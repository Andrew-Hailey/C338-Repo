# Name: Andrew Hailey
# Date: 21/03/2023

LName = str(input("What is your last name? "))
Character = LName.upper()[0]

if Character in ["A", "B", "C", "D"]:
    print("You are on the team 'Red Dragons'!")
elif Character in ["E", "F", "G", "H"]:
    print("You are on the team 'Dark Wizards'!")
elif Character in ["I", "J", "K", "L"]:
    print("You are on the team 'Moving Castles'!")
elif Character in ["M", "N", "O", "P"]:
    print("You are on the team 'Golden Snitches'!")
elif Character in ["Q", "R", "S", "T"]:
    print("You are on the team 'Night Guards'!")
elif Character in ["U", "V", "W", "X", "Y", "Z"]:
    print("You are on the team 'Black Holes'!")
print("Good luck in the games!")
