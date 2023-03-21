# Name: Andrew Hailey
# Date: 21/03/2023

FName = str(input("What is your first name?"))
LName = str(input("What is your last name?"))
City = str(input("Where do you live?"))
Wage = float(input("What is your hourly rate?"))
Hours = float(input("How many hours do you work a week?"))
Weekly = Wage * Hours
Monthly = Weekly * 4
Yearly = Weekly * 52

print("Hi, "+FName.title()+" "+LName.title()+"! How are you?")
print("I hope the weather is nice in "+City.title())
print("Based on the information you provided, you earn $"+str(Weekly) +
      " dollars per week, approximately $"+str(Monthly)+" dollars per month, and $"+str(Yearly)+" dollars per year.")
