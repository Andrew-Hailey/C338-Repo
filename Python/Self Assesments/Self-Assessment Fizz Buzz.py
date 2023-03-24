# Name: Andrew Hailey
# Date: 24/03/2023

import time
number = int(input("Enter a number: "))
count = 0

while count < number:
    if count % 3 == 0 and count % 5 == 0:
        print("fizz buzz")
        time.sleep(1)
    elif count % 3 == 0:
        print("fizz")
        time.sleep(1)
    elif count % 5 == 0:
        print("buzz")
        time.sleep(1)
    else:
        print(count)
        time.sleep(1)
    count += 1

print("TRADITION!!")
