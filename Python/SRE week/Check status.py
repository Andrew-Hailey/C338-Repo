import requests
import sys

url_string = "https://orderbookdev.computerlab.online"
response = requests.get(url_string, verify=False)
if response.status_code == 200:
    print("Landing page is OK")
else:
    print("Landing page is BROKEN")
    sys.exit(1)
