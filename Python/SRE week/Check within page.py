import requests
import re
import sys

url_string = "https://orderbookdev.computerlab.online"
response = requests.get(url_string, verify=False)
found = re.search(r'Buy Order', str(response.content))
try:
    if found.group(0):
        print("Landing page is OK")
except:
    print("Landing page is BROKEN")
    sys.exit(1)
