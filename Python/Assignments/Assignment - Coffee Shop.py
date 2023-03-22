# Name: Andrew Hailey
# Date: 21/03/2023
Cost = 0
Tip = 1.15
while True:
    Size = str(input("What size cup would you like? (Small, Medium, Large) "))
    Size = Size.title()
    if Size == "Small":
        Cost += 2.00
        break
    elif Size == "Medium":
        Cost += 3.00
        break
    elif Size == "Large":
        Cost += 4.00
        break
    else:
        print("Unknown size, Please select one of the options")
        continue
while True:
    Coffee = str(
        input("What kind of coffee would you like? (Brewed, Espresso, Cold brew) "))
    Coffee = Coffee.title()
    if Coffee == "Espresso":
        Cost += 0.50
        break
    elif Coffee == "Cold brew":
        Cost += 1.00
        break
    elif Coffee == "Brewed":
        break
    else:
        print("Unknown Coffee, Please select one of the options")
        continue
while True:
    Flavour = str(
        input("What flavouring would you like, if any? (Hazelnut, Vanilla, Caramel, or None) "))
    Flavour = Flavour.title()
    if Flavour in ["Hazelnut", "Vanilla", "Caramel"]:
        Cost += 0.50
        print("You ordered a" + Size + " " + Coffee +
              " with a " + Flavour + " Syrup")
        break
    elif Flavour == "None":
        print("You ordered a" + Size + " " + Coffee + "Coffee.")
        break
    else:
        print("Unknown flavour, Please select one of the options")
        continue
print("Your cup of coffee costs $" + str(Cost) + ".")
print("The price is $" + str(Cost * Tip) + ".")
print("Thanks for your custom!")
